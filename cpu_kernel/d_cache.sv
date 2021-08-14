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

    integer             i;

    logic               dram_wr_req;        //  request writing data to dram
    logic [31:0]        dram_wr_addr;       //  write data address
    logic [31:0]        dram_wr_data;       //  write data
    logic               dram_wr_val;        //  write a word valid

    logic               dram_rd_req;        //  request reading data from dram
    logic [31:0]        dram_rd_addr;       //  read data address
    logic               dram_rd_val;    //  read a word valid

    logic               d_valid [0:(1<<C_INDEX)-1];
    logic               d_dirty [0:(1<<C_INDEX)-1];
    logic [T_WIDTH-1:0] d_tags  [0:(1<<C_INDEX)-1];
    logic [7:0]         d_data1 [0:(1<<C_INDEX)-1];
    logic [7:0]         d_data2 [0:(1<<C_INDEX)-1];
    logic [7:0]         d_data3 [0:(1<<C_INDEX)-1];
    logic [7:0]         d_data4 [0:(1<<C_INDEX)-1];

    logic [1:0]         state;                      // FSM
    logic               cache_hit,dirty;                        // dirty bit
    logic [T_WIDTH-1:0] tagout;
    logic [31:0]        c_out;

    //cache
    logic [C_INDEX-1:0] index;
    logic [T_WIDTH-1:0] tag;
    logic               valid;

    assign index            =   mem_aluout[C_INDEX+1:2];
    assign tag              =   mem_aluout[A_WIDTH-1:C_INDEX+2];
    assign valid            =   d_valid[index];

    assign rst              =   ~clrn;

    assign data_data_ok     =   m_ready;
    assign data_rdata       =   m_dout ;
    assign m_a              =   uncached ? {3'b000,mem_aluout[28:0]} : data_addr;
    assign m_din            =   uncached ? p_dout : data_wdata;
    assign m_strobe         =   uncached ? p_strobe : data_req;
    assign m_wen            =   uncached ? p_wen : data_wen;
    assign m_size           =   uncached ? p_size: data_size;
    assign m_rw             =   uncached ? p_rw : data_wr;
    assign data_data_ok     =   m_ready;

    assign uncached         =  (mem_aluout[31:29] == 3'b101) ? 1'b1 : 1'b0; // patch for supervisor-mips32

    assign mem_memwrite     =   p_rw;
    assign sel              =   p_wen;
    assign data_sram_size   =   p_size;
    assign mem_aluout       =   p_a;
    assign mem_writedata    =   p_dout;
    assign mem_memen        =   p_strobe;
    assign p_din            =   uncached ? m_dout : mem_readdata;
    assign p_ready          =   cache_ready;

    //read from cache
    assign tagout           =   d_tags[index];
    assign c_out            =   {d_data1[index],d_data2[index],d_data3[index],d_data4[index]};

    //cache control
    assign cache_hit        =   valid & (tag==tagout) & mem_memen & !uncached ;
    // assign  cache_hit =0;
    assign dirty            =   d_dirty[index];
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

// cpu/dram writes data_cache   å†™cache
    always@(posedge clk)
    begin
        if(rst)                     //init cache memery
        begin
            for(i=0;i<(1<<C_INDEX);i=i+1)
            begin
                d_valid[i] <= 1'b0;
                d_dirty[i] <= 1'b0;
            end
        end
        else if(dram_rd_val)    // dram write cache block
        begin
            d_valid[index]  <=  1'b1;
            d_dirty[index]  <=  1'b0;
            d_tags[index]   <=  tag;
            d_data1[index]  <=  data_rdata[31:24];
            d_data2[index]  <=  data_rdata[23:16];
            d_data3[index]  <=  data_rdata[15:8];
            d_data4[index]  <=  data_rdata[7:0];
        end
        else if( cache_hit & mem_memen & mem_memwrite )
        begin
            // wirte dirty bit
            d_dirty[index]      <=  1'b1;
            case (sel)
                4'b1111:begin//sw
                    d_data1[index] <= mem_writedata[31:24];
                    d_data2[index] <= mem_writedata[23:16];
                    d_data3[index] <= mem_writedata[15:8];
                    d_data4[index] <= mem_writedata[7:0];
                end
                4'b1100:begin//sh
                    d_data1[index] <= mem_writedata[31:24];
                    d_data2[index] <= mem_writedata[23:16];
                end
                4'b0011:begin//sh
                    d_data3[index] <= mem_writedata[15:8];
                    d_data4[index] <= mem_writedata[7:0];
                end
                4'b1000:begin//sb
                    d_data1[index] <= mem_writedata[31:24];
                end
                4'b0100:begin
                    d_data2[index] <= mem_writedata[23:16];
                end
                4'b0010:begin
                    d_data3[index] <= mem_writedata[15:8];
                end
                4'b0001:begin
                    d_data4[index] <= mem_writedata[7:0];
                end
            default: ;
            endcase
        end
    end

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
