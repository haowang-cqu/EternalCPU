`timescale 1ns / 1ps

`include "defines.vh"

module MEM(
    input logic          clk,
	input logic      	 rst,
	input logic          flush,

    // // input
    input logic [31:0]   mem_pc,
    input logic [5:0]    mem_op,

    input logic [31:0]   mem_aluout,
    input logic [31:0]   mem_wdata,
    input logic [31:0]   mem_rdata,

    input logic [7:0]    mem_except,
	input logic		     mem_trap,
    input logic          mem_cp0we,
    input logic [4:0]    mem_rd,
    input logic [4:0]    ex_rd,
    input logic          mem_is_in_delayslot,
    input logic          mem_rmem,

    // // output
    output logic [3:0]   sel,
    output logic [31:0]  mem_wdata_last,
    output logic [31:0]  mem_finaldata,
    output logic [1:0]   mem_size,
    output logic [31:0]  mem_excepttype,
    output logic [31:0]  epc_o,
    output logic [31:0]  ex_cp0data,
    output logic [31:0]  mem_result,
	output logic 	     sc_failed,
	input  logic [5:0]   ext_int
);

	// // logic

	logic [31:0] bad_addrM;
	logic        adelM;
	logic        adesM;
	logic [31:0] data_o;
	logic [31:0] count_o;
	logic [31:0] compare_o;
	logic [31:0] status_o;
	logic [31:0] cause_o;
	logic [31:0] config_o;
	logic [31:0] badvaddr;
	logic        timer_int_o;
	logic		 LLbit;
	logic		 ll;
	logic        sc;

	memsel mems(
		mem_pc,
		mem_op,
		mem_aluout,
		mem_wdata,
		mem_rdata,

		sel,
		mem_wdata_last,
		mem_finaldata,
		bad_addrM,
		adelM,
		adesM,
		mem_size
	);

	exception exp(
		rst,
		mem_except,
		adelM,
		adesM,
		mem_trap,
		status_o,
		cause_o,
		mem_excepttype
	);

	cp0 CP0(
		.clk(clk),
		.rst(rst),
		.we_i(mem_cp0we),
		.waddr_i(mem_rd),
		.raddr_i(ex_rd),
		.data_i(mem_aluout),
		.int_i(ext_int),
		.excepttype_i(mem_excepttype),
		.current_inst_addr_i(mem_pc),
		.is_in_delayslot_i(mem_is_in_delayslot),
		.bad_addr_i(bad_addrM),

		.data_o(data_o),
		.count_o(count_o),
		.compare_o(compare_o),
		.status_o(status_o),
		.cause_o(cause_o),
		.epc_o(epc_o),
		.config_o(config_o),
		.badvaddr(badvaddr),
		.timer_int_o(timer_int_o) // to define
	);

	LLbit LLbit0 (
		clk(clk),
    	rst(rst),
    	flush(flush),
    	LLbit_i(ll),  // ll write 1, sc write 0
    	we(ll | sc),
    	LLbit_o(LLbit)
	);

	assign ll  = ~(|(mem_op ^ `LL ));
	assign sc  = ~(|(mem_op ^ `SC ));

	assign sc_failed = sc & ~LLbit;
	assign ex_cp0data = data_o;
	// sc指令执行时LLbit != 1则不写入内存，且rt=0
	// sc指令执行时LLbit == 1则要写入内存，且rt=1
	assign mem_result = mem_rmem==1'b1 ? mem_finaldata : 
						sc==1'b1 ? {31'b0, LLbit} : mem_aluout;

endmodule