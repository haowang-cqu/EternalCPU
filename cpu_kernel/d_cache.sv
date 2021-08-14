`timescale 1ns / 1ps

`include "compile_options.vh"

module d_cache #(parameter A_WIDTH = 32, parameter C_INDEX = `D_CACHE_INDEX)(
    input  logic[A_WIDTH-1:0]     p_a,
    input  logic[31:0]            p_dout,
    output logic[31:0]            p_din,
    input  logic                  p_strobe,
    input  logic[3:0]             p_wen,
    input  logic[1:0]             p_size,
    input  logic                  p_rw,
    output logic                  p_ready,

    input  logic                  clk,
    input  logic                  clrn,

    output logic[A_WIDTH-1:0]     m_a,
    input  logic[31:0]            m_dout,
    output logic[31:0]            m_din,
    output logic                  m_strobe,
    output logic[3:0]             m_wen,
    output logic[1:0]             m_size,
    output logic                  m_rw,
    input  logic                  m_ready
);

    logic [A_WIDTH-1:0]     bridge_a;
    logic [31:0]            bridge_dout;
    logic [31:0]            bridge_din;
    logic                   bridge_strobe;
    logic [3:0]             bridge_wen;
    logic [1:0]             bridge_size;
    logic                   bridge_rw;
    logic                   bridge_ready;
    logic                   uncached;

    assign uncached         =  (p_a[31:29] == 3'b101 || (p_a[31:28] == 4'b1000 && p_a[31:16] != 16'h800d)) ? 1'b1 : 1'b0; // patch for supervisor-mips32

    d_cache_level_1 d_cache_level_1(
        .p_a                (p_a),
        .p_dout             (p_dout),//写的数据
        .p_din              (p_din),//读的数据
        .p_strobe           (p_strobe),
        .p_wen              (p_wen),
		.p_size             (p_size),
        .p_rw               (p_rw),
        .p_ready            (p_ready),

        .clk                (clk),
        .clrn               (clrn),
        .uncached           (uncached),

        .m_a                (bridge_a),
        .m_dout             (bridge_dout), // 从 MEM 读出的数据
        .m_din              (bridge_din),    //写进 MEM 的数据
        .m_strobe           (bridge_strobe),
        .m_wen              (bridge_wen),
		.m_size             (bridge_size),
        .m_rw               (bridge_rw),
        .m_ready            (bridge_ready)
    );

    d_cache_level_2 d_cache_level_2(
        .p_a                (bridge_a),
        .p_dout             (bridge_din),  //写的数据
        .p_din              (bridge_dout),   //读的数据
        .p_strobe           (bridge_strobe),
        .p_wen              (bridge_wen),
		.p_size             (bridge_size),
        .p_rw               (bridge_rw),
        .p_ready            (bridge_ready),

        .clk                (clk),
        .clrn               (clrn),
        .uncached           (uncached),

        .m_a                (m_a),
        .m_dout             (m_dout),   // 从axi读取的数据
        .m_din              (m_din),   // 写入axi的数据
        .m_strobe           (m_strobe),
        .m_wen              (m_wen),
		.m_size             (m_size),
        .m_rw               (m_rw),
        .m_ready            (m_ready)
    );
endmodule