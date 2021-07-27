
`timescale 1ns / 1ps

`include "defines.h"

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
	input wire [4:0]    alucontrol,

	input wire [31:0]   hi_in,
	input wire [31:0]   lo_in,
	input wire [31:0]   cp0_reg_data_i,

	output wire [31:0]  wdata_o,
	output wire         ov,
	output wire [31:0]  hi_alu_out,
	output wire [31:0]  lo_alu_out,

	output wire         mult_stallE  //qf
    );

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
			alucontrol== `MTC0_CONTROL  ? (reg2_i)         :   32'b0 ;


//    wire[63:0] signed_mul;
//    wire[63:0] unsigned_mul;

//	assign signed_mul   = $signed(reg1_i)*$signed(reg2_i);
//	assign unsigned_mul = reg1_i * reg2_i;

	////////////////////////multiply////////////////////////////////////
	reg [3:0] cnt;

	wire mult_sign;
	wire mult_valid;

	wire [63:0] alu_out_signed_mult;
	wire [63:0] alu_out_unsigned_mult;

	assign mult_sign = (alucontrol == `MULT_CONTROL);
	assign mult_valid = (alucontrol == `MULT_CONTROL) | (alucontrol == `MULTU_CONTROL) ;

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





	assign hi_alu_out = 	alucontrol== `MULT_CONTROL  ? alu_out_signed_mult[63:32]          :
				alucontrol== `MULTU_CONTROL ? alu_out_unsigned_mult[63:32]        :
				alucontrol== `MTHI_CONTROL  ? reg1_i                     :32'b0;

	assign lo_alu_out = 	alucontrol== `MULT_CONTROL  ? alu_out_signed_mult[31:0]           :
				alucontrol== `MULTU_CONTROL ? alu_out_unsigned_mult[31:0]         :
				alucontrol== `MTLO_CONTROL  ? reg1_i                     :32'b0;

	assign ov = alucontrol==`ADD_CONTROL ? (reg1_i[31] & reg2_i[31] & ~wdata_o[31] | ~reg1_i[31] & ~reg2_i[31] & wdata_o[31])    : 
	            alucontrol==`SUB_CONTROL ? (((reg1_i[31]&&!reg2_i[31])&&!wdata_o[31])||((!reg1_i[31]&&reg2_i[31])&&wdata_o[31])) : 1'b0 ;

endmodule
