`timescale 1ns / 1ps

`include "defines.vh"
`include "alu_defines.vh"

module EXE(
    input logic          clk,
	input logic          rst,
    
    
	input wire           id_is_mult,
	input wire           id_stall,
	input wire           ex_flush,
	input wire [31:0]    mem_excepttype,

    // // input
    input logic [31 : 0] ex_rdata1_i,
    input logic [31 : 0] ex_rdata2_i,

    input logic [31 : 0] wb_wdata_i,
    input logic [31 : 0] mem_wdata_i,

    input logic [31 : 0] ex_hi_i,
    input logic [31 : 0] ex_lo_i,

    input logic [31 : 0] mem_hi_alu_out_i,
    input logic [31 : 0] wb_hi_alu_out_i,
    input logic [31 : 0] mem_lo_alu_out_i,
    input logic [31 : 0] wb_lo_alu_out_i,

    input logic [31 : 0] ex_sign_imm_i,
    input logic          use_imm_i,

    input logic [31 : 0] ex_cp0_data_i,
    input logic [4 : 0]  ex_sa_i,
    input logic [5 : 0]  ex_alucontrol_i,

    input logic [31 : 0] ex_pc_i,
    input logic          ex_jal_i,
    input logic          ex_jalr_i,
    input logic          ex_bal_i,
    input logic [4 : 0]  ex_rd_i,
    input logic          ex_regdst_i,
    input logic          ex_start_i,

    input logic [4:0]    ex_rs_i,
    input logic [4:0]    ex_rt_i,

	input logic [4:0]    mem_waddr_i,
	input logic          mem_we_i,
	input logic [4:0]    wb_waddr_i,
	input logic          wb_we_i,

    input logic [1:0]    ex_hilo_we_i,
    input logic [1:0]    mem_hilo_we_i,
    input logic [1:0]    wb_hilo_we_i,

    input logic [4:0]    mem_rd_i,
	input logic          mem_wcp0_i,

    output logic [31 : 0] rdata2_o,
    output logic          ov_o,
    output logic [31 : 0] exe_aluout_o,
    output logic [4 : 0]  ex_waddr_o,
    output logic          ex_ready_o,
    output logic [31 : 0] ex_hi_data_o,
    output logic [31 : 0] ex_lo_data_o,

    output logic          ex_mult_stall//qf
    );

    // not used 
    logic [31 : 0]        rdata1_o;
    logic [31 : 0]        ex_reg_imm_o;
    logic [31 : 0]        ex_cp0data;
    logic [31 : 0]        ex_hi2;
    logic [31 : 0]        ex_lo2;
    logic [31 : 0]        ex_aluout;
    logic [31 : 0]        ex_hi_alu_out;
    logic [31 : 0]        ex_lo_alu_out;
    logic [4  : 0]        writereg1E;
    logic [31 : 0]        hi_div_outE;
    logic [31 : 0]        lo_div_outE;
    logic                 div_signalE;
	    
    assign {ex_hi2,ex_lo2} = (ex_hilo_we_i==2'b00 & (mem_hilo_we_i==2'b10 | mem_hilo_we_i==2'b01 | mem_hilo_we_i==2'b11)) ? {mem_hi_alu_out_i,mem_lo_alu_out_i}: 
						     (ex_hilo_we_i==2'b00 & (wb_hilo_we_i ==2'b10 | wb_hilo_we_i==2'b01  | wb_hilo_we_i ==2'b11)) ? {wb_hi_alu_out_i,wb_lo_alu_out_i} : {ex_hi_i,ex_lo_i};

    assign ex_reg_imm_o = use_imm_i==1'b1 ? ex_sign_imm_i : rdata2_o;

    assign ex_cp0data = ((ex_rd_i!=0)&(ex_rd_i == mem_rd_i)&(mem_wcp0_i)) ? mem_wdata_i : ex_cp0_data_i;

    assign exe_aluout_o = (ex_jal_i | ex_jalr_i | ex_bal_i) ?  ex_pc_i+8 : ex_aluout;

    assign writereg1E = ex_regdst_i==1'b1 ? ex_rd_i : ex_rt_i;

    assign ex_waddr_o = (ex_bal_i | ex_jal_i) ? 5'b11111: writereg1E;

	assign div_signalE = ((ex_alucontrol_i == `DIV_CONTROL)|(ex_alucontrol_i == `DIVU_CONTROL))? 1 : 0;

    assign ex_hi_data_o = div_signalE ? hi_div_outE : ex_hi_alu_out;
    
    assign ex_lo_data_o = div_signalE ? lo_div_outE : ex_lo_alu_out;

    exe_reg_harzrd exe_exe_reg_harzrd (
        // 用于读取的地址和数据
        .rst_i(rst),

        .reg_addr1_i(ex_rs_i),
        .reg_addr2_i(ex_rt_i),

        .reg_data1_i(ex_rdata1_i),
        .reg_data2_i(ex_rdata2_i),

        .mem_we_i(mem_we_i),
        .mem_waddr_i(mem_waddr_i),
        .mem_wdata_i(mem_wdata_i),

        .wb_we_i(wb_we_i),
        .wb_waddr_i(wb_waddr_i),
        .wb_wdata_i(wb_wdata_i),

        .rdata1_o(rdata1_o),
        .rdata2_o(rdata2_o)
    );

	alu alu(
        .clk_i          (clk),
        .rst_i          (rst),

        .id_is_mult     (id_is_mult),
	    .id_stall       (id_stall),
	    .ex_flush       (ex_flush),
	    .mem_excepttype (mem_excepttype),
        .reg1_i         (rdata1_o),
        .reg2_i         (ex_reg_imm_o),
        .sa             (ex_sa_i),
        .alucontrol     (ex_alucontrol_i),
        .hi_in          (ex_hi2),
        .lo_in          (ex_lo2),
        .cp0_reg_data_i (ex_cp0data),
        
        .wdata_o        (ex_aluout),
        .ov             (ov_o),
        .hi_alu_out     (ex_hi_alu_out),
        .lo_alu_out     (ex_lo_alu_out),
        .mult_stallE    (ex_mult_stall)
    );

	divider_32clock divider_32clock (
        .clk            (clk),
        .rst            (rst),

        .op             (ex_alucontrol_i),

        .opdata1_i      (rdata1_o),
        .opdata2_i      (ex_reg_imm_o),

        .annul_i        (1'b0),

        .result_o       ({hi_div_outE,lo_div_outE}),

        .ready_o        (ex_ready_o),
        .start_i        (ex_start_i)
    );
endmodule


// logic signed_div;
// logic [31:0] sign_hi_div_outE;
// logic [31:0] sign_lo_div_outE;
// logic [31:0] unsign_hi_div_outE;
// logic [31:0] unsign_lo_div_outE; 
// assign signed_div = (ex_alucontrol_i == `DIV_CONTROL ) ?1'b1:
//                     (ex_alucontrol_i == `DIVU_CONTROL) ?1'b0:1'bx;
// sign_div_radix2 sign_div_radix2 (
//   .aclk(clk),                                      // input wire aclk
    
//   .s_axis_divisor_tvalid(ex_start_i),    // input wire s_axis_divisor_tvalid
//   .s_axis_divisor_tdata(ex_reg_imm_o),      // input wire [31 : 0] s_axis_divisor_tdata
    
//   .s_axis_dividend_tvalid(ex_start_i),  // input wire s_axis_dividend_tvalid
//   .s_axis_dividend_tdata(rdata1_o),    // input wire [31 : 0] s_axis_dividend_tdata
    
//   .m_axis_dout_tvalid(ex_ready_o),          // output wire m_axis_dout_tvalid
//   .m_axis_dout_tdata({sign_lo_div_outE,sign_hi_div_outE})            // output wire [63 : 0] m_axis_dout_tdata
// );
// unsign_div_radix2 unsign_div_radix2 (
//   .aclk(clk),                                      // input wire aclk
    
//   .s_axis_divisor_tvalid(ex_start_i),    // input wire s_axis_divisor_tvalid
//   .s_axis_divisor_tdata(ex_reg_imm_o),      // input wire [31 : 0] s_axis_divisor_tdata

//   .s_axis_dividend_tvalid(ex_start_i),  // input wire s_axis_dividend_tvalid
//   .s_axis_dividend_tdata(rdata1_o),    // input wire [31 : 0] s_axis_dividend_tdata
    
//   .m_axis_dout_tvalid(ex_ready_o),          // output wire m_axis_dout_tvalid
//   .m_axis_dout_tdata({unsign_lo_div_outE,unsign_hi_div_outE})            // output wire [63 : 0] m_axis_dout_tdata
// );
// assign {hi_div_outE,lo_div_outE} = signed_div==1'b1 ? {sign_hi_div_outE,sign_lo_div_outE} : {unsign_hi_div_outE,unsign_lo_div_outE};