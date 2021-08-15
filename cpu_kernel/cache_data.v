`timescale 1ps/1ps

module cache_data #(
    parameter BLKIDX_BIT = 4, // number of block index bit
    parameter WRDIDX_BIT = 4 // number of word index bit
)
(
    input  clk, rst, // rst is high active
    // input  en, // specifies whether a valid input is on the input channel
    input  [BLKIDX_BIT-1:0] blkidx, // index of cache block
    input  [WRDIDX_BIT-1:0] wrdidx, // index of cache word
    input  [31:          0] wdata, // data to be write
    input  [ 3:          0] wen, // specifies the bytes to be wirte     
    output [31:          0] rdata // data read
);

localparam BLK_NUM = 1<<BLKIDX_BIT;
localparam WRD_NUM = 1<<WRDIDX_BIT;
wire [31:0] selword; // the selected world
wire [31:0] wrtmask; // write mask
integer i, j;

reg [31:0] data[BLK_NUM-1:0][WRD_NUM-1:0]; // data storage

assign selword = data[blkidx][wrdidx];
assign wrtmask = {{8{wen[3]}}, {8{wen[2]}}, {8{wen[1]}}, {8{wen[0]}}};
always @(posedge clk) begin
    // if(rst)begin
    //     for(i=0;i<BLK_NUM;i=i+1)begin
    //         for(j=0;j<WRD_NUM;j=j+1)begin
    //             data[i][j] <= 32'b0;
    //         end
    //     end
    // end
    if(wen) begin
        data[blkidx][wrdidx] <= selword & ~wrtmask | wdata & wrtmask;
    end
    else begin
        // do nothing
    end
end

assign rdata = selword;
    
endmodule
