//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Tue Aug  3 15:06:58 2021
//Host        : NSCSCC-Server running 64-bit Debian GNU/Linux 11 (bullseye)
//Command     : generate_target axi_crossbar_2x1_wrapper.bd
//Design      : axi_crossbar_2x1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module axi_crossbar_2x1_wrapper
   (M00_AXI_0_araddr,
    M00_AXI_0_arburst,
    M00_AXI_0_arcache,
    M00_AXI_0_arlen,
    M00_AXI_0_arlock,
    M00_AXI_0_arprot,
    M00_AXI_0_arqos,
    M00_AXI_0_arready,
    M00_AXI_0_arsize,
    M00_AXI_0_arvalid,
    M00_AXI_0_awaddr,
    M00_AXI_0_awburst,
    M00_AXI_0_awcache,
    M00_AXI_0_awlen,
    M00_AXI_0_awlock,
    M00_AXI_0_awprot,
    M00_AXI_0_awqos,
    M00_AXI_0_awready,
    M00_AXI_0_awsize,
    M00_AXI_0_awvalid,
    M00_AXI_0_bready,
    M00_AXI_0_bresp,
    M00_AXI_0_bvalid,
    M00_AXI_0_rdata,
    M00_AXI_0_rlast,
    M00_AXI_0_rready,
    M00_AXI_0_rresp,
    M00_AXI_0_rvalid,
    M00_AXI_0_wdata,
    M00_AXI_0_wlast,
    M00_AXI_0_wready,
    M00_AXI_0_wstrb,
    M00_AXI_0_wvalid,
    S00_AXI_0_araddr,
    S00_AXI_0_arburst,
    S00_AXI_0_arcache,
    S00_AXI_0_arlen,
    S00_AXI_0_arlock,
    S00_AXI_0_arprot,
    S00_AXI_0_arqos,
    S00_AXI_0_arready,
    S00_AXI_0_arsize,
    S00_AXI_0_arvalid,
    S00_AXI_0_awaddr,
    S00_AXI_0_awburst,
    S00_AXI_0_awcache,
    S00_AXI_0_awlen,
    S00_AXI_0_awlock,
    S00_AXI_0_awprot,
    S00_AXI_0_awqos,
    S00_AXI_0_awready,
    S00_AXI_0_awsize,
    S00_AXI_0_awvalid,
    S00_AXI_0_bready,
    S00_AXI_0_bresp,
    S00_AXI_0_bvalid,
    S00_AXI_0_rdata,
    S00_AXI_0_rlast,
    S00_AXI_0_rready,
    S00_AXI_0_rresp,
    S00_AXI_0_rvalid,
    S00_AXI_0_wdata,
    S00_AXI_0_wlast,
    S00_AXI_0_wready,
    S00_AXI_0_wstrb,
    S00_AXI_0_wvalid,
    S01_AXI_0_araddr,
    S01_AXI_0_arburst,
    S01_AXI_0_arcache,
    S01_AXI_0_arlen,
    S01_AXI_0_arlock,
    S01_AXI_0_arprot,
    S01_AXI_0_arqos,
    S01_AXI_0_arready,
    S01_AXI_0_arsize,
    S01_AXI_0_arvalid,
    S01_AXI_0_awaddr,
    S01_AXI_0_awburst,
    S01_AXI_0_awcache,
    S01_AXI_0_awlen,
    S01_AXI_0_awlock,
    S01_AXI_0_awprot,
    S01_AXI_0_awqos,
    S01_AXI_0_awready,
    S01_AXI_0_awsize,
    S01_AXI_0_awvalid,
    S01_AXI_0_bready,
    S01_AXI_0_bresp,
    S01_AXI_0_bvalid,
    S01_AXI_0_rdata,
    S01_AXI_0_rlast,
    S01_AXI_0_rready,
    S01_AXI_0_rresp,
    S01_AXI_0_rvalid,
    S01_AXI_0_wdata,
    S01_AXI_0_wlast,
    S01_AXI_0_wready,
    S01_AXI_0_wstrb,
    S01_AXI_0_wvalid,
    aclk_0,
    aresetn_0);
  output [31:0]M00_AXI_0_araddr;
  output [1:0]M00_AXI_0_arburst;
  output [3:0]M00_AXI_0_arcache;
  output [7:0]M00_AXI_0_arlen;
  output [0:0]M00_AXI_0_arlock;
  output [2:0]M00_AXI_0_arprot;
  output [3:0]M00_AXI_0_arqos;
  input M00_AXI_0_arready;
  output [2:0]M00_AXI_0_arsize;
  output M00_AXI_0_arvalid;
  output [31:0]M00_AXI_0_awaddr;
  output [1:0]M00_AXI_0_awburst;
  output [3:0]M00_AXI_0_awcache;
  output [7:0]M00_AXI_0_awlen;
  output [0:0]M00_AXI_0_awlock;
  output [2:0]M00_AXI_0_awprot;
  output [3:0]M00_AXI_0_awqos;
  input M00_AXI_0_awready;
  output [2:0]M00_AXI_0_awsize;
  output M00_AXI_0_awvalid;
  output M00_AXI_0_bready;
  input [1:0]M00_AXI_0_bresp;
  input M00_AXI_0_bvalid;
  input [31:0]M00_AXI_0_rdata;
  input M00_AXI_0_rlast;
  output M00_AXI_0_rready;
  input [1:0]M00_AXI_0_rresp;
  input M00_AXI_0_rvalid;
  output [31:0]M00_AXI_0_wdata;
  output M00_AXI_0_wlast;
  input M00_AXI_0_wready;
  output [3:0]M00_AXI_0_wstrb;
  output M00_AXI_0_wvalid;
  input [31:0]S00_AXI_0_araddr;
  input [1:0]S00_AXI_0_arburst;
  input [3:0]S00_AXI_0_arcache;
  input [7:0]S00_AXI_0_arlen;
  input [0:0]S00_AXI_0_arlock;
  input [2:0]S00_AXI_0_arprot;
  input [3:0]S00_AXI_0_arqos;
  output S00_AXI_0_arready;
  input [2:0]S00_AXI_0_arsize;
  input S00_AXI_0_arvalid;
  input [31:0]S00_AXI_0_awaddr;
  input [1:0]S00_AXI_0_awburst;
  input [3:0]S00_AXI_0_awcache;
  input [7:0]S00_AXI_0_awlen;
  input [0:0]S00_AXI_0_awlock;
  input [2:0]S00_AXI_0_awprot;
  input [3:0]S00_AXI_0_awqos;
  output S00_AXI_0_awready;
  input [2:0]S00_AXI_0_awsize;
  input S00_AXI_0_awvalid;
  input S00_AXI_0_bready;
  output [1:0]S00_AXI_0_bresp;
  output S00_AXI_0_bvalid;
  output [31:0]S00_AXI_0_rdata;
  output S00_AXI_0_rlast;
  input S00_AXI_0_rready;
  output [1:0]S00_AXI_0_rresp;
  output S00_AXI_0_rvalid;
  input [31:0]S00_AXI_0_wdata;
  input S00_AXI_0_wlast;
  output S00_AXI_0_wready;
  input [3:0]S00_AXI_0_wstrb;
  input S00_AXI_0_wvalid;
  input [31:0]S01_AXI_0_araddr;
  input [1:0]S01_AXI_0_arburst;
  input [3:0]S01_AXI_0_arcache;
  input [7:0]S01_AXI_0_arlen;
  input [0:0]S01_AXI_0_arlock;
  input [2:0]S01_AXI_0_arprot;
  input [3:0]S01_AXI_0_arqos;
  output S01_AXI_0_arready;
  input [2:0]S01_AXI_0_arsize;
  input S01_AXI_0_arvalid;
  input [31:0]S01_AXI_0_awaddr;
  input [1:0]S01_AXI_0_awburst;
  input [3:0]S01_AXI_0_awcache;
  input [7:0]S01_AXI_0_awlen;
  input [0:0]S01_AXI_0_awlock;
  input [2:0]S01_AXI_0_awprot;
  input [3:0]S01_AXI_0_awqos;
  output S01_AXI_0_awready;
  input [2:0]S01_AXI_0_awsize;
  input S01_AXI_0_awvalid;
  input S01_AXI_0_bready;
  output [1:0]S01_AXI_0_bresp;
  output S01_AXI_0_bvalid;
  output [31:0]S01_AXI_0_rdata;
  output S01_AXI_0_rlast;
  input S01_AXI_0_rready;
  output [1:0]S01_AXI_0_rresp;
  output S01_AXI_0_rvalid;
  input [31:0]S01_AXI_0_wdata;
  input S01_AXI_0_wlast;
  output S01_AXI_0_wready;
  input [3:0]S01_AXI_0_wstrb;
  input S01_AXI_0_wvalid;
  input aclk_0;
  input aresetn_0;

  wire [31:0]M00_AXI_0_araddr;
  wire [1:0]M00_AXI_0_arburst;
  wire [3:0]M00_AXI_0_arcache;
  wire [7:0]M00_AXI_0_arlen;
  wire [0:0]M00_AXI_0_arlock;
  wire [2:0]M00_AXI_0_arprot;
  wire [3:0]M00_AXI_0_arqos;
  wire M00_AXI_0_arready;
  wire [2:0]M00_AXI_0_arsize;
  wire M00_AXI_0_arvalid;
  wire [31:0]M00_AXI_0_awaddr;
  wire [1:0]M00_AXI_0_awburst;
  wire [3:0]M00_AXI_0_awcache;
  wire [7:0]M00_AXI_0_awlen;
  wire [0:0]M00_AXI_0_awlock;
  wire [2:0]M00_AXI_0_awprot;
  wire [3:0]M00_AXI_0_awqos;
  wire M00_AXI_0_awready;
  wire [2:0]M00_AXI_0_awsize;
  wire M00_AXI_0_awvalid;
  wire M00_AXI_0_bready;
  wire [1:0]M00_AXI_0_bresp;
  wire M00_AXI_0_bvalid;
  wire [31:0]M00_AXI_0_rdata;
  wire M00_AXI_0_rlast;
  wire M00_AXI_0_rready;
  wire [1:0]M00_AXI_0_rresp;
  wire M00_AXI_0_rvalid;
  wire [31:0]M00_AXI_0_wdata;
  wire M00_AXI_0_wlast;
  wire M00_AXI_0_wready;
  wire [3:0]M00_AXI_0_wstrb;
  wire M00_AXI_0_wvalid;
  wire [31:0]S00_AXI_0_araddr;
  wire [1:0]S00_AXI_0_arburst;
  wire [3:0]S00_AXI_0_arcache;
  wire [7:0]S00_AXI_0_arlen;
  wire [0:0]S00_AXI_0_arlock;
  wire [2:0]S00_AXI_0_arprot;
  wire [3:0]S00_AXI_0_arqos;
  wire S00_AXI_0_arready;
  wire [2:0]S00_AXI_0_arsize;
  wire S00_AXI_0_arvalid;
  wire [31:0]S00_AXI_0_awaddr;
  wire [1:0]S00_AXI_0_awburst;
  wire [3:0]S00_AXI_0_awcache;
  wire [7:0]S00_AXI_0_awlen;
  wire [0:0]S00_AXI_0_awlock;
  wire [2:0]S00_AXI_0_awprot;
  wire [3:0]S00_AXI_0_awqos;
  wire S00_AXI_0_awready;
  wire [2:0]S00_AXI_0_awsize;
  wire S00_AXI_0_awvalid;
  wire S00_AXI_0_bready;
  wire [1:0]S00_AXI_0_bresp;
  wire S00_AXI_0_bvalid;
  wire [31:0]S00_AXI_0_rdata;
  wire S00_AXI_0_rlast;
  wire S00_AXI_0_rready;
  wire [1:0]S00_AXI_0_rresp;
  wire S00_AXI_0_rvalid;
  wire [31:0]S00_AXI_0_wdata;
  wire S00_AXI_0_wlast;
  wire S00_AXI_0_wready;
  wire [3:0]S00_AXI_0_wstrb;
  wire S00_AXI_0_wvalid;
  wire [31:0]S01_AXI_0_araddr;
  wire [1:0]S01_AXI_0_arburst;
  wire [3:0]S01_AXI_0_arcache;
  wire [7:0]S01_AXI_0_arlen;
  wire [0:0]S01_AXI_0_arlock;
  wire [2:0]S01_AXI_0_arprot;
  wire [3:0]S01_AXI_0_arqos;
  wire S01_AXI_0_arready;
  wire [2:0]S01_AXI_0_arsize;
  wire S01_AXI_0_arvalid;
  wire [31:0]S01_AXI_0_awaddr;
  wire [1:0]S01_AXI_0_awburst;
  wire [3:0]S01_AXI_0_awcache;
  wire [7:0]S01_AXI_0_awlen;
  wire [0:0]S01_AXI_0_awlock;
  wire [2:0]S01_AXI_0_awprot;
  wire [3:0]S01_AXI_0_awqos;
  wire S01_AXI_0_awready;
  wire [2:0]S01_AXI_0_awsize;
  wire S01_AXI_0_awvalid;
  wire S01_AXI_0_bready;
  wire [1:0]S01_AXI_0_bresp;
  wire S01_AXI_0_bvalid;
  wire [31:0]S01_AXI_0_rdata;
  wire S01_AXI_0_rlast;
  wire S01_AXI_0_rready;
  wire [1:0]S01_AXI_0_rresp;
  wire S01_AXI_0_rvalid;
  wire [31:0]S01_AXI_0_wdata;
  wire S01_AXI_0_wlast;
  wire S01_AXI_0_wready;
  wire [3:0]S01_AXI_0_wstrb;
  wire S01_AXI_0_wvalid;
  wire aclk_0;
  wire aresetn_0;

  axi_crossbar_2x1 axi_crossbar_2x1_i
       (.M00_AXI_0_araddr(M00_AXI_0_araddr),
        .M00_AXI_0_arburst(M00_AXI_0_arburst),
        .M00_AXI_0_arcache(M00_AXI_0_arcache),
        .M00_AXI_0_arlen(M00_AXI_0_arlen),
        .M00_AXI_0_arlock(M00_AXI_0_arlock),
        .M00_AXI_0_arprot(M00_AXI_0_arprot),
        .M00_AXI_0_arqos(M00_AXI_0_arqos),
        .M00_AXI_0_arready(M00_AXI_0_arready),
        .M00_AXI_0_arsize(M00_AXI_0_arsize),
        .M00_AXI_0_arvalid(M00_AXI_0_arvalid),
        .M00_AXI_0_awaddr(M00_AXI_0_awaddr),
        .M00_AXI_0_awburst(M00_AXI_0_awburst),
        .M00_AXI_0_awcache(M00_AXI_0_awcache),
        .M00_AXI_0_awlen(M00_AXI_0_awlen),
        .M00_AXI_0_awlock(M00_AXI_0_awlock),
        .M00_AXI_0_awprot(M00_AXI_0_awprot),
        .M00_AXI_0_awqos(M00_AXI_0_awqos),
        .M00_AXI_0_awready(M00_AXI_0_awready),
        .M00_AXI_0_awsize(M00_AXI_0_awsize),
        .M00_AXI_0_awvalid(M00_AXI_0_awvalid),
        .M00_AXI_0_bready(M00_AXI_0_bready),
        .M00_AXI_0_bresp(M00_AXI_0_bresp),
        .M00_AXI_0_bvalid(M00_AXI_0_bvalid),
        .M00_AXI_0_rdata(M00_AXI_0_rdata),
        .M00_AXI_0_rlast(M00_AXI_0_rlast),
        .M00_AXI_0_rready(M00_AXI_0_rready),
        .M00_AXI_0_rresp(M00_AXI_0_rresp),
        .M00_AXI_0_rvalid(M00_AXI_0_rvalid),
        .M00_AXI_0_wdata(M00_AXI_0_wdata),
        .M00_AXI_0_wlast(M00_AXI_0_wlast),
        .M00_AXI_0_wready(M00_AXI_0_wready),
        .M00_AXI_0_wstrb(M00_AXI_0_wstrb),
        .M00_AXI_0_wvalid(M00_AXI_0_wvalid),
        .S00_AXI_0_araddr(S00_AXI_0_araddr),
        .S00_AXI_0_arburst(S00_AXI_0_arburst),
        .S00_AXI_0_arcache(S00_AXI_0_arcache),
        .S00_AXI_0_arlen(S00_AXI_0_arlen),
        .S00_AXI_0_arlock(S00_AXI_0_arlock),
        .S00_AXI_0_arprot(S00_AXI_0_arprot),
        .S00_AXI_0_arqos(S00_AXI_0_arqos),
        .S00_AXI_0_arready(S00_AXI_0_arready),
        .S00_AXI_0_arsize(S00_AXI_0_arsize),
        .S00_AXI_0_arvalid(S00_AXI_0_arvalid),
        .S00_AXI_0_awaddr(S00_AXI_0_awaddr),
        .S00_AXI_0_awburst(S00_AXI_0_awburst),
        .S00_AXI_0_awcache(S00_AXI_0_awcache),
        .S00_AXI_0_awlen(S00_AXI_0_awlen),
        .S00_AXI_0_awlock(S00_AXI_0_awlock),
        .S00_AXI_0_awprot(S00_AXI_0_awprot),
        .S00_AXI_0_awqos(S00_AXI_0_awqos),
        .S00_AXI_0_awready(S00_AXI_0_awready),
        .S00_AXI_0_awsize(S00_AXI_0_awsize),
        .S00_AXI_0_awvalid(S00_AXI_0_awvalid),
        .S00_AXI_0_bready(S00_AXI_0_bready),
        .S00_AXI_0_bresp(S00_AXI_0_bresp),
        .S00_AXI_0_bvalid(S00_AXI_0_bvalid),
        .S00_AXI_0_rdata(S00_AXI_0_rdata),
        .S00_AXI_0_rlast(S00_AXI_0_rlast),
        .S00_AXI_0_rready(S00_AXI_0_rready),
        .S00_AXI_0_rresp(S00_AXI_0_rresp),
        .S00_AXI_0_rvalid(S00_AXI_0_rvalid),
        .S00_AXI_0_wdata(S00_AXI_0_wdata),
        .S00_AXI_0_wlast(S00_AXI_0_wlast),
        .S00_AXI_0_wready(S00_AXI_0_wready),
        .S00_AXI_0_wstrb(S00_AXI_0_wstrb),
        .S00_AXI_0_wvalid(S00_AXI_0_wvalid),
        .S01_AXI_0_araddr(S01_AXI_0_araddr),
        .S01_AXI_0_arburst(S01_AXI_0_arburst),
        .S01_AXI_0_arcache(S01_AXI_0_arcache),
        .S01_AXI_0_arlen(S01_AXI_0_arlen),
        .S01_AXI_0_arlock(S01_AXI_0_arlock),
        .S01_AXI_0_arprot(S01_AXI_0_arprot),
        .S01_AXI_0_arqos(S01_AXI_0_arqos),
        .S01_AXI_0_arready(S01_AXI_0_arready),
        .S01_AXI_0_arsize(S01_AXI_0_arsize),
        .S01_AXI_0_arvalid(S01_AXI_0_arvalid),
        .S01_AXI_0_awaddr(S01_AXI_0_awaddr),
        .S01_AXI_0_awburst(S01_AXI_0_awburst),
        .S01_AXI_0_awcache(S01_AXI_0_awcache),
        .S01_AXI_0_awlen(S01_AXI_0_awlen),
        .S01_AXI_0_awlock(S01_AXI_0_awlock),
        .S01_AXI_0_awprot(S01_AXI_0_awprot),
        .S01_AXI_0_awqos(S01_AXI_0_awqos),
        .S01_AXI_0_awready(S01_AXI_0_awready),
        .S01_AXI_0_awsize(S01_AXI_0_awsize),
        .S01_AXI_0_awvalid(S01_AXI_0_awvalid),
        .S01_AXI_0_bready(S01_AXI_0_bready),
        .S01_AXI_0_bresp(S01_AXI_0_bresp),
        .S01_AXI_0_bvalid(S01_AXI_0_bvalid),
        .S01_AXI_0_rdata(S01_AXI_0_rdata),
        .S01_AXI_0_rlast(S01_AXI_0_rlast),
        .S01_AXI_0_rready(S01_AXI_0_rready),
        .S01_AXI_0_rresp(S01_AXI_0_rresp),
        .S01_AXI_0_rvalid(S01_AXI_0_rvalid),
        .S01_AXI_0_wdata(S01_AXI_0_wdata),
        .S01_AXI_0_wlast(S01_AXI_0_wlast),
        .S01_AXI_0_wready(S01_AXI_0_wready),
        .S01_AXI_0_wstrb(S01_AXI_0_wstrb),
        .S01_AXI_0_wvalid(S01_AXI_0_wvalid),
        .aclk_0(aclk_0),
        .aresetn_0(aresetn_0));
endmodule
