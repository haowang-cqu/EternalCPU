module godson_cpu_mid(
    input wire[4:0] interrupt_i,
    input wire coreclock,areset_n,
    input wire nmi,
    //ar
    output wire[3:0] arid,      //read request id, fixed 4'b0
    output wire[31:0] araddr,   //read request address
    output wire[3:0] arlen,     //read request transfer length(beats), fixed 4'b0
    output wire[2:0] arsize,    //read request transfer size(bytes per beats)
    output wire[1:0] arburst,   //transfer type, fixed 2'b01
    output wire[1:0] arlock,    //atomic lock, fixed 2'b0
    output wire[3:0] arcache,   //cache property, fixed 4'b0
    output wire[2:0] arprot,    //protect property, fixed 3'b0
    output wire arvalid,        //read request address valid
    input wire arready,         //slave end ready to receive address transfer
    //r              
    input wire[3:0] rid,        //equal to arid, can be ignored
    input wire[31:0] rdata,     //read data
    input wire[1:0] rresp,      //this read request finished successfully, can be ignored
    input wire rlast,           //the last beat data for this request, can be ignored
    input wire rvalid,          //read data valid
    output wire rready,         //master end ready to receive data transfer
    //aw           
    output wire[3:0] awid,      //write request id, fixed 4'b0
    output wire[31:0] awaddr,   //write request address
    output wire[3:0] awlen,     //write request transfer length(beats), fixed 4'b0
    output wire[2:0] awsize,    //write request transfer size(bytes per beats)
    output wire[1:0] awburst,   //transfer type, fixed 2'b01
    output wire[1:0] awlock,    //atomic lock, fixed 2'b01
    output wire[3:0] awcache,   //cache property, fixed 4'b01
    output wire[2:0] awprot,    //protect property, fixed 3'b01
    output wire awvalid,        //write request address valid
    input wire awready,         //slave end ready to receive address transfer
    //w          
    output wire[3:0] wid,       //equal to awid, fixed 4'b0
    output wire[31:0] wdata,    //write data
    output wire[3:0] wstrb,     //write data strobe select bit
    output wire wlast,          //the last beat data signal, fixed 1'b1
    output wire wvalid,         //write data valid
    input wire wready,          //slave end ready to receive data transfer
    //b              
    input wire[3:0] bid,       //equal to wid,awid, can be ignored
    input wire[1:0] bresp,     //this write request finished successfully, can be ignored
    input wire bvalid,          //write data valid
    output wire bready,          //master end ready to receive write response
    //EJTAG 
    input wire EJTAG_TCK,
    input wire EJTAG_TDI,
    input wire EJTAG_TMS,
    input wire EJTAG_TRST,
    input wire EJTAG_TDO,
    input wire prrst_to_core,
    input wire testmode
);
    wire[31:0] debug_wb_pc;
    wire[3:0] debug_wb_rf_wen;
    wire[4:0] debug_wb_rf_wnum;
    wire[31:0] debug_wb_rf_wdata;
    mycpu_top cpu(
        .aclk       (coreclock),
        .aresetn    (areset_n),
        .ext_int    ({1'b0,~interrupt_i}),
        .arid       (arid),
        .araddr     (araddr),
        .arlen      (arlen),
        .arsize     (arsize),
        .arburst    (arburst),
        .arlock     (arlock),
        .arcache    (arcache),
        .arprot     (arprot),
        .arvalid    (arvalid),
        .arready    (arready),
        .rid        (rid),
        .rdata      (rdata),
        .rresp      (rresp),
        .rlast      (rlast),
        .rvalid     (rvalid),
        .rready     (rready),
        .awid       (awid),
        .awaddr     (awaddr),
        .awlen      (awlen),
        .awsize		(awsize),
        .awburst    (awburst),
        .awlock     (awlock),
        .awcache    (awcache),
        .awprot     (awprot),
        .awvalid    (awvalid),
        .awready    (awready),
        .wid        (wid),
        .wdata      (wdata),
        .wstrb      (wstrb),
        .wlast      (wlast),
        .wvalid     (wvalid),
        .wready     (wready),
        .bid        (bid),
        .bresp      (bresp),
        .bvalid     (bvalid),
        .bready     (bready),
        .debug_wb_pc        (debug_wb_pc),
        .debug_wb_rf_wen    (debug_wb_rf_wen),
        .debug_wb_rf_wnum   (debug_wb_rf_wnum),
        .debug_wb_rf_wdata  (debug_wb_rf_wdata)
    );
endmodule