`timescale 1ns / 1ps


module hilo_reg(
	input wire clk,rst,
	input wire[1:0] we,
	input wire[31:0] hi,lo,
	output wire [31:0]hi_o,lo_o
    );
	reg [31:0] hi_reg,lo_reg;
	always @(posedge clk) begin
		if(rst) begin
			hi_reg <= 0;
			lo_reg <= 0;
		end else begin 
			if(we[1]) hi_reg <= hi;
			if(we[0]) lo_reg <= lo;
		end
	end
	// 优先读出将要写的数据
	assign hi_o = we[1] ? hi : hi_reg;
	assign lo_o = we[0] ? lo : lo_reg;
endmodule
