`timescale 1ns / 1ps

`include "compile_options.vh"

module d_cache_level_1 #(parameter A_WIDTH = 32, parameter C_INDEX = 12)(
        input  logic[31:0]            ex_a,
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

    logic               uncached;

    logic               mem_memwrite;        
    logic [3:0]         sel;              
    logic [1:0]         data_sram_size;   
    logic [31:0]        mem_aluout;          
    logic [31:0]        mem_writedata;     
    logic               mem_memen;
    logic [31:0]        mem_readdata;
    logic               cache_ready;

    logic               rst;
    logic               data_req;
    logic               data_wr;
    logic [3:0]         data_wen;
    logic [1:0]         data_size;
    logic [31:0]        data_addr;
    logic [31:0]        data_wdata;
    logic [31:0]        data_rdata;
    logic               data_data_ok;

    localparam          CPU_EXEC    =   0;
    localparam          WR_DRAM     =   1;
    localparam          RD_DRAM     =   2;
    localparam          T_WIDTH     =   A_WIDTH - C_INDEX -2;  //tag width:
    localparam          C_WIDTH     =   32 + T_WIDTH + 2;

    logic               dram_wr_req;        //  request writing data to dram
    logic [31:0]        dram_wr_addr;       //  write data address
    logic [31:0]        dram_wr_data;       //  write data
    logic               dram_wr_val;        //  write a word valid

    logic               dram_rd_req;        //  request reading data from dram
    logic [31:0]        dram_rd_addr;       //  read data address
    logic               dram_rd_val;    //  read a word valid

    logic [1:0]         state;                      // FSM
    logic               cache_hit,dirty;                        // dirty bit
    logic [T_WIDTH-1:0] tagout;
    logic [31:0]        c_out;

    //cache
    logic [C_INDEX-1:0] index;
    logic [C_INDEX-1:0] ex_index;
    logic [C_INDEX-1:0] bram_read_index;


    logic [T_WIDTH-1:0] tag;
    logic               valid;

    assign tag              =   mem_aluout[A_WIDTH-1:C_INDEX+2];

    assign rst              =   ~clrn;

    assign data_data_ok     =   m_ready;
    assign data_rdata       =   m_dout ;
    assign m_a              =   uncached ? {3'b000,mem_aluout[28:0]} : data_addr;
    assign m_din            =   uncached ? p_dout : data_wdata;
    assign m_strobe         =   uncached ? p_strobe : data_req;
    assign m_wen            =   uncached ? p_wen : data_wen;
    assign m_size           =   uncached ? p_size: data_size;
    assign m_rw             =   uncached ? p_rw : data_wr;

    assign uncached         =  (mem_aluout[31:29] == 3'b101 || (mem_aluout[31:28] == 4'b1000 && mem_aluout[31:16] != 16'h800d)) ? 1'b1 : 1'b0; // patch for supervisor-mips32

    assign mem_memwrite     =   p_rw;
    assign sel              =   p_wen;
    assign data_sram_size   =   p_size;
    assign mem_aluout       =   p_a;
    assign mem_writedata    =   p_dout;
    assign mem_memen        =   p_strobe;
    assign p_din            =   uncached ? m_dout : mem_readdata;
    assign p_ready          =   cache_ready;

    //cache control
    assign cache_hit        =   valid & (tag==tagout) & mem_memen & !uncached ;

    assign dram_wr_addr     =   {tagout,index,2'b00};
    assign dram_rd_addr     =   mem_aluout;

    assign cache_ready      =   (mem_memen & cache_hit & !uncached) || (mem_memen && uncached && m_ready);

    assign mem_readdata     =   cache_hit ? c_out : data_rdata;

    assign data_req         =   (dram_rd_req ) || (dram_wr_req);
    assign data_wr          =   dram_wr_req ? 1 : 0;
    assign data_addr        =   dram_wr_req ? dram_wr_addr : dram_rd_req ?  dram_rd_addr : 32'b0;
    assign data_wdata       =   dram_wr_data;

    //assign dram_rd_data = data_rdata;
    assign dram_wr_val      =   dram_wr_req ? data_data_ok : 0;
    assign dram_rd_val      =   dram_rd_req ? data_data_ok : 0; 
 
    assign data_wen         =   4'b1111;
    assign data_size        =   2'b10;

    assign dram_wr_data     =   c_out;

    // dram write/read request
    assign  dram_wr_req     =   WR_DRAM == state;
    assign  dram_rd_req     =   RD_DRAM == state;

////////////////////////////////////////BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////// 提前读取 ////////////////////////////////////////
    assign index            =   mem_aluout[C_INDEX+1:2];
    assign ex_index         =   ex_a[C_INDEX+1:2];
    logic  test_equal;
    assign test_equal       =   index == bram_read_index && (d_dirty_wea | dram_rd_val |d_data_ena);
    assign bram_read_index  =   (p_strobe && ~p_ready) ? index : ex_index;
    ////////////////////////////////////////////////////// 提前读取 ////////////////////////////////////////

    logic read_clk;
    logic read_addrb;
    assign read_clk   = ~clk;
    assign read_addrb = index;
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    bit1_bram d_valid (
        .clka(clk),    // input wire clka
        .ena(dram_rd_val),
        .wea(dram_rd_val),      // input wire [0 : 0] wea
        .addra(index),  // input wire [11 : 0] addra
        .dina(1'b1),    // input wire [0 : 0] dina

        .clkb(read_clk),    // input wire clkb
        .enb(1'b1),      // input wire enb
        .addrb(read_addrb),  // input wire [11 : 0] addrb
        .doutb(valid)  // output wire [0 : 0] doutb
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------

    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    logic d_dirty_dina;
    assign d_dirty_dina = dram_rd_val?1'b0:(cache_hit & mem_memen & mem_memwrite ? 1'b1:1'b0);
    logic d_dirty_wea;
    assign d_dirty_wea = dram_rd_val || (cache_hit & mem_memen & mem_memwrite);
    bit1_bram d_dirty (
        .clka(clk),    // input wire clka
        .ena(d_dirty_wea),
        .wea(d_dirty_wea),      // input wire [0 : 0] wea
        .addra(index),  // input wire [11 : 0] addra
        .dina(d_dirty_dina),    // input wire [0 : 0] dina

        .clkb(read_clk),    // input wire clkb
        .enb(1'b1),      // input wire enb
        .addrb(read_addrb),  // input wire [11 : 0] addrb
        .doutb(dirty)  // output wire [0 : 0] doutb
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------

    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    bit18_bram d_tags (
        .clka(clk),    // input wire clka
        .ena(dram_rd_val),
        .wea(dram_rd_val),      // input wire [0 : 0] wea
        .addra(index),  // input wire [11 : 0] addra
        .dina(tag),    // input wire [17 : 0] dina

        .clkb(read_clk),    // input wire clkb
        .enb(1'b1),      // input wire enb
        .addrb(read_addrb),  // input wire [11 : 0] addrb
        .doutb(tagout)  // output wire [17 : 0] doutb
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------

    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    logic        d_data_ena;
    logic [3:0]  d_data_wea;
    logic [31:0] d_data_dina;
    assign d_data_ena  = (cache_hit & mem_memen & mem_memwrite) | dram_rd_val;
    assign d_data_wea  = (cache_hit & mem_memen & mem_memwrite) ? sel : 4'b1111;
    assign d_data_dina = (cache_hit & mem_memen & mem_memwrite) ? mem_writedata : dram_rd_val ? data_rdata : 32'bx;
    bit32_bram d_data (
        .clka(clk),    // input wire clka
        .ena(d_data_ena),      // input wire ena
        .wea(d_data_wea),      // input wire [3 : 0] wea
        .addra(index),  // input wire [11 : 0] addra
        .dina(d_data_dina),    // input wire [31 : 0] dina
        
        .clkb(read_clk),    // input wire clkb
        .enb(1'b1),      // input wire enb
        .addrb(read_addrb),  // input wire [11 : 0] addrb
        .doutb(c_out)  // output wire [31 : 0] doutb
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------
////////////////////////////////////////BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM BRAM/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    // data_cache state machine
    always@(posedge clk)
    begin
        if(rst)
            state   <=  CPU_EXEC;
        else
            case(state)
                CPU_EXEC:if( ~cache_hit & dirty & mem_memen & !uncached)          // dirty block write back to dram
                            state   <=  WR_DRAM;
                        else if( ~cache_hit & mem_memen & !uncached)          // request new block from dram
                            state   <=  RD_DRAM;
                        else
                            state   <=  CPU_EXEC;
                WR_DRAM:if(dram_wr_val & dram_wr_req)
                            state   <=  RD_DRAM;
                        else
                            state   <=  WR_DRAM;
                RD_DRAM:if(dram_rd_val & dram_rd_req)
                            state   <=  CPU_EXEC;   
                        else
                            state   <=  RD_DRAM;
                default:    state   <=  CPU_EXEC;   
            endcase
    end
endmodule
