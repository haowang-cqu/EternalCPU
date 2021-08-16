`timescale 1ns/1ps
`define IDLE    3'b000
`define FETCH   3'b001
`define VALID   3'b010
`define FIN     3'b011
`define UNCACHE 3'b111

module cache4way_sramlike_interface#(
    parameter BLKIDX_BIT = 4,
    parameter WRDIDX_BIT = 4, 
    parameter TAG_BIT = 32-2-WRDIDX_BIT-BLKIDX_BIT
) 
(
    input clk, rst, // rst is high active
    // sram like interface
    input  en,
    input  [31:0] paddr,
    input  [BLKIDX_BIT-1:0] v_blkidx, 
    input  [ 3:0] wen,
    input cached, 
    output [31:0] rdata, 
    input  [31:0] wdata, 
    output stall, 
    input  flush,
    input longest_stall, 
    //miss handler interact channel
    output handler_req, // specifies whether a req is sent to miss handler
    output handler_cached, // specifies whether this is a cached request
    output handler_w, // specifies whether this is a write request, only valid in uncache mode
    output [31          :0] handler_paddr, // pysical address of the requested word 
    output [BLKIDX_BIT-1:0] handler_blkidx, // virtual block index of the requested word, only valid in cached mode
    output [31          :0] handler_wdata, // the data to be write directly to memory, only valid in uncached mode
    output [ 4          :0] handler_wen, // specifying which of the 4 bytes to write, only valid in uncached mode
    input  handler_fin, // pull high when miss transaction or uncached req is finished with valid resonse
    input  [31          :0] handler_rdata, // data read directly from memory, only valid in uncached mode
    // channel mux contorl
    output cache_mux_control, // 0 for sraml interface and 1 for miss handler
    // cache access request
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
    output [2:0] cache_history_w

);
wire [3:0]  hit_way;
wire [31:0] sraml_cache_rdata;
assign sraml_cache_rdata =  {32{hit_way[3]}}&cache_rdata[127:96] |
                            {32{hit_way[2]}}&cache_rdata[ 95:64] |
                            {32{hit_way[1]}}&cache_rdata[ 63:32] |
                            {32{hit_way[0]}}&cache_rdata[ 31: 0];
wire [TAG_BIT-1:0] sraml_ptag;
assign sraml_ptag = paddr[31:31-TAG_BIT+1];

//fsm for sram like interface
reg [2:0] state;
always @(posedge clk) begin
    if(rst)begin
        state <= `IDLE;
    end
    else begin
        case (state)
        `IDLE: begin
            if(en&&!flush&&cached&&cache_grant&&!(|hit_way))begin
                state <= `FETCH;
            end
            else if(en&&cached&&!flush&&cache_grant&&|hit_way&&longest_stall) begin
                state <= `FIN;
            end
            else if(en&&!flush&&!cached)begin
                state <= `UNCACHE;
            end
            else begin
                state <= state;
            end
        end
        `FETCH: begin
            if(flush)begin
                state <= `IDLE;
            end
            else if (handler_fin) begin
                state <= `VALID;
            end
            else begin
                state <= state;
            end
        end
        `VALID: begin
            if(longest_stall)begin
                state <= `FIN;
            end
            else begin
                state <= `IDLE;
            end
        end
        `FIN: begin
            if(longest_stall)begin
                state <= state;
            end
            else begin
                state <= `IDLE;
            end
        end
        `UNCACHE: begin
            if(flush)begin
                state <= `IDLE;
            end
            else if(handler_fin)begin
                if(longest_stall)begin
                    state <= `FIN;
                end
                else begin
                    state <= `IDLE;
                end
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
// sram-like transaction generate and maintaining
// reg [31:0] sraml_paddr;
// reg [BLKIDX_BIT-1:0] sraml_v_blkidx;
// reg [3:0] sraml_wen;
// reg sraml_cached;
// reg [31:0] sraml_wdata;
reg [31:0] sraml_rdata;

// always @(posedge clk) begin
//     if(rst)begin
//         sraml_paddr    <= 0;
//         sraml_v_blkidx <= 0;
//         sraml_wen      <= 0;
//         sraml_cached   <= 0;
//         sraml_wdata    <= 0;
//     end
//     else begin
//         if(state==`IDLE&&en&&(!cached||!(|hit_way)&&cache_grant)) begin
//             sraml_paddr    <= paddr;
//             sraml_v_blkidx <= v_blkidx;
//             sraml_wen      <= wen;
//             sraml_cached   <= cached;
//             sraml_wdata    <= wdata;
//         end
//         else begin
//             sraml_paddr    <= sraml_paddr;
//             sraml_v_blkidx <= sraml_v_blkidx;
//             sraml_wen      <= sraml_wen;
//             sraml_cached   <= sraml_cached;
//             sraml_wdata    <= sraml_wdata;
//         end
//     end
// end

always @(posedge clk) begin
    if(rst)begin
        sraml_rdata <= 0;
    end
    else begin
        if(en&&!flush)begin
            if(state==`IDLE&&cached&&|hit_way&&longest_stall)begin
                sraml_rdata <= sraml_cache_rdata; 
            end
            else if(state==`VALID&&longest_stall)begin
                sraml_rdata <= sraml_cache_rdata;
            end
            else if(state==`UNCACHE&&handler_fin&&longest_stall)begin
                sraml_rdata <= handler_rdata;
            end
            else begin
                sraml_rdata <= sraml_rdata;
            end
        end
        else begin
            sraml_rdata <= sraml_rdata;
        end
    end
end

assign hit_way =   {cache_valid_r[3]&&
                    cache_tag_r[TAG_BIT*4-1:TAG_BIT*3]==sraml_ptag, 
                    
                    cache_valid_r[2]&&
                    cache_tag_r[TAG_BIT*3-1:TAG_BIT*2]==sraml_ptag, 
                    
                    cache_valid_r[1]&&
                    cache_tag_r[TAG_BIT*2-1:TAG_BIT*1]==sraml_ptag, 
                    
                    cache_valid_r[0]&&
                    cache_tag_r[TAG_BIT-1:0]==sraml_ptag};

// generate output 
// sram like interface
assign rdata =  state == `FIN ?     sraml_rdata  :
                state == `UNCACHE ? handler_rdata:
                {32{hit_way[3]}} & cache_rdata[127:96] |
                {32{hit_way[2]}} & cache_rdata[ 95:64] |
                {32{hit_way[1]}} & cache_rdata[ 63:32] |
                {32{hit_way[0]}} & cache_rdata[ 31: 0];

assign stall =  state==`IDLE&&en&&!flush&&(!cached||!cache_grant||!(|hit_way)) ||
                state==`FETCH&&!flush ||
                state==`UNCACHE && !handler_fin&&!flush;
// miss handler interact channel
assign handler_req= state==`IDLE&&en&&!flush&&(!cached||cache_grant&&!(|hit_way)) ||
                    state==`FETCH&&!flush||
                    state==`UNCACHE&&!flush;

assign handler_cached = cached;
assign handler_w = |wen;
assign handler_paddr = paddr;
assign handler_blkidx = v_blkidx;
assign handler_wdata = wdata;
assign handler_wen = wen;

// channel mux control
assign cache_mux_control = state==`FETCH;
// cache access request
assign cache_req =  state==`IDLE&&en&&!flush&&!cached ||
                    state==`FETCH&&!flush || // may be optional
                    state==`VALID&&!flush;
// cache line select channel
assign cache_blkidx = v_blkidx;
assign cache_wrdidx = paddr[WRDIDX_BIT+2-1:2];
// cache data interact channel
assign cache_wdata = {4{wdata}};
assign cache_wen =  state==`VALID||state==`IDLE&&en&&!flush&&cached&&cache_grant?
                        {wen&{4{hit_way[3]}},
                         wen&{4{hit_way[2]}}, 
                         wen&{4{hit_way[1]}}, 
                         wen&{4{hit_way[0]}}} :
                         16'b0;
//cache meta interact channel
// tag field (this module will not modify tag field)
assign wen_cache_tag = 0; 
assign cache_tag_w = 0;
// valid bit (this module will not modify tag field)
assign wen_cache_valid = 0;
assign cache_valid_w = 0;
// dirty bit
assign wen_cache_dirty = state==`VALID||state==`IDLE&&en&&!flush&&cached&&cache_grant ?
                            {|wen&hit_way[3], 
                             |wen&hit_way[2], 
                             |wen&hit_way[1], 
                             |wen&hit_way[0]} :
                             0;
assign cache_dirty_w = 4'b1111;
//history info
assign cache_wen_history =  state==`VALID||
                                state==`IDLE&&en&&!flush&&cached&&
                                cache_grant&&|hit_way;

assign cache_history_w = hit_way[3] ? cache_history_r|3'b101 :
                         hit_way[2] ? cache_history_r&~3'b100|3'b001 :
                         hit_way[1] ? cache_history_r&~3'b001|3'b010 :
                         hit_way[0] ? cache_history_r&~3'b101:
                         cache_history_r;

endmodule