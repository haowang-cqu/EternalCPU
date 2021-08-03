`timescale 1ns/1ps
// meta data of cache line, including valid bit, tag field and history 
module cache_meta_1bit #(
    parameter BLKIDX_BIT = 4 // number of block index bit
)
(
    input  clk, rst, // rst is high active
    // input  en, // specifies whether a valid input is on the input channel
    input  wen, // specifies whether to write new data
    input  [BLKIDX_BIT-1:0] blkidx, // index of cache block
    input  wdata, // data to be write
    output rdata // data read
);
    localparam BLK_NUM = 1<<BLKIDX_BIT;
    integer i;

    reg data[BLK_NUM-1:0];

    always @(posedge clk) begin
        if(rst)begin
            for(i=0;i<BLK_NUM;i=i+1)begin
                data[i] <= 0;
            end
        end
        else if(wen) begin
            data[blkidx] <= wdata;
        end
        else begin
            //do nothing
        end
    end

    assign rdata = data[blkidx];


endmodule