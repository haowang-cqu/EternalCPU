`timescale 1ns/1ps
`define IDLE        3'b000
`define TRANSGEN    3'b001
`define WRBK        3'b010
`define FILL        3'b011
// `define FIN         3'b100
`define UNCACHE     3'b111

`define PEND        3'b001
`define TRANSFER    3'b010

`define OKAY    2'b00
`define EXOKAY  2'b01
`define SLVERR  2'b10
`define DECERR  2'b11

module cache4way_miss_handler#(
    parameter BLKIDX_BIT = 4,
    parameter WRDIDX_BIT = 4,
    parameter TAG_BIT = 32-2-WRDIDX_BIT-BLKIDX_BIT
) 
(
    input clk, rst, // rst is high active
    // sram interact channel
    input  req, // request valid signal
    input  cached, // specifying whether to bypass cache
    input  req_w, // specifying whether this is a write transaction, only valid in uncached access mode
    input  [31          :0] req_paddr, // pysical address of the requested byte
    input  [BLKIDX_BIT-1:0] req_blkidx, // vitrual block index of the requested byte, only valid in cached acess mode
    input  [31          :0] req_wdata, // the data to be write directly to memory, only valid in uncached write mode
    input  [ 4          :0] req_wen, // specifying which of the 4 byte to write, only valid in uncached write mode
    output fin, // pull high when miss transaction or uncached transaction is finished
    output [31         :0]req_rdata, // data read directly from memory, only valid in uncached read mode
    //cache access request
    output cache_req, 
    input  cache_grant,
    //cache line select channel
    output [BLKIDX_BIT-1:0] cache_blkidx,
    output [WRDIDX_BIT-1:0] cache_wrdidx,
    // cache data interact channel 
    // output en_data, 
    output [32*4-1      :0] cache_wdata, // write the 4 cache way in parallel
    output [ 4*4-1      :0] cache_wen, // write the 4 cache way in parallel
    input  [32*4-1      :0] cache_rdata, // read the 4 cache way in parallel 
    // cache meta interact cahnnel
    // tag field 
    // output en_tag,
    output [3             :0] wen_cache_tag, 
    input  [(TAG_BIT)*4-1 :0] cache_tag_r, 
    output [(TAG_BIT)*4-1 :0] cache_tag_w, 
    //valid bit
    output [3:0] wen_cache_valid,
    input  [3:0] cache_valid_r, 
    output [3:0] cache_valid_w,
    //dirty bit
    // output en_dirty,
    output [3:0] wen_cache_dirty,
    input  [3:0] cache_dirty_r, 
    output [3:0] cache_dirty_w, 
    // history info
    // output en_history, 
    output cache_wen_history, 
    input  [2:0] cache_history_r,
    output [2:0] cache_history_w,
    
    // axi master interface
    // read address channel
    output [3 :0] arid   ,
    output [31:0] araddr ,
    output [7 :0] arlen  ,
    output [2 :0] arsize ,
    output [1 :0] arburst,
    output [1 :0] arlock ,
    output [3 :0] arcache,
    output [2 :0] arprot ,
    output        arvalid,
    input         arready,
    // read data channel
    input  [3 :0] rid    ,
    input  [31:0] rdata  ,
    input  [1 :0] rresp  ,
    input         rlast  ,
    input         rvalid ,
    output        rready ,
    // write address channel
    output [3 :0] awid   ,
    output [31:0] awaddr ,
    output [7 :0] awlen  ,
    output [2 :0] awsize ,
    output [1 :0] awburst,
    output [1 :0] awlock ,
    output [3 :0] awcache,
    output [2 :0] awprot ,
    output        awvalid,
    input         awready,
    // write data channel
    output [3 :0] wid    ,
    output [31:0] wdata  ,
    output [3 :0] wstrb  ,
    output        wlast  ,
    output        wvalid ,
    input         wready ,
    // write response channel
    input  [3 :0] bid    ,
    input  [1 :0] bresp  ,
    input         bvalid ,
    output        bready

);
localparam WRD_NUM = 1<<WRDIDX_BIT;
wire need_wrbk;
wire axi_finished;

// fsm for miss handler
reg [2:0] state;
always @(posedge clk) begin
    if(rst)begin
        state <= `IDLE;
    end
    else begin
        case (state)
        `IDLE: begin
            if (req) begin
                if (cached) begin
                    state <= `TRANSGEN;
                end
                else begin
                    state <= `UNCACHE;
                end
            end
            else begin
                state <= state;
            end
        end
        `TRANSGEN: begin
            if (cache_grant) begin
                if (need_wrbk) begin
                    state <= `WRBK;
                end
                else begin
                    state <= `FILL;
                end
            end
            else begin
                state <= state;
            end
        end
        `WRBK: begin
            if (axi_finished)begin
                state <= `FILL;
            end
            else begin
                state <= state;
            end
        end
        `FILL: begin
            if (axi_finished) begin
                state <= `IDLE;
            end
            else begin
                state <= state;
            end
        end
        // `FIN: begin
            
        // end
        `UNCACHE: begin
            if(axi_finished) begin
                state <= `IDLE;
            end
            else begin
                state <= state;
            end
        end
        default: begin
            state <= state;
        end
        endcase
    end
end
// miss transaction context
reg  [31          :0] miss_paddr;
wire [TAG_BIT-1   :0] miss_ptag; // physical tag of the missed block
wire [BLKIDX_BIT-1:0] miss_p_blkidx; // physical block tag of the missed block 
assign miss_ptag = miss_paddr[31:31-TAG_BIT+1];
assign miss_p_blkidx = miss_paddr[BLKIDX_BIT+WRDIDX_BIT+2-1:WRDIDX_BIT+2];
reg [BLKIDX_BIT-1:0] miss_v_blkidx; // virtual block index of the missed block
reg [3           :0] miss_way; // the way where the missed block will be placed
reg [3           :0] target_fillWay; 
// logic for transaction generate
always @(cache_valid_r, cache_history_r) begin // optimisable
    if(!cache_valid_r[0])begin // there are  invalid blocks, just choose one
        target_fillWay = 4'b0001;    
    end
    else if (!cache_valid_r[1]) begin
        target_fillWay = 4'b0010;
    end
    else if (!cache_valid_r[2]) begin
        target_fillWay = 4'b0100;
    end
    else if (!cache_valid_r[3]) begin
        target_fillWay = 4'b1000;
    end
    else begin
        if (cache_history_r[0]) begin
            if(cache_history_r[1])begin
                target_fillWay = 4'b0001;
            end
            else begin
                target_fillWay = 4'b0010;
            end
        end
        else begin
            if(cache_history_r[2])begin
                target_fillWay = 4'b0100;
            end
            else begin
                target_fillWay = 4'b1000;
            end
        end
    end
end

always @(posedge clk) begin
    if (rst) begin
        miss_paddr    <= 0;
        miss_v_blkidx <= 0;
        miss_way      <= 0;
    end
    else begin
        if(state==`IDLE&&req&&cached)begin
            miss_paddr    <= {req_paddr[31:WRDIDX_BIT+2], {(WRDIDX_BIT+2){1'b0}}};
            miss_v_blkidx <= req_blkidx;
            miss_way      <= miss_way;
        end
        else if (state==`TRANSGEN&&cache_grant) begin
            miss_paddr    <= miss_paddr;
            miss_v_blkidx <= miss_v_blkidx;
            miss_way      <= target_fillWay;
        end
        else if (state==`FILL&&axi_finished) begin // may be optional
            miss_paddr    <= 0;
            miss_v_blkidx <= 0;
            miss_way      <= 0;
        end
        else begin
            miss_paddr    <= miss_paddr;
            miss_v_blkidx <= miss_v_blkidx;
            miss_way      <= miss_way;
        end
    end
end
// axi transaction context
reg [2:0] axi_state;
reg axi_wr;
reg axi_waitresp; // only valid in axi write
reg [3:0] axi_wen;
reg [31:0] axi_addr;
reg [31:0] axi_wdata; // only used in uncached access mode
reg [WRDIDX_BIT-1:0] axi_seq; //seqence number of words to be transferrd with 0 representing the last word
// fsm for axi transaction
always @(posedge clk) begin
    if (rst) begin
        axi_state <= `IDLE;
    end
    else begin
        case (axi_state)
        `IDLE: begin
            if (state==`TRANSGEN||state==`IDLE&&req&&!cached) begin
                axi_state <= `PEND;
            end
            else begin
                axi_state <= axi_state;
            end
        end
        `PEND: begin
            if ((arvalid&&arready||awvalid&&awready)) begin
                axi_state <= `TRANSFER;
            end
            else begin
                axi_state <= axi_state;
            end
        end
        `TRANSFER: begin
            if((rvalid&&rready&&rlast||bvalid&&bready&&bresp==`OKAY))begin
                if(axi_seq!=0||state==`WRBK)begin
                    axi_state <= `PEND;
                end
                else begin
                    axi_state <= `IDLE;
                end
            end
            else begin
                axi_state <= axi_state;
            end
        end
        default: begin
            axi_state <= axi_state;
        end
        endcase
    end
end
// logic for axi transaction generation and maintaining
always @(posedge clk) begin
    if (rst) begin
        axi_wr   <= 0;
        axi_wen  <= 0;
        axi_addr <= 0;
        axi_seq  <= 0;
        axi_wdata <=0;
    end
    else begin
        case(state)
        `IDLE: begin
            if(req&&!cached)begin
                axi_wr    <= req_w;
                axi_wen   <= req_wen;
                axi_addr  <= req_paddr;
                axi_seq   <= 0;
                axi_wdata <= req_wdata;
            end 
            else begin
                axi_wr    <= axi_wr;
                axi_wen   <= axi_wen;
                axi_addr  <= axi_addr;
                axi_seq   <= axi_seq;
                axi_wdata <= axi_wdata;
            end   
        end
        `TRANSGEN: begin
                axi_addr <= miss_paddr;
                axi_seq <= WRD_NUM-1;
                axi_wdata <= axi_wdata;
            if (need_wrbk) begin
                axi_wr   <= 1'b1;
                axi_wen  <= 4'b1111;
            end
            else begin
                axi_wr  <= 1'b0;
                axi_wen <= 4'b0000;                
            end
        end
        `WRBK: begin
            if (bvalid&&bready&&bresp==`OKAY&&axi_seq==0) begin
                axi_wr    <= 0;
                axi_wen   <= 0;
                axi_addr  <= miss_paddr;
                axi_seq   <= WRD_NUM-1;
                axi_wdata <= axi_wdata;
            end
            else if (axi_state==`TRANSFER&&wvalid&&wready&&axi_seq!=0) begin
                axi_wr    <= axi_wr;
                axi_wen   <= axi_wen;
                axi_addr  <= axi_addr+4;
                axi_seq   <= axi_seq-1;
                axi_wdata <= axi_wdata;
            end
            else begin
                axi_wr   <= axi_wr;
                axi_wen  <= axi_wen;
                axi_addr <= axi_addr;
                axi_seq  <= axi_seq;
                axi_wdata <= axi_wdata;
            end
            
        end
        `FILL: begin
            if(axi_state==`TRANSFER&&rvalid&&rready&&axi_seq!=0)begin
                axi_wr    <= axi_wr;
                axi_wen   <= axi_wen;
                axi_addr  <= axi_addr+4;
                axi_seq   <= axi_seq-1;
                axi_wdata <= axi_wdata;
            end
            else begin
                axi_wr   <= axi_wr;
                axi_wen  <= axi_wen;
                axi_addr <= axi_addr;
                axi_seq  <= axi_seq;
                axi_wdata <= axi_wdata;
            end
        end
        default :begin
            axi_wr   <= axi_wr;
            axi_wen  <= axi_wen;
            axi_addr <= axi_addr;
            axi_seq  <= axi_seq;
            axi_wdata <= axi_wdata;
        end
        endcase
    end
    
end
always @(posedge clk) begin
    if(rst) begin
        axi_waitresp <= 0;
    end
    else if (axi_state==`TRANSFER&&axi_wr&&wvalid&&wready&&wlast) begin
        axi_waitresp <= 1;
    end
    else if (axi_state==`TRANSFER&&axi_wr&&bvalid&&bready&&bresp==`OKAY) begin
        axi_waitresp <= 0;
    end
    else begin
        axi_waitresp <= axi_waitresp;
    end

end
// decide whether we need to write back
assign need_wrbk = |(target_fillWay&cache_dirty_r&cache_valid_r);
// decide whether the axi transaction is finished
assign axi_finished = (rvalid&&rready&&rlast||bvalid&&bready&&bresp==`OKAY)
                        &&(axi_seq==0);

//logic of generating output
// sram interact channel
assign fin = axi_finished&&(state==`UNCACHE||state==`FILL);
assign req_rdata = rdata;
//cache access request
assign cache_req =  state==`TRANSGEN||
                    state==`WRBK||
                    state==`FILL;
//cache line and word select channel
assign cache_blkidx = miss_v_blkidx;
assign cache_wrdidx = axi_addr[WRDIDX_BIT+2-1:2];
//cache data transfer channel
assign cache_wdata = {4{rdata}};
assign cache_wen = state==`FILL&&rvalid&&rready ? 
                                {{4{miss_way[3]}}, 
                                 {4{miss_way[2]}}, 
                                 {4{miss_way[1]}}, 
                                 {4{miss_way[0]}}} :
                                 0;
//cache meta transfer channel
//tag field
assign wen_cache_tag = state==`FILL&&rvalid&&rready&&rlast&&axi_seq==0 ? 
                        miss_way : 0;
assign cache_tag_w = {4{miss_ptag}};
//valid bit
assign wen_cache_valid = state==`FILL&&rvalid&&rready&&rlast&&axi_seq==0 ? 
                            miss_way : 0;
assign cache_valid_w = 4'b1111;
//dirty bit
assign wen_cache_dirty =    state==`WRBK&&bvalid&&bready&&
                            bresp==`OKAY&&axi_seq==0 ? 
                                miss_way : 0;

assign cache_dirty_w = 4'b0000;
// history info
// history info will not be changed by this module
assign cache_wen_history = 0;
assign cache_history_w = 0;
//axi master interface
//read address channel
assign arid = 4'b0;
assign araddr = axi_addr;
assign arlen = axi_seq;
assign arsize = 3'b010;
assign arburst = 2'b01;
assign arlock = 2'b0;
assign arcache = 4'b0;
assign arprot = 3'b0;
assign arvalid = axi_state==`PEND&&!axi_wr;

// read date channel
assign rready = axi_state==`TRANSFER&&!axi_wr;

// write address channel
assign awid = 4'b0;
assign awaddr = axi_addr;
assign awlen = axi_seq;
assign awsize = 3'b010;
assign awburst = 2'b01;
assign awlock = 2'b0;
assign awcache = 4'b0;
assign awprot = 3'b0;
assign awvalid = axi_state==`PEND&&axi_wr;

// write data channel
assign wid = 4'b0;
assign wdata =  state==`UNCACHE ?
                    axi_wdata :
                    {32{miss_way[3]}}&cache_rdata[127:96] |
                    {32{miss_way[2]}}&cache_rdata[ 95:64] |
                    {32{miss_way[1]}}&cache_rdata[ 63:32] |
                    {32{miss_way[0]}}&cache_rdata[ 31: 0];

assign wstrb  = axi_wen;
assign wlast  = axi_seq == 0;
assign wvalid = axi_state==`TRANSFER&&axi_wr&&!axi_waitresp;
// write response channel
assign bready = axi_waitresp;                

endmodule