`timescale 1ns / 1ps

`include "defines.vh"
`include "cp0_defines.vh"

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
    output logic [`RegBus]  ebase_o
    );

    logic one_bit_counter;
    logic [`RegBus] timer_int_o;
    logic [`RegBus] badvaddr;
    logic [`RegBus] compare_o;

    always_ff @(posedge clk) begin
        if(rst == `RstEnable) begin
            one_bit_counter <= 1'b0;
            count_o <= `ZeroWord;
            compare_o <= `ZeroWord;
            badvaddr <= `ZeroWord;
            status_o <= 32'b0001_00_0_00_1_0_0_0000_00000000_000_00_0_0_0;
            cause_o <= `ZeroWord;
            epc_o <= `ZeroWord;
            config_o <= 32'b00000000000000001000000000000011;
            ebase_o <= 32'h80000000;
            timer_int_o <= `InterruptNotAssert;
        end else begin
            count_o <= count_o + one_bit_counter;
            one_bit_counter <= ~one_bit_counter;
            cause_o[15:10] <= {timer_int_o,int_i[4:0]}; // IM2-IM7 硬件中断
            if(compare_o != `ZeroWord && count_o == compare_o) begin
                timer_int_o <= `InterruptAssert;
            end
            if(we_i == `WriteEnable) begin
                case (waddr_i)
                    `CP0_COUNT:begin
                        count_o <= data_i;
                    end
                    `CP0_COMPARE:begin
                        compare_o <= data_i;
                        timer_int_o <= `InterruptNotAssert;
                    end
                    `CP0_STATUS:begin
                        status_o <= data_i;
                    end
                    `CP0_CAUSE:begin
                        cause_o[`CP0_CAUSE_SOFTIRQ] <= data_i[`CP0_CAUSE_SOFTIRQ];
                        cause_o[`CP0_CAUSE_IV] <= data_i[`CP0_CAUSE_IV];
                        cause_o[`CP0_CAUSE_DC] <= data_i[`CP0_CAUSE_DC];
                    end
                    `CP0_EPC:begin
                        epc_o <= data_i;
                    end
                endcase
            end
            if (excepttype_i != 0) begin
                status_o[`CP0_STATUS_EXL] <= (excepttype_i != `EXC_ERET); // eret的时候需要清空exl
                if (excepttype_i != `EXC_ERET) begin
                    if(is_in_delayslot_i == `InDelaySlot) begin
                        epc_o <= current_inst_addr_i - 4;
                        cause_o[`CP0_CAUSE_BD] <= 1'b1;
                    end else begin
                        epc_o <= current_inst_addr_i;
                        cause_o[`CP0_CAUSE_BD] <= 1'b0;
                    end
                end
                case (excepttype_i)
                    `EXC_INT:begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_IRQ;
                    end
                    `EXC_INST_ADD_ERR, `EXC_DATA_ADD_ERR_L :begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_ADEL;
                        badvaddr <= bad_addr_i;
                    end
                    `EXC_DATA_ADD_ERR_S:begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_ADES;
                        badvaddr <= bad_addr_i;
                    end
                    `EXC_SYSCALL:begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_SYS;
                    end
                    `EXC_BREAK:begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_BP;
                    end
                    `EXC_RI:begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_RI;
                    end
                    `EXC_OVF:begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_OVF;
                    end
                    `EXC_TRAP: begin
                        cause_o[`CP0_CAUSE_EXCCODE] <= `EXCCODE_TR;
                    end
                endcase
            end
        end
    end

    always_comb begin
        if(rst == `RstEnable) begin
            data_o <= `ZeroWord;
        end else begin
            case (raddr_i)
                `CP0_COUNT:begin
                    data_o <= count_o;
                end
                `CP0_COMPARE:begin
                    data_o <= compare_o;
                end
                `CP0_STATUS:begin
                    data_o <= status_o;
                end
                `CP0_CAUSE:begin
                    data_o <= cause_o;
                end
                `CP0_EPC:begin
                    data_o <= epc_o;
                end
                `CP0_CONFIG:begin
                    data_o <= config_o;
                end
                `CP0_BADVADDR:begin
                    data_o <= badvaddr;
                end
                default : begin
                    data_o <= `ZeroWord;
                end
            endcase
        end

    end
endmodule
