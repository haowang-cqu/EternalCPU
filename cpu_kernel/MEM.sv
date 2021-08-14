`timescale 1ns / 1ps

`include "cp0_defines.vh"

module MEM(
    input logic          clk,
	input logic      rst,

    // // input
    input logic [31:0]   mem_pc,
    input logic [5:0]    mem_op,

    input logic [31:0]   mem_aluout,
    input logic [31:0]   mem_wdata,
    input logic [31:0]   mem_rdata,

    input logic [7:0]    mem_except,
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
    input  logic [5:0]   ext_int,
    output logic         kseg0_uncached,
    output logic         bev,
    output logic         ebase,
	input  logic [2:0]   cp0_sel,
	input  logic [3:0]   tlbcmd,
	input  logic [31:0] PageMask_in,
	input  logic [31:0] EntryLo0_in,
	input  logic [31:0] EntryLo1_in,
	input  logic [31:0] EntryHi_in,
	input  logic [31:0] Index_in,
	output logic [31:0] PageMask_out,
	output logic [31:0] EntryLo0_out,
	output logic [31:0] EntryLo1_out,
	output logic [31:0] EntryHi_out,
	output logic [31:0] Index_out,
	output logic [31:0] Random_out,
	input  logic [4:0]  tlb_exc,
	input  logic        mem_we
);

	assign kseg0_uncached = ~config_o[0];
	assign bev = status_o[`CP0_STATUS_BEV];

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

	memsel mems(
		.pc(mem_pc),
		.op(mem_op),
		.addr(mem_aluout),
		.writedata(mem_wdata),
		.readdata(mem_rdata),

		.sel(sel),
		.writedata2(mem_wdata_last),
		.finaldata(mem_finaldata),
		.bad_addr(bad_addrM),
		.adelM(adelM),
		.adesM(adesM),
		.size(mem_size)
	);

	exception exp(
		.except(mem_except),
		.tlb_exc(tlb_exc),
		.adel(adelM),
		.ades(adesM),
		.CP0_status(status_o),
		.CP0_cause(cause_o),
		.exception_type(mem_excepttype)
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
		.status_o(status_o),
		.cause_o(cause_o),
		.epc_o(epc_o),
		.config_o(config_o),
		.ebase_o(ebase),
		.cp0_sel(cp0_sel),
		.tlbcmd(tlbcmd),
		.index_o(Index_out),
		.random_o(Random_out),
		.pagemask_o(PageMask_out),
		.entrylo0_o(EntryLo0_out),
		.entrylo1_o(EntryLo1_out),
		.entryhi_o(EntryHi_out),
		.index_i(Index_in),
		.pagemask_i(PageMask_in),
		.entrylo0_i(EntryLo0_in),
		.entrylo1_i(EntryLo1_in),
		.entryhi_i(EntryHi_in),
		.mem_we(mem_we)
	);

	assign ex_cp0data = data_o;
	assign mem_result = mem_rmem==1'b1 ? mem_finaldata : mem_aluout;

endmodule