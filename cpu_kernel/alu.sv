
`timescale 1ns / 1ps

`include "defines.vh"
`include "alu_defines.vh"

module alu(
	input wire          clk_i,
	input wire          rst_i,

	input wire          id_is_mult,
	input wire          id_stall,
	input wire          ex_flush,
	input wire [31:0]   mem_excepttype,

	input wire [31:0]   reg1_i,
	input wire [31:0]   reg2_i,

	input wire [4:0]    sa,
	input wire [5:0]    alucontrol,

	input wire [31:0]   hi_in,
	input wire [31:0]   lo_in,
	input wire [31:0]   cp0_reg_data_i,

	output wire [31:0]  wdata_o,
	output wire         ov,
	output wire [31:0]  hi_alu_out,
	output wire [31:0]  lo_alu_out,
	output wire			trap_result,

	output wire         mult_stallE  //qf
    );

	wire [63:0] alu_out_signed_mult;
	wire [63:0] alu_out_unsigned_mult;
	// the result of clo and clz
	wire [31:0] clz_result;
	wire [31:0] clo_result;
    // if reg1_i = 32'h00000000 then clz_result = 32
	assign clz_result = 
                reg1_i[31] ?  0 : reg1_i[30] ?  1 : reg1_i[29] ?  2 : 
                reg1_i[28] ?  3 : reg1_i[27] ?  4 : reg1_i[26] ?  5 : 
                reg1_i[25] ?  6 : reg1_i[24] ?  7 : reg1_i[23] ?  8 : 
                reg1_i[22] ?  9 : reg1_i[21] ? 10 : reg1_i[20] ? 11 : 
                reg1_i[19] ? 12 : reg1_i[18] ? 13 : reg1_i[17] ? 14 : 
                reg1_i[16] ? 15 : reg1_i[15] ? 16 : reg1_i[14] ? 17 : 
                reg1_i[13] ? 18 : reg1_i[12] ? 19 : reg1_i[11] ? 20 : 
                reg1_i[10] ? 21 : reg1_i[ 9] ? 22 : reg1_i[ 8] ? 23 : 
                reg1_i[ 7] ? 24 : reg1_i[ 6] ? 25 : reg1_i[ 5] ? 26 : 
                reg1_i[ 4] ? 27 : reg1_i[ 3] ? 28 : reg1_i[ 2] ? 29 : 
                reg1_i[ 1] ? 30 : reg1_i[ 0] ? 31 : 32;
	// if reg1_i = 32'hFFFFFFFF then clo_result = 32
	assign clo_result = 
                ~reg1_i[31] ?  0 : ~reg1_i[30] ?  1 : ~reg1_i[29] ?  2 : 
                ~reg1_i[28] ?  3 : ~reg1_i[27] ?  4 : ~reg1_i[26] ?  5 : 
                ~reg1_i[25] ?  6 : ~reg1_i[24] ?  7 : ~reg1_i[23] ?  8 : 
                ~reg1_i[22] ?  9 : ~reg1_i[21] ? 10 : ~reg1_i[20] ? 11 : 
                ~reg1_i[19] ? 12 : ~reg1_i[18] ? 13 : ~reg1_i[17] ? 14 : 
                ~reg1_i[16] ? 15 : ~reg1_i[15] ? 16 : ~reg1_i[14] ? 17 : 
                ~reg1_i[13] ? 18 : ~reg1_i[12] ? 19 : ~reg1_i[11] ? 20 : 
                ~reg1_i[10] ? 21 : ~reg1_i[ 9] ? 22 : ~reg1_i[ 8] ? 23 : 
                ~reg1_i[ 7] ? 24 : ~reg1_i[ 6] ? 25 : ~reg1_i[ 5] ? 26 : 
                ~reg1_i[ 4] ? 27 : ~reg1_i[ 3] ? 28 : ~reg1_i[ 2] ? 29 : 
                ~reg1_i[ 1] ? 30 : ~reg1_i[ 0] ? 31 : 32;		

	assign wdata_o =alucontrol== `AND_CONTROL   ? (reg1_i & reg2_i)   : 
			alucontrol== `OR_CONTROL    ? (reg1_i | reg2_i)   :
			alucontrol== `XOR_CONTROL   ? (reg1_i ^ reg2_i)   :
			alucontrol== `NOR_CONTROL   ? (~(reg1_i | reg2_i)):

			alucontrol== `ADD_CONTROL   ? (reg1_i + reg2_i) :
			alucontrol== `ADDU_CONTROL  ? (reg1_i + reg2_i) :
			alucontrol== `SUB_CONTROL   ? (reg1_i - reg2_i)  :
			alucontrol== `SUBU_CONTROL  ? (reg1_i - reg2_i)  :

			alucontrol== `SLT_CONTROL   ? (($signed(reg1_i)<$signed(reg2_i))? 1 : 0) :
			alucontrol== `SLTU_CONTROL  ? (reg1_i<reg2_i)                            :
			alucontrol== `LUI_CONTROL   ? ({reg2_i[15:0], 16'b0})                    :

			alucontrol== `SLL_CONTROL   ? (reg2_i << sa)                                                             :
			alucontrol== `SRL_CONTROL   ? (reg2_i >> sa)                                                             :
			alucontrol== `SRA_CONTROL   ? (({32{reg2_i[31]}} << (6'd32-{1'b0,sa})) | reg2_i >> sa)                   :
			alucontrol== `SLLV_CONTROL  ? (reg2_i << reg1_i[4:0])                                                    :
			alucontrol== `SRLV_CONTROL  ? (reg2_i >> reg1_i[4:0])                                                    :
			alucontrol== `SRAV_CONTROL  ? (({32{reg2_i[31]}} << (6'd32-{1'b0,reg1_i[4:0]})) | reg2_i >> reg1_i[4:0]) :

			alucontrol== `MFHI_CONTROL  ? (hi_in[31:0])    :
			alucontrol== `MFLO_CONTROL  ? (lo_in[31:0])    :
			alucontrol== `MFC0_CONTROL  ? (cp0_reg_data_i) :
			alucontrol== `MTC0_CONTROL  ? (reg2_i)         :   
			alucontrol== `CLO_CONTROL   ? (clo_result)     :
			alucontrol== `CLZ_CONTROL   ? (clz_result) 	   : 
			alucontrol== `MUL_CONTROL   ? (alu_out_signed_mult[31:0]): 32'b0 ;

//////////////////////////////////////////trap/////////////////////////////////////////
	wire trap_eq, trap_ge, trap_geu;
	assign trap_eq  = (reg1_i == reg2_i) ? 1 : 0;
	assign trap_ge  = ($signed(reg1_i) < $signed(reg2_i)) ? 0 : 1;
	assign trap_geu = (reg1_i < reg2_i) ? 0 : 1;

	assign trap_result = (alucontrol == `TEQ_CONTROL)  && trap_eq   || 
						 (alucontrol == `TGE_CONTROL)  && trap_ge   ||
						 (alucontrol == `TGEU_CONTROL) && trap_geu  ||
						 (alucontrol == `TLT_CONTROL)  && !trap_ge  ||
						 (alucontrol == `TLTU_CONTROL) && !trap_geu ||
						 (alucontrol == `TNE_CONTROL)  && !trap_eq;

///////////////////////////////////////////multiply////////////////////////////////////
	reg [3:0] cnt;

	wire mult_sign;
	wire mult_valid;

	assign mult_sign = (alucontrol == `MULT_CONTROL) |
					   (alucontrol == `MADD_CONTROL) |
					   (alucontrol == `MSUB_CONTROL) |
					   (alucontrol == `MUL_CONTROL);
	assign mult_valid = (alucontrol == `MULT_CONTROL)  | 
						(alucontrol == `MULTU_CONTROL) |
						(alucontrol == `MADD_CONTROL)  |
						(alucontrol == `MADDU_CONTROL) |
						(alucontrol == `MSUB_CONTROL)  |
						(alucontrol == `MSUBU_CONTROL) |
						(alucontrol == `MUL_CONTROL);

	wire mult_ready;
	assign mult_ready = !(cnt ^ 4'b1101);

	// is_multD   stallD   flushE   flush_exceptionM

	always@(posedge clk_i) begin
		cnt <= rst_i | (id_is_mult & ~id_stall & ~ex_flush) | ex_flush ? 0 : mult_ready ? cnt : cnt + 1;
	end

	wire unsigned_mult_ce;
	wire signed_mult_ce;

	assign unsigned_mult_ce = ~mult_sign & mult_valid & ~mult_ready;
	assign signed_mult_ce = mult_sign & mult_valid & ~mult_ready;
	assign mult_stallE = mult_valid & ~mult_ready & ~mem_excepttype;

	signed_mult signed_mult0 (
		.CLK(clk_i),  // input wire CLK
		.A(reg1_i),      // input wire [31 : 0] A
		.B(reg2_i),      // input wire [31 : 0] B
		.C(32'b0),
		.CE(signed_mult_ce),    // input wire CE
		.SCLR(ex_flush),
		.SUBTRACT(1'b0),
		.P(alu_out_signed_mult)      // output wire [63 : 0] P
	);
	
//  .CLK(CLK),            // input wire CLK
//  .CE(CE),              // input wire CE
//  .SCLR(SCLR),          // input wire SCLR
//  .A(A),                // input wire [31 : 0] A
//  .B(B),                // input wire [31 : 0] B
//  .C(C),                // input wire [31 : 0] C
//  .SUBTRACT(SUBTRACT),  // input wire SUBTRACT
//  .P(P),                // output wire [63 : 0] P
//  .PCOUT(PCOUT)        // output wire [47 : 0] PCOUT

	unsigned_mult unsigned_mult0 (
		.CLK(clk_i),  // input wire CLK
		.A(reg1_i),      // input wire [31 : 0] A
		.B(reg2_i),      // input wire [31 : 0] B
		.C(32'b0),
		.CE(unsigned_mult_ce),    // input wire CE
		.SCLR(ex_flush),
		.SUBTRACT(1'b0),
		.P(alu_out_unsigned_mult)      // output wire [63 : 0] P
	);
        ////////////////////////multiply////////////////////////////////////

	// MADD MADDU MSUB MSUBU
	wire [63:0] madd_result;
	wire [63:0] maddu_result;
	wire [63:0] msub_result;
	wire [63:0] msubu_result;
	assign madd_result  = {hi_in, lo_in} + alu_out_signed_mult;
	assign maddu_result = {hi_in, lo_in} + alu_out_unsigned_mult;
	assign msub_result  = {hi_in, lo_in} - alu_out_signed_mult;
	assign msubu_result = {hi_in, lo_in} - alu_out_unsigned_mult;

	assign hi_alu_out = 	
				alucontrol== `MULT_CONTROL  ? alu_out_signed_mult[63:32]          :
				alucontrol== `MULTU_CONTROL ? alu_out_unsigned_mult[63:32]        :
				alucontrol== `MTHI_CONTROL  ? reg1_i                     		  :
				alucontrol== `MADD_CONTROL  ? madd_result[63:32]                  :
				alucontrol== `MADDU_CONTROL ? maddu_result[63:32]				  :
				alucontrol== `MSUB_CONTROL  ? msub_result[63:32]				  :
				alucontrol== `MSUBU_CONTROL ? msubu_result[63:32] 				  : 32'b0;

	assign lo_alu_out = 	
				alucontrol== `MULT_CONTROL  ? alu_out_signed_mult[31:0]           :
				alucontrol== `MULTU_CONTROL ? alu_out_unsigned_mult[31:0]         :
				alucontrol== `MTLO_CONTROL  ? reg1_i                              :
				alucontrol== `MADD_CONTROL  ? madd_result[31:0]                   :
				alucontrol== `MADDU_CONTROL ? maddu_result[31:0]				  :
				alucontrol== `MSUB_CONTROL  ? msub_result[31:0]				      :
				alucontrol== `MSUBU_CONTROL ? msubu_result[31:0] 				  : 32'b0;


	assign ov = alucontrol==`ADD_CONTROL ? (reg1_i[31] & reg2_i[31] & ~wdata_o[31] | ~reg1_i[31] & ~reg2_i[31] & wdata_o[31])    : 
	            alucontrol==`SUB_CONTROL ? (((reg1_i[31]&&!reg2_i[31])&&!wdata_o[31])||((!reg1_i[31]&&reg2_i[31])&&wdata_o[31])) : 1'b0 ;

endmodule
