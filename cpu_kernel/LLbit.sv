`timescale 1ns / 1ps

module LLbit(
    input  logic clk,
    input  logic rst,
    input  logic flush,
    input  logic LLbit_i,
    input  logic we,
    output logic LLbit_o
    );

    always @(posedge clk) begin
        if (rst) begin
            LLbit_o <= 1'b0;
        end else if (flush) begin
            LLbit_o <= 1'b0;
        end else if (we) begin
            LLbit_o <= LLbit_i;
        end
    end

endmodule
