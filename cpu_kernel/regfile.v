`timescale 1ns / 1ps


module regfile(
	input  wire 		clk_i,
	input  wire 		we,
	input  wire[4:0] 	raddr1,
	input  wire[4:0] 	raddr2,
	input  wire[4:0] 	waddr,
	input  wire[31:0] 	wdata,

	output wire[31:0] 	rdata1,
	output wire[31:0] 	rdata2
    );

	reg [31:0] rf[31:0];

	always @(posedge clk_i) begin
		if(we && waddr!=5'b0) begin
			rf[waddr] <= wdata;
		end
	end
	assign rdata1 = (raddr1 != 5'b0) ? rf[raddr1] : 32'b0;
	assign rdata2 = (raddr2 != 5'b0) ? rf[raddr2] : 32'b0;
endmodule
