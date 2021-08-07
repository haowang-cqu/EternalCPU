`timescale 1ns / 1ps
`include "compile_options.vh"

module i_cache#(parameter A_WIDTH = 32, parameter C_INDEX = `I_CACHE_INDEX)(
        input   logic                  p_flush,
        input   logic[A_WIDTH-1:0]     p_a,
        output  logic[31:0]            p_din,
        input   logic                  p_strobe,
        output  logic                  p_ready,
        output  logic                  cache_miss,

        input   logic                  clk,
        input   logic                  clrn,

        output  logic[A_WIDTH-1:0]     m_a,
        input   logic[31:0]            m_dout,
        output  logic                  m_strobe,
        input   logic                  m_ready
    );

    localparam T_WIDTH   =   A_WIDTH - C_INDEX - 2;

    logic                   d_valid [0:(1<<C_INDEX)-1];
    logic [T_WIDTH-1:0]     d_tags  [0:(1<<C_INDEX)-1];
    logic [7:0]             d_data1 [0:(1<<C_INDEX)-1];
    logic [7:0]             d_data2 [0:(1<<C_INDEX)-1];
    logic [7:0]             d_data3 [0:(1<<C_INDEX)-1];
    logic [7:0]             d_data4 [0:(1<<C_INDEX)-1];

    logic [C_INDEX-1:0]     index ;
    logic [T_WIDTH-1:0]     tag ;

    logic                   flush_ready;

    logic                   valid;
    
    logic [T_WIDTH-1:0]     tagout;
    logic [A_WIDTH-1:0]     c_dout;

    logic                   cache_hit;

    logic                   c_write ;
    logic                   sel_out ;
    logic [A_WIDTH-1:0]     c_din ;

    integer                 i;

    assign  c_write      =    cache_miss & m_ready; // kseg1 should be uncached
    assign  sel_out      =    cache_hit;
    assign  c_din        =    m_dout;
    assign  cache_hit    =    valid & (tagout == tag);
    assign  index        =    p_a[C_INDEX+1:2];
    assign  tag          =    p_a[A_WIDTH-1:C_INDEX+2];

    // read from cache
    assign  valid        =    d_valid[index];
    assign  tagout       =    d_tags[index];
    assign  c_dout       =    {d_data1[index],d_data2[index],d_data3[index],d_data4[index]};

    // cache control 
    assign cache_miss    =     ~cache_hit;
    assign m_a           =    {3'b000,p_a[28:0]}; // 3 bit msb is segment remove
    // TODO: connect to tlb and transfer true pa to cache
    assign m_strobe      =    p_strobe & cache_miss;
    assign p_ready       =    cache_hit | cache_miss & m_ready & ~flush_ready;
    assign p_din         =    sel_out? c_dout:m_dout;

    always @(posedge clk) begin
        if (~clrn) begin
            flush_ready <= 1'b0;
        end else if(m_ready) begin
            flush_ready <= 1'b0;
        end else if (p_flush) begin
            flush_ready <= 1'b1;
        end 
    end

    always @(posedge clk) begin
        if (clrn == 1'b0) begin
            for (i = 0; i<(1<<C_INDEX); i=i+1 ) begin
                d_valid[i] <= 1'b0;
            end 
        end else if (c_write & ~flush_ready) begin
                d_valid[index] <= 1'b1;
        end
      
    end

    always @(posedge clk) begin
        if (c_write & ~flush_ready) begin
            d_tags[index] <= tag;
            d_data1[index] <= c_din[31:24];
            d_data2[index] <= c_din[23:16];
            d_data3[index] <= c_din[15:8];
            d_data4[index] <= c_din[7:0];
        end
    end

endmodule
