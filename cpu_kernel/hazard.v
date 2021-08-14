`timescale 1ns / 1ps

`include "defines.vh"
`include "alu_defines.vh"
`include "cp0_defines.vh"

module hazard(
	//fetch stage
	output wire         if_stall,
	output wire         if_flush,

	//decode stage
	output              id_flush,
	input  wire[4:0]    id_rs,
	input  wire[4:0]    id_rt,
	output wire         id_stall,

	//execute stage
	input wire[5:0]     ex_alucontrol,
	input wire[4:0]     ex_rt,
	input wire          ex_rmem,
	output wire         ex_flush,
	output wire         ex_stall,
	output wire         div_start,
	input  wire         div_ready,
	input  wire	  ex_mult_stall,

	//mem stage
	output wire         mem_stall,
	output wire         mem_flush,
	input  wire[31:0]   mem_excepttype,
	input  wire[31:0]   mem_cp0_epc,
	output reg [31:0]   mem_newpc,


	input wire          mem_rmem,
	input wire[4:0]     mem_rt,

	//write back stage
	output wire         wb_flush,
	input  wire         stallreq_from_if,
	input  wire         stallreq_from_mem,
	output wire         wb_stall,
	input  wire         id_j_b_stall,
	input  wire         bev,
	input  wire [31:0]  ebase
    );

	wire id_lwstall;
	wire except_flush;

	assign div_start = (ex_alucontrol == `DIV_CONTROL  && div_ready == 1'b0 ) ? 1'b1 : 
		 (ex_alucontrol == `DIV_CONTROL  && div_ready == 1'b1 ) ? 1'b0 : 
		 (ex_alucontrol == `DIVU_CONTROL && div_ready == 1'b0 ) ? 1'b1 : 
		 (ex_alucontrol == `DIVU_CONTROL && div_ready == 1'b1 ) ? 1'b0 : 1'b0;

	assign id_lwstall = (ex_rmem & (ex_rt == id_rs | ex_rt == id_rt)) | (mem_rmem & (mem_rt == id_rs | mem_rt == id_rt));

	assign except_flush = mem_excepttype != 32'b0;

	assign if_stall     = id_lwstall   |   id_j_b_stall   | div_start | stallreq_from_if | stallreq_from_mem | ex_mult_stall;
	assign id_stall     = id_lwstall   |   id_j_b_stall   | div_start | stallreq_from_if | stallreq_from_mem | ex_mult_stall;
	assign ex_stall     =                                   div_start |                    stallreq_from_mem | ex_mult_stall;		       
	assign mem_stall    =                                   div_start |                    stallreq_from_mem | ex_mult_stall;
    assign wb_stall     =                                   div_start |                    stallreq_from_mem | ex_mult_stall;

	assign if_flush     =              	             except_flush;	
	assign id_flush     =                            except_flush;
	assign ex_flush     = (id_lwstall&&!mem_stall) | except_flush | (id_j_b_stall&&!mem_stall);
	assign mem_flush    =                            except_flush;
	assign wb_flush     =                            except_flush;

  	always @(*) begin
		if(mem_excepttype != 32'b0) begin
			case (mem_excepttype)
				`EXC_ERET:begin 
					mem_newpc <= mem_cp0_epc;
				end
				default :
					mem_newpc <= bev ? 32'hbfc00380 : {ebase[31:12],12'h180};
			endcase
		end
		// 避免锁存器
		else begin
			mem_newpc <= 32'b0;
		end
	end
endmodule
