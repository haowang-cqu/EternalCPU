`timescale 1ns / 1ps
`define IDLE    2'b00
`define SRVA    2'b01
`define SRVB    2'b10
`define RESERVE 2'b11

/* 
 * ----------- axi 2*1 interconnect ---------------
 *       master A        master B
 *         | axi A (prior)  | axi B
 *         |                |
 *      +----------------------+
 *      | axi 2*1 interconnect |
 *      +----------------------+
 *                | aix Y
 *                |
 *             slave Y
 * ------------------------------------------------
 */
module axi_2x1_interconnect (
    // global
    input aclk_0, 
    input aresetn_0, 
    // interface A
    // read address channel
    input  [3 :0] S00_AXI_0_arid   ,
    input  [31:0] S00_AXI_0_araddr ,
    input  [7 :0] S00_AXI_0_arlen  ,
    input  [2 :0] S00_AXI_0_arsize ,
    input  [1 :0] S00_AXI_0_arburst,
    input  [1 :0] S00_AXI_0_arlock ,
    input  [3 :0] S00_AXI_0_arcache,
    input  [2 :0] S00_AXI_0_arprot ,
    input         S00_AXI_0_arvalid,
    output        S00_AXI_0_arready,
    // read data channel
    output [3 :0] S00_AXI_0_rid    ,
    output [31:0] S00_AXI_0_rdata  ,
    output [1 :0] S00_AXI_0_rresp  ,
    output        S00_AXI_0_rlast  ,
    output        S00_AXI_0_rvalid ,
    input         S00_AXI_0_rready ,
    // write address channel
    input  [3 :0] S00_AXI_0_awid   ,
    input  [31:0] S00_AXI_0_awaddr ,
    input  [7 :0] S00_AXI_0_awlen  ,
    input  [2 :0] S00_AXI_0_awsize ,
    input  [1 :0] S00_AXI_0_awburst,
    input  [1 :0] S00_AXI_0_awlock ,
    input  [3 :0] S00_AXI_0_awcache,
    input  [2 :0] S00_AXI_0_awprot ,
    input         S00_AXI_0_awvalid,
    output        S00_AXI_0_awready,
    // write data channel
    input  [3 :0] S00_AXI_0_wid    ,
    input  [31:0] S00_AXI_0_wdata  ,
    input  [3 :0] S00_AXI_0_wstrb  ,
    input         S00_AXI_0_wlast  ,
    input         S00_AXI_0_wvalid ,
    output        S00_AXI_0_wready ,
    // write response channel
    output [3 :0] S00_AXI_0_bid    ,
    output [1 :0] S00_AXI_0_bresp  ,
    output        S00_AXI_0_bvalid ,
    input         S00_AXI_0_bready ,
    
    // interface B
    // read address channel
    input  [3 :0] S01_AXI_0_arid   ,
    input  [31:0] S01_AXI_0_araddr ,
    input  [7 :0] S01_AXI_0_arlen  ,
    input  [2 :0] S01_AXI_0_arsize ,
    input  [1 :0] S01_AXI_0_arburst,
    input  [1 :0] S01_AXI_0_arlock ,
    input  [3 :0] S01_AXI_0_arcache,
    input  [2 :0] S01_AXI_0_arprot ,
    input         S01_AXI_0_arvalid,
    output        S01_AXI_0_arready,
    // read data channel
    output [3 :0] S01_AXI_0_rid    ,
    output [31:0] S01_AXI_0_rdata  ,
    output [1 :0] S01_AXI_0_rresp  ,
    output        S01_AXI_0_rlast  ,
    output        S01_AXI_0_rvalid ,
    input         S01_AXI_0_rready ,
    // write address channel
    input  [3 :0] S01_AXI_0_awid   ,
    input  [31:0] S01_AXI_0_awaddr ,
    input  [7 :0] S01_AXI_0_awlen  ,
    input  [2 :0] S01_AXI_0_awsize ,
    input  [1 :0] S01_AXI_0_awburst,
    input  [1 :0] S01_AXI_0_awlock ,
    input  [3 :0] S01_AXI_0_awcache,
    input  [2 :0] S01_AXI_0_awprot ,
    input         S01_AXI_0_awvalid,
    output        S01_AXI_0_awready,
    // write data channel
    input  [3 :0] S01_AXI_0_wid    ,
    input  [31:0] S01_AXI_0_wdata  ,
    input  [3 :0] S01_AXI_0_wstrb  ,
    input         S01_AXI_0_wlast  ,
    input         S01_AXI_0_wvalid ,
    output        S01_AXI_0_wready ,
    // write response channel
    output [3 :0] S01_AXI_0_bid    ,
    output [1 :0] S01_AXI_0_bresp  ,
    output        S01_AXI_0_bvalid ,
    input         S01_AXI_0_bready ,

    // interface Y
    // read address channel
    output [3 :0] M00_AXI_0_arid   ,
    output [31:0] M00_AXI_0_araddr ,
    output [7 :0] M00_AXI_0_arlen  ,
    output [2 :0] M00_AXI_0_arsize ,
    output [1 :0] M00_AXI_0_arburst,
    output [1 :0] M00_AXI_0_arlock ,
    output [3 :0] M00_AXI_0_arcache,
    output [2 :0] M00_AXI_0_arprot ,
    output        M00_AXI_0_arvalid,
    input         M00_AXI_0_arready,
    // read data channel
    input  [3 :0] M00_AXI_0_rid    ,
    input  [31:0] M00_AXI_0_rdata  ,
    input  [1 :0] M00_AXI_0_rresp  ,
    input         M00_AXI_0_rlast  ,
    input         M00_AXI_0_rvalid ,
    output        M00_AXI_0_rready ,
    // write address channel
    output [3 :0] M00_AXI_0_awid   ,
    output [31:0] M00_AXI_0_awaddr ,
    output [7 :0] M00_AXI_0_awlen  ,
    output [2 :0] M00_AXI_0_awsize ,
    output [1 :0] M00_AXI_0_awburst,
    output [1 :0] M00_AXI_0_awlock ,
    output [3 :0] M00_AXI_0_awcache,
    output [2 :0] M00_AXI_0_awprot ,
    output        M00_AXI_0_awvalid,
    input         M00_AXI_0_awready,
    // write data channel
    output [3 :0] M00_AXI_0_wid    ,
    output [31:0] M00_AXI_0_wdata  ,
    output [3 :0] M00_AXI_0_wstrb  ,
    output        M00_AXI_0_wlast  ,
    output        M00_AXI_0_wvalid ,
    input         M00_AXI_0_wready ,
    // write response channel
    input  [3 :0] M00_AXI_0_bid    ,
    input  [1 :0] M00_AXI_0_bresp  ,
    input         M00_AXI_0_bvalid ,
    output        M00_AXI_0_bready
);


wire S00_AXI_0_req ;
wire S01_AXI_0_req ;
wire S00_AXI_0_fin;
wire S01_AXI_0_fin;

assign S00_AXI_0_req  = S00_AXI_0_arvalid || S00_AXI_0_awvalid;
assign S01_AXI_0_req  = S01_AXI_0_arvalid || S01_AXI_0_awvalid;
assign S00_AXI_0_fin = S00_AXI_0_rready && S00_AXI_0_rvalid && S00_AXI_0_rlast ||
                S00_AXI_0_bready && S00_AXI_0_bvalid;

assign S01_AXI_0_fin = S01_AXI_0_rready && S01_AXI_0_rvalid && S01_AXI_0_rlast ||
                S01_AXI_0_bready && S01_AXI_0_bvalid;

reg [1:0] state;

//FSM
always @(posedge aclk_0)begin
    if(!aresetn_0)begin
        state <= `IDLE;
    end
    else begin
        case (state)
        `IDLE   : state <= S00_AXI_0_req  ? `SRVA :  // A is prior to B
                           S01_AXI_0_req  ? `SRVB : state;
        `SRVA   : state <= S00_AXI_0_fin  ? `IDLE : state;
        `SRVB   : state <= S01_AXI_0_fin  ? `IDLE : state;
        default : state <= state;
        endcase
    end
end

assign S00_AXI_0_arready = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_arready :
                   state == `SRVB ? 1'b0      : 1'b0 ;
                 
assign S00_AXI_0_rid     = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_rid     :
                   state == `SRVB ? 4'b0      : 4'b0 ;
                 
assign S00_AXI_0_rdata   = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_rdata   :
                   state == `SRVB ? 32'b0     : 32'b0;
                 
assign S00_AXI_0_rresp   = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_rresp   :
                   state == `SRVB ? 2'b0      : 2'b0 ;
                 
assign S00_AXI_0_rlast   = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_rlast   :
                   state == `SRVB ? 1'b0      : 1'b0 ;
                 
assign S00_AXI_0_rvalid  = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_rvalid  :
                   state == `SRVB ? 1'b0      : 1'b0 ;
                 
assign S00_AXI_0_awready = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_awready :
                   state == `SRVB ? 1'b0      : 1'b0 ;
                 
assign S00_AXI_0_wready  = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_wready  :
                   state == `SRVB ? 1'b0      : 1'b0 ;
                 
assign S00_AXI_0_bid     = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_bid     :
                   state == `SRVB ? 4'b0      : 4'b0 ;
                 
assign S00_AXI_0_bresp   = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_bresp   :
                   state == `SRVB ? 2'b0      : 2'b0 ;
                 
assign S00_AXI_0_bvalid  = state == `IDLE ? 0         :
                   state == `SRVA ? M00_AXI_0_bvalid  :
                   state == `SRVB ? 1'b0      : 1'b0 ;
 
assign S01_AXI_0_arready = state == `IDLE ? 0         :
                   state == `SRVA ? 1'b0      :
                   state == `SRVB ? M00_AXI_0_arready : 1'b0 ;
 
assign S01_AXI_0_rid     = state == `IDLE ? 0         : 
                   state == `SRVA ? 4'b0      : 
                   state == `SRVB ? M00_AXI_0_rid     : 4'b0 ;

assign S01_AXI_0_rdata   = state == `IDLE ? 0         :
                   state == `SRVA ? 32'b0     :
                   state == `SRVB ? M00_AXI_0_rdata   : 32'b0;
    
assign S01_AXI_0_rresp   = state == `IDLE ? 0         :
                   state == `SRVA ? 2'b0      :
                   state == `SRVB ? M00_AXI_0_rresp   : 2'b0 ;

assign S01_AXI_0_rlast   = state == `IDLE ? 0         : 
                   state == `SRVA ? 1'b0      : 
                   state == `SRVB ? M00_AXI_0_rlast   : 1'b0 ;

assign S01_AXI_0_rvalid  = state == `IDLE ? 0         : 
                   state == `SRVA ? 1'b0      : 
                   state == `SRVB ? M00_AXI_0_rvalid  : 1'b0 ;                                      

assign S01_AXI_0_awready = state == `IDLE ? 0         : 
                   state == `SRVA ? 1'b0      : 
                   state == `SRVB ? M00_AXI_0_awready : 1'b0 ; 

assign S01_AXI_0_wready  = state == `IDLE ? 0         : 
                   state == `SRVA ? 1'b0      : 
                   state == `SRVB ? M00_AXI_0_wready  : 1'b0 ;                  

assign S01_AXI_0_bid     = state == `IDLE ? 0         : 
                   state == `SRVA ? 4'b0      : 
                   state == `SRVB ? M00_AXI_0_bid     : 4'b0 ;                

assign S01_AXI_0_bresp   = state == `IDLE ? 0         : 
                   state == `SRVA ? 2'b0      : 
                   state == `SRVB ? M00_AXI_0_bresp   : 2'b0 ;

assign S01_AXI_0_bvalid  = state == `IDLE ? 0         : 
                   state == `SRVA ? 1'b0      : 
                   state == `SRVB ? M00_AXI_0_bvalid  : 1'b0 ;                   

assign M00_AXI_0_arid    = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_arid    :
                   state == `SRVB ? S01_AXI_0_arid    : 0; 
 
assign M00_AXI_0_araddr  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_araddr  :
                   state == `SRVB ? S01_AXI_0_araddr  : 0; 
 
assign M00_AXI_0_arlen   = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_arlen   :
                   state == `SRVB ? S01_AXI_0_arlen   : 0; 
 
assign M00_AXI_0_arsize  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_arsize  :
                   state == `SRVB ? S01_AXI_0_arsize  : 0; 
 
assign M00_AXI_0_arburst = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_arburst :
                   state == `SRVB ? S01_AXI_0_arburst : 0;

assign M00_AXI_0_arlock  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_arlock  :
                   state == `SRVB ? S01_AXI_0_arlock  : 0;

assign M00_AXI_0_arcache = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_arcache :
                   state == `SRVB ? S01_AXI_0_arcache : 0;

assign M00_AXI_0_arprot  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_arprot  :
                   state == `SRVB ? S01_AXI_0_arprot  : 0;

assign M00_AXI_0_arvalid = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_arvalid :
                   state == `SRVB ? S01_AXI_0_arvalid : 0;                   

assign M00_AXI_0_rready  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_rready  :
                   state == `SRVB ? S01_AXI_0_rready  : 0;

assign M00_AXI_0_awid    = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_awid    :
                   state == `SRVB ? S01_AXI_0_awid    : 0;

assign M00_AXI_0_awaddr  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_awaddr  :
                   state == `SRVB ? S01_AXI_0_awaddr  : 0;                   

assign M00_AXI_0_awlen   = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_awlen   :
                   state == `SRVB ? S01_AXI_0_awlen   : 0;                   

assign M00_AXI_0_awsize  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_awsize  :
                   state == `SRVB ? S01_AXI_0_awsize  : 0;

assign M00_AXI_0_awburst = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_awburst :
                   state == `SRVB ? S01_AXI_0_awburst : 0;

assign M00_AXI_0_awlock  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_awlock  :
                   state == `SRVB ? S01_AXI_0_awlock  : 0;

assign M00_AXI_0_awcache = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_awcache :
                   state == `SRVB ? S01_AXI_0_awcache : 0;

assign M00_AXI_0_awprot  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_awprot  :
                   state == `SRVB ? S01_AXI_0_awprot  : 0;

assign M00_AXI_0_awvalid = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_awvalid :
                   state == `SRVB ? S01_AXI_0_awvalid : 0;

assign M00_AXI_0_wid     = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_wid     :
                   state == `SRVB ? S01_AXI_0_wid     : 0;

assign M00_AXI_0_wdata   = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_wdata   :
                   state == `SRVB ? S01_AXI_0_wdata   : 0;

assign M00_AXI_0_wstrb   = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_wstrb   :
                   state == `SRVB ? S01_AXI_0_wstrb   : 0;

assign M00_AXI_0_wlast   = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_wlast   :
                   state == `SRVB ? S01_AXI_0_wlast   : 0;

assign M00_AXI_0_wvalid  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_wvalid  :
                   state == `SRVB ? S01_AXI_0_wvalid  : 0;

assign M00_AXI_0_bready  = state == `IDLE ? 0         :
                   state == `SRVA ? S00_AXI_0_bready  :
                   state == `SRVB ? S01_AXI_0_bready  : 0;

endmodule