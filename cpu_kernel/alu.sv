
`timescale 1ns / 1ps

`include "defines.h"

module alu(
	input wire [31:0]  reg1_i,
	input wire [31:0]  reg2_i,

	input wire [4:0]   sa,
	input wire [4:0]   alucontrol,

	input wire [31:0]  hi_in,
	input wire [31:0]  lo_in,
	input wire [31:0]  cp0_reg_data_i,

	output wire [31:0]   wdata_o,
	output wire          ov,
	output wire [31:0]  hi_alu_out,
	output wire [31:0]  lo_alu_out
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


        wire[63:0] signed_mul;
        wire[63:0] unsigned_mul;

	assign signed_mul   = $signed(reg1_i)*$signed(reg2_i);
	assign unsigned_mul = reg1_i * reg2_i;

	assign hi_alu_out = 	alucontrol== `MULT_CONTROL  ? signed_mul[63:32]          :
				alucontrol== `MULTU_CONTROL ? unsigned_mul[63:32]        :
				alucontrol== `MTHI_CONTROL  ? reg1_i                     :32'b0;

	assign lo_alu_out = 	alucontrol== `MULT_CONTROL  ? signed_mul[31:0]           :
				alucontrol== `MULTU_CONTROL ? unsigned_mul[31:0]         :
				alucontrol== `MTLO_CONTROL  ? reg1_i                     :32'b0;

	assign ov = alucontrol==`ADD_CONTROL ? (reg1_i[31] & reg2_i[31] & ~wdata_o[31] | ~reg1_i[31] & ~reg2_i[31] & wdata_o[31])    : 
	            alucontrol==`SUB_CONTROL ? (((reg1_i[31]&&!reg2_i[31])&&!wdata_o[31])||((!reg1_i[31]&&reg2_i[31])&&wdata_o[31])) : 1'b0 ;

endmodule
