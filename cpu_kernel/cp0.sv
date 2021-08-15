`timescale 1ns / 1ps

`include "defines.vh"
`include "cp0_defines.vh"
`include "compile_options.vh"

module cp0(
    input  logic            clk,
    input  logic            rst,

    input  logic            we_i,
    input  logic [4:0]      waddr_i,
    input  logic [4:0]      raddr_i,
    input  logic [`RegBus]  data_i,

    input  logic [5:0]      int_i,

    input  logic [`RegBus]  excepttype_i,
    input  logic [`RegBus]  current_inst_addr_i,
    input  logic            is_in_delayslot_i,
    input  logic [`RegBus]  bad_addr_i,

    output logic [`RegBus]  data_o,
    output logic [`RegBus]  count_o,
    (* mark_debug = "true" *) output logic [`RegBus]  status_o,
    (* mark_debug = "true" *) output logic [`RegBus]  cause_o,
    (* mark_debug = "true" *) output logic [`RegBus]  epc_o,
    output logic [`RegBus]  config_o,
    output logic [`RegBus]  ebase_o,
    input  logic [2:0]      cp0_sel,
    input  logic [3:0]      tlbcmd,
    output logic [`RegBus]  index_o,
    output logic [`RegBus]  random_o,
    output logic [`RegBus]  pagemask_o,
    output logic [`RegBus]  entrylo0_o,
    output logic [`RegBus]  entrylo1_o,
    output logic [`RegBus]  entryhi_o,
    input  logic [`RegBus]  index_i,
    input  logic [`RegBus]  pagemask_i,
    input  logic [`RegBus]  entrylo0_i,
    input  logic [`RegBus]  entrylo1_i,
    input  logic [`RegBus]  entryhi_i,
    input  logic            mem_we
    );

    logic one_bit_counter;
    logic timer_int_o;
    logic [`RegBus] badvaddr;
    logic [`RegBus] compare_o;
    logic [`RegBus] context_o;
    logic [`RegBus] wired_o;
    logic [`RegBus] prid_o;

    always_ff @(posedge clk) begin
        if(rst) begin
            one_bit_counter <= 1'b0;
            timer_int_o <= 1'b0;
            index_o <= `ZeroWord;
            random_o <= `TLB_LINE - 1;
            entrylo0_o <= `ZeroWord;
            entrylo1_o <= `ZeroWord;
            context_o <= `ZeroWord;
            pagemask_o <= `ZeroWord;
            wired_o <= `ZeroWord;
            badvaddr <= `ZeroWord;
            count_o <= `ZeroWord;
            entryhi_o <= `ZeroWord;
            compare_o <= `ZeroWord;
            status_o <= 32'b0001_00_0_00_1_0_0_0000_00000000_000_00_0_0_0;
            cause_o <= `ZeroWord;
            epc_o <= `ZeroWord;
            prid_o <= `ZeroWord;
            ebase_o <= 32'h80000000;
            config_o <= 32'b00000000000000001000000000000011; // kseg0 should set to cached to avoid debuff on perf test
        end else begin
            one_bit_counter <= ~one_bit_counter;
            count_o <= count_o + one_bit_counter;
            if(compare_o != `ZeroWord && count_o == compare_o) 
                timer_int_o <= 1'b1; // 在手动清除之前保持硬件中断
            cause_o[15:10] <= {timer_int_o,int_i[4:0]}; // IM2-IM7 硬件中断
            random_o <= (random_o == wired_o) ? `TLB_LINE-1 : (random_o - 1);
            if(we_i) begin
                case (waddr_i)
                    `CP0_INDEX: begin
                        index_o <= data_i[`TLB_WIDTH-1:0];
                    end
                    // skip random
                    `CP0_ENTRY_LO0: begin
                        entrylo0_o <= {1'b0,data_i[30:0]};
                    end
                    `CP0_ENTRY_LO1: begin
                        entrylo1_o <= {1'b0,data_i[30:0]};
                    end
                    `CP0_CONTEXT: begin
                        context_o <= data_i;
                    end
                    `CP0_PAGEMASK: begin
                        pagemask_o <= {3'b000,data_i[28:13],13'd0};
                    end
                    `CP0_WIRED: begin
                        index_o <= data_i[`TLB_WIDTH-1:0];
                        random_o <= `TLB_LINE-1;
                    end
                    // skip badva, count
                    `CP0_ENTRY_HI: begin
                        entryhi_o <= {data_i[31:13],5'd0,data_i[7:0]};
                    end
                    `CP0_COMPARE: begin
                        compare_o <= data_i;
                        timer_int_o <= 1'b0;
                    end
                    `CP0_STATUS:begin
                        if (cp0_sel == `CP0_SEL_STATUS) begin
                            status_o <= {
                                6'd0,
                                data_i[`CP0_STATUS_RE],
                                2'd0,
                                data_i[`CP0_STATUS_BEV],
                                6'd0,
                                data_i[`CP0_STATUS_IM],
                                3'd0,
                                data_i[`CP0_STATUS_KSU],
                                data_i[`CP0_STATUS_ERL],
                                data_i[`CP0_STATUS_EXL],
                                data_i[`CP0_STATUS_IE]
                            };
                        end
                        status_o <= data_i;
                    end
                    `CP0_CAUSE: begin
                        cause_o[`CP0_CAUSE_SOFTIRQ] <= data_i[`CP0_CAUSE_SOFTIRQ];
                        cause_o[`CP0_CAUSE_IV] <= data_i[`CP0_CAUSE_IV]; // not implement
                        cause_o[`CP0_CAUSE_DC] <= data_i[`CP0_CAUSE_DC]; // not implement
                    end
                    `CP0_EPC: begin
                        epc_o <= data_i;
                    end
                    `CP0_PRID_AND_EBASE: begin
                        // skip prid
                        if (cp0_sel == `CP0_SEL_EBASE) ebase_o[29:12] <= data_i[29:12];
                    end
                    `CP0_CONFIG: begin
                        if (cp0_sel == `CP0_SEL_CONFIG0) config_o[2:0] <= data_i[2:0];
                    end
                endcase
            end
            if (excepttype_i != 0) begin
                status_o[`CP0_STATUS_EXL] <= (excepttype_i != `EXC_ERET); // eret的时候需要清空exl
                if (excepttype_i != `EXC_ERET) begin
                    epc_o <= is_in_delayslot_i ? current_inst_addr_i - 4 : current_inst_addr_i;
                    cause_o[`CP0_CAUSE_BD] <= is_in_delayslot_i;
                end
                case (excepttype_i)
                    `EXC_INT:       cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_IRQ;
                    `EXC_DATA_MODIFY: begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_MOD;
                        badvaddr <= data_i;
                        entryhi_o <= {data_i[31:13],entryhi_o[12:0]};
                        context_o <= {context_o[31:23],data_i[31:13],4'd0};
                    end
                    `EXC_INST_REFILL, `EXC_INST_INVALID: begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_TLBL;
                        badvaddr <= current_inst_addr_i;
                        entryhi_o <= {current_inst_addr_i[31:13],entryhi_o[12:0]};
                        context_o <= {context_o[31:23],current_inst_addr_i[31:13],4'd0};
                    end
                    `EXC_DATA_REFILL, `EXC_DATA_INVALID: begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_TLBL + mem_we;
                        badvaddr <= data_i;
                        entryhi_o <= {data_i[31:13],entryhi_o[12:0]};
                        context_o <= {context_o[31:23],data_i[31:13],4'd0};
                    end
                    `EXC_INST_ADD_ERR, `EXC_DATA_ADD_ERR_L :begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_ADEL;
                        badvaddr <= bad_addr_i;
                    end
                    `EXC_DATA_ADD_ERR_S:begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_ADES;
                        badvaddr <= bad_addr_i;
                    end
                    `EXC_SYSCALL:   cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_SYS;
                    `EXC_BREAK:     cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_BP;
                    `EXC_RI:        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_RI;
                    `EXC_OVF:       cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_OVF;
                    `EXC_TRAP:      cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_TR;
                endcase
            end
            else begin
                if (tlbcmd[3]) begin // TLBP
                    index_o <= index_i;
                end
                if (tlbcmd[2]) begin // TLBR
                    pagemask_o <= pagemask_i;
                    entryhi_o <= entryhi_i;
                    entrylo0_o <= entrylo0_i;
                    entrylo1_o <= entrylo1_i;
                end
            end
        end
    end

    always_comb begin
        if(rst) begin
            data_o = 32'd0;
        end else begin
            case (raddr_i)
                `CP0_INDEX:     data_o = index_o;
                `CP0_RANDOM:    data_o = random_o;
                `CP0_ENTRY_LO0: data_o = entrylo0_o;
                `CP0_ENTRY_LO1: data_o = entrylo1_o;
                `CP0_CONTEXT:   data_o = context_o;
                `CP0_PAGEMASK:  data_o = pagemask_o;
                `CP0_WIRED:     data_o = wired_o;
                `CP0_BADVADDR:  data_o = badvaddr;
                `CP0_COUNT:     data_o = count_o;
                `CP0_ENTRY_HI:  data_o = entryhi_o;
                `CP0_COMPARE:   data_o = compare_o;
                `CP0_STATUS:    case(cp0_sel)
                    `CP0_SEL_STATUS:    data_o = status_o;
                    default:            data_o = 32'd0;
                endcase
                `CP0_CAUSE:     data_o = cause_o;
                `CP0_EPC:       data_o = epc_o;
                `CP0_PRID_AND_EBASE:    case(cp0_sel)
                    `CP0_SEL_PRID:      data_o = prid_o;
                    `CP0_SEL_EBASE:     data_o = ebase_o;
                    default:            data_o = 32'd0;
                endcase
                `CP0_CONFIG:            case(cp0_sel)
                    `CP0_SEL_CONFIG0:   data_o = `CP0_SEL_CONFIG0;
                    default:            data_o = 32'd0;
                endcase
                default:            data_o = 32'd0;
            endcase
        end
    end
endmodule
