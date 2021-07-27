`timescale 1ns / 1ps


module regfile(
	input wire clk_i,
	input wire rst_i,
	input wire we,
	input wire[4:0] raddr1,raddr2,waddr,
	input wire[31:0] wdata,
	output wire[31:0] rdata1,rdata2
    );

	reg [31:0] rf[31:0];

	always @(posedge clk_i) begin
		if (rst_i) begin
			rf[0] <= 32'b0; rf[1] <= 32'b0;
			rf[2] <= 32'b0; rf[3] <= 32'b0;
			rf[4] <= 32'b0; rf[5] <= 32'b0;
			rf[6] <= 32'b0; rf[7] <= 32'b0;
			rf[8] <= 32'b0; rf[9] <= 32'b0;
			rf[10] <= 32'b0; rf[11] <= 32'b0;
			rf[12] <= 32'b0; rf[13] <= 32'b0;
			rf[14] <= 32'b0; rf[15] <= 32'b0;
			rf[16] <= 32'b0; rf[17] <= 32'b0;
			rf[18] <= 32'b0; rf[19] <= 32'b0;
			rf[20] <= 32'b0; rf[21] <= 32'b0;
			rf[22] <= 32'b0; rf[23] <= 32'b0;
			rf[24] <= 32'b0; rf[25] <= 32'b0;
			rf[26] <= 32'b0; rf[27] <= 32'b0;
			rf[28] <= 32'b0; rf[29] <= 32'b0;
			rf[30] <= 32'b0; rf[31] <= 32'b0;
		end
		if(we && waddr != 5'b0) begin
			 rf[waddr] <= wdata;
		end
	end
	// 优先读出将要写入的数据
	assign rdata1 = (raddr1 == waddr && we) ? wdata : rf[raddr1];
	assign rdata2 = (raddr2 == waddr && we) ? wdata : rf[raddr2];
	
	// assign rdata1 = (raddr1 != 5'b0) ? rf[raddr1] : 32'b0;
	// assign rdata2 = (raddr2 != 5'b0) ? rf[raddr2] : 32'b0;
endmodule
