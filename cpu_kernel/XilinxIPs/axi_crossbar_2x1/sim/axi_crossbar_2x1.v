//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Tue Aug  3 21:53:04 2021
//Host        : cyy-pc running 64-bit Debian GNU/Linux 11 (bullseye)
//Command     : generate_target axi_crossbar_2x1.bd
//Design      : axi_crossbar_2x1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* HW_HANDOFF = "axi_crossbar_2x1.hwdef" *) (* core_generation_info = "axi_crossbar_2x1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=axi_crossbar_2x1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) 
module axi_crossbar_2x1
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
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME M00_AXI_0, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN axi_crossbar_2x1_aclk_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [31:0]M00_AXI_0_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARBURST" *) output [1:0]M00_AXI_0_arburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARCACHE" *) output [3:0]M00_AXI_0_arcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARLEN" *) output [7:0]M00_AXI_0_arlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARLOCK" *) output [0:0]M00_AXI_0_arlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARPROT" *) output [2:0]M00_AXI_0_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARQOS" *) output [3:0]M00_AXI_0_arqos;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARREADY" *) input M00_AXI_0_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARSIZE" *) output [2:0]M00_AXI_0_arsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 ARVALID" *) output M00_AXI_0_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWADDR" *) output [31:0]M00_AXI_0_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWBURST" *) output [1:0]M00_AXI_0_awburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWCACHE" *) output [3:0]M00_AXI_0_awcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWLEN" *) output [7:0]M00_AXI_0_awlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWLOCK" *) output [0:0]M00_AXI_0_awlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWPROT" *) output [2:0]M00_AXI_0_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWQOS" *) output [3:0]M00_AXI_0_awqos;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWREADY" *) input M00_AXI_0_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWSIZE" *) output [2:0]M00_AXI_0_awsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 AWVALID" *) output M00_AXI_0_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 BREADY" *) output M00_AXI_0_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 BRESP" *) input [1:0]M00_AXI_0_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 BVALID" *) input M00_AXI_0_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 RDATA" *) input [31:0]M00_AXI_0_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 RLAST" *) input M00_AXI_0_rlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 RREADY" *) output M00_AXI_0_rready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 RRESP" *) input [1:0]M00_AXI_0_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 RVALID" *) input M00_AXI_0_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 WDATA" *) output [31:0]M00_AXI_0_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 WLAST" *) output M00_AXI_0_wlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 WREADY" *) input M00_AXI_0_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 WSTRB" *) output [3:0]M00_AXI_0_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 M00_AXI_0 WVALID" *) output M00_AXI_0_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME S00_AXI_0, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN axi_crossbar_2x1_aclk_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]S00_AXI_0_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARBURST" *) input [1:0]S00_AXI_0_arburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARCACHE" *) input [3:0]S00_AXI_0_arcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARLEN" *) input [7:0]S00_AXI_0_arlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARLOCK" *) input [0:0]S00_AXI_0_arlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARPROT" *) input [2:0]S00_AXI_0_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARQOS" *) input [3:0]S00_AXI_0_arqos;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARREADY" *) output S00_AXI_0_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARSIZE" *) input [2:0]S00_AXI_0_arsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARVALID" *) input S00_AXI_0_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWADDR" *) input [31:0]S00_AXI_0_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWBURST" *) input [1:0]S00_AXI_0_awburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWCACHE" *) input [3:0]S00_AXI_0_awcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWLEN" *) input [7:0]S00_AXI_0_awlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWLOCK" *) input [0:0]S00_AXI_0_awlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWPROT" *) input [2:0]S00_AXI_0_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWQOS" *) input [3:0]S00_AXI_0_awqos;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWREADY" *) output S00_AXI_0_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWSIZE" *) input [2:0]S00_AXI_0_awsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWVALID" *) input S00_AXI_0_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 BREADY" *) input S00_AXI_0_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 BRESP" *) output [1:0]S00_AXI_0_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 BVALID" *) output S00_AXI_0_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 RDATA" *) output [31:0]S00_AXI_0_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 RLAST" *) output S00_AXI_0_rlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 RREADY" *) input S00_AXI_0_rready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 RRESP" *) output [1:0]S00_AXI_0_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 RVALID" *) output S00_AXI_0_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 WDATA" *) input [31:0]S00_AXI_0_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 WLAST" *) input S00_AXI_0_wlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 WREADY" *) output S00_AXI_0_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 WSTRB" *) input [3:0]S00_AXI_0_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI_0 WVALID" *) input S00_AXI_0_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 ARADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME S01_AXI_0, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN axi_crossbar_2x1_aclk_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]S01_AXI_0_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 ARBURST" *) input [1:0]S01_AXI_0_arburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 ARCACHE" *) input [3:0]S01_AXI_0_arcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 ARLEN" *) input [7:0]S01_AXI_0_arlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 ARLOCK" *) input [0:0]S01_AXI_0_arlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 ARPROT" *) input [2:0]S01_AXI_0_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 ARQOS" *) input [3:0]S01_AXI_0_arqos;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 ARREADY" *) output S01_AXI_0_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 ARSIZE" *) input [2:0]S01_AXI_0_arsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 ARVALID" *) input S01_AXI_0_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 AWADDR" *) input [31:0]S01_AXI_0_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 AWBURST" *) input [1:0]S01_AXI_0_awburst;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 AWCACHE" *) input [3:0]S01_AXI_0_awcache;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 AWLEN" *) input [7:0]S01_AXI_0_awlen;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 AWLOCK" *) input [0:0]S01_AXI_0_awlock;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 AWPROT" *) input [2:0]S01_AXI_0_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 AWQOS" *) input [3:0]S01_AXI_0_awqos;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 AWREADY" *) output S01_AXI_0_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 AWSIZE" *) input [2:0]S01_AXI_0_awsize;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 AWVALID" *) input S01_AXI_0_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 BREADY" *) input S01_AXI_0_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 BRESP" *) output [1:0]S01_AXI_0_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 BVALID" *) output S01_AXI_0_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 RDATA" *) output [31:0]S01_AXI_0_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 RLAST" *) output S01_AXI_0_rlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 RREADY" *) input S01_AXI_0_rready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 RRESP" *) output [1:0]S01_AXI_0_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 RVALID" *) output S01_AXI_0_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 WDATA" *) input [31:0]S01_AXI_0_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 WLAST" *) input S01_AXI_0_wlast;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 WREADY" *) output S01_AXI_0_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 WSTRB" *) input [3:0]S01_AXI_0_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S01_AXI_0 WVALID" *) input S01_AXI_0_wvalid;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK.ACLK_0 CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK.ACLK_0, ASSOCIATED_BUSIF M00_AXI_0:S00_AXI_0:S01_AXI_0, CLK_DOMAIN axi_crossbar_2x1_aclk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input aclk_0;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RST.ARESETN_0 RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RST.ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input aresetn_0;

  wire [31:0]S00_AXI_0_1_ARADDR;
  wire [1:0]S00_AXI_0_1_ARBURST;
  wire [3:0]S00_AXI_0_1_ARCACHE;
  wire [7:0]S00_AXI_0_1_ARLEN;
  wire [0:0]S00_AXI_0_1_ARLOCK;
  wire [2:0]S00_AXI_0_1_ARPROT;
  wire [3:0]S00_AXI_0_1_ARQOS;
  wire S00_AXI_0_1_ARREADY;
  wire [2:0]S00_AXI_0_1_ARSIZE;
  wire S00_AXI_0_1_ARVALID;
  wire [31:0]S00_AXI_0_1_AWADDR;
  wire [1:0]S00_AXI_0_1_AWBURST;
  wire [3:0]S00_AXI_0_1_AWCACHE;
  wire [7:0]S00_AXI_0_1_AWLEN;
  wire [0:0]S00_AXI_0_1_AWLOCK;
  wire [2:0]S00_AXI_0_1_AWPROT;
  wire [3:0]S00_AXI_0_1_AWQOS;
  wire S00_AXI_0_1_AWREADY;
  wire [2:0]S00_AXI_0_1_AWSIZE;
  wire S00_AXI_0_1_AWVALID;
  wire S00_AXI_0_1_BREADY;
  wire [1:0]S00_AXI_0_1_BRESP;
  wire S00_AXI_0_1_BVALID;
  wire [31:0]S00_AXI_0_1_RDATA;
  wire S00_AXI_0_1_RLAST;
  wire S00_AXI_0_1_RREADY;
  wire [1:0]S00_AXI_0_1_RRESP;
  wire S00_AXI_0_1_RVALID;
  wire [31:0]S00_AXI_0_1_WDATA;
  wire S00_AXI_0_1_WLAST;
  wire S00_AXI_0_1_WREADY;
  wire [3:0]S00_AXI_0_1_WSTRB;
  wire S00_AXI_0_1_WVALID;
  wire [31:0]S01_AXI_0_1_ARADDR;
  wire [1:0]S01_AXI_0_1_ARBURST;
  wire [3:0]S01_AXI_0_1_ARCACHE;
  wire [7:0]S01_AXI_0_1_ARLEN;
  wire [0:0]S01_AXI_0_1_ARLOCK;
  wire [2:0]S01_AXI_0_1_ARPROT;
  wire [3:0]S01_AXI_0_1_ARQOS;
  wire S01_AXI_0_1_ARREADY;
  wire [2:0]S01_AXI_0_1_ARSIZE;
  wire S01_AXI_0_1_ARVALID;
  wire [31:0]S01_AXI_0_1_AWADDR;
  wire [1:0]S01_AXI_0_1_AWBURST;
  wire [3:0]S01_AXI_0_1_AWCACHE;
  wire [7:0]S01_AXI_0_1_AWLEN;
  wire [0:0]S01_AXI_0_1_AWLOCK;
  wire [2:0]S01_AXI_0_1_AWPROT;
  wire [3:0]S01_AXI_0_1_AWQOS;
  wire S01_AXI_0_1_AWREADY;
  wire [2:0]S01_AXI_0_1_AWSIZE;
  wire S01_AXI_0_1_AWVALID;
  wire S01_AXI_0_1_BREADY;
  wire [1:0]S01_AXI_0_1_BRESP;
  wire S01_AXI_0_1_BVALID;
  wire [31:0]S01_AXI_0_1_RDATA;
  wire S01_AXI_0_1_RLAST;
  wire S01_AXI_0_1_RREADY;
  wire [1:0]S01_AXI_0_1_RRESP;
  wire S01_AXI_0_1_RVALID;
  wire [31:0]S01_AXI_0_1_WDATA;
  wire S01_AXI_0_1_WLAST;
  wire S01_AXI_0_1_WREADY;
  wire [3:0]S01_AXI_0_1_WSTRB;
  wire S01_AXI_0_1_WVALID;
  wire aclk_0_1;
  wire aresetn_0_1;
  wire [31:0]smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire [3:0]smartconnect_0_M00_AXI_ARCACHE;
  wire [7:0]smartconnect_0_M00_AXI_ARLEN;
  wire [0:0]smartconnect_0_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M00_AXI_ARPROT;
  wire [3:0]smartconnect_0_M00_AXI_ARQOS;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [31:0]smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire [3:0]smartconnect_0_M00_AXI_AWCACHE;
  wire [7:0]smartconnect_0_M00_AXI_AWLEN;
  wire [0:0]smartconnect_0_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M00_AXI_AWPROT;
  wire [3:0]smartconnect_0_M00_AXI_AWQOS;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [31:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RLAST;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [31:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [3:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;

  assign M00_AXI_0_araddr[31:0] = smartconnect_0_M00_AXI_ARADDR;
  assign M00_AXI_0_arburst[1:0] = smartconnect_0_M00_AXI_ARBURST;
  assign M00_AXI_0_arcache[3:0] = smartconnect_0_M00_AXI_ARCACHE;
  assign M00_AXI_0_arlen[7:0] = smartconnect_0_M00_AXI_ARLEN;
  assign M00_AXI_0_arlock[0] = smartconnect_0_M00_AXI_ARLOCK;
  assign M00_AXI_0_arprot[2:0] = smartconnect_0_M00_AXI_ARPROT;
  assign M00_AXI_0_arqos[3:0] = smartconnect_0_M00_AXI_ARQOS;
  assign M00_AXI_0_arsize[2:0] = smartconnect_0_M00_AXI_ARSIZE;
  assign M00_AXI_0_arvalid = smartconnect_0_M00_AXI_ARVALID;
  assign M00_AXI_0_awaddr[31:0] = smartconnect_0_M00_AXI_AWADDR;
  assign M00_AXI_0_awburst[1:0] = smartconnect_0_M00_AXI_AWBURST;
  assign M00_AXI_0_awcache[3:0] = smartconnect_0_M00_AXI_AWCACHE;
  assign M00_AXI_0_awlen[7:0] = smartconnect_0_M00_AXI_AWLEN;
  assign M00_AXI_0_awlock[0] = smartconnect_0_M00_AXI_AWLOCK;
  assign M00_AXI_0_awprot[2:0] = smartconnect_0_M00_AXI_AWPROT;
  assign M00_AXI_0_awqos[3:0] = smartconnect_0_M00_AXI_AWQOS;
  assign M00_AXI_0_awsize[2:0] = smartconnect_0_M00_AXI_AWSIZE;
  assign M00_AXI_0_awvalid = smartconnect_0_M00_AXI_AWVALID;
  assign M00_AXI_0_bready = smartconnect_0_M00_AXI_BREADY;
  assign M00_AXI_0_rready = smartconnect_0_M00_AXI_RREADY;
  assign M00_AXI_0_wdata[31:0] = smartconnect_0_M00_AXI_WDATA;
  assign M00_AXI_0_wlast = smartconnect_0_M00_AXI_WLAST;
  assign M00_AXI_0_wstrb[3:0] = smartconnect_0_M00_AXI_WSTRB;
  assign M00_AXI_0_wvalid = smartconnect_0_M00_AXI_WVALID;
  assign S00_AXI_0_1_ARADDR = S00_AXI_0_araddr[31:0];
  assign S00_AXI_0_1_ARBURST = S00_AXI_0_arburst[1:0];
  assign S00_AXI_0_1_ARCACHE = S00_AXI_0_arcache[3:0];
  assign S00_AXI_0_1_ARLEN = S00_AXI_0_arlen[7:0];
  assign S00_AXI_0_1_ARLOCK = S00_AXI_0_arlock[0];
  assign S00_AXI_0_1_ARPROT = S00_AXI_0_arprot[2:0];
  assign S00_AXI_0_1_ARQOS = S00_AXI_0_arqos[3:0];
  assign S00_AXI_0_1_ARSIZE = S00_AXI_0_arsize[2:0];
  assign S00_AXI_0_1_ARVALID = S00_AXI_0_arvalid;
  assign S00_AXI_0_1_AWADDR = S00_AXI_0_awaddr[31:0];
  assign S00_AXI_0_1_AWBURST = S00_AXI_0_awburst[1:0];
  assign S00_AXI_0_1_AWCACHE = S00_AXI_0_awcache[3:0];
  assign S00_AXI_0_1_AWLEN = S00_AXI_0_awlen[7:0];
  assign S00_AXI_0_1_AWLOCK = S00_AXI_0_awlock[0];
  assign S00_AXI_0_1_AWPROT = S00_AXI_0_awprot[2:0];
  assign S00_AXI_0_1_AWQOS = S00_AXI_0_awqos[3:0];
  assign S00_AXI_0_1_AWSIZE = S00_AXI_0_awsize[2:0];
  assign S00_AXI_0_1_AWVALID = S00_AXI_0_awvalid;
  assign S00_AXI_0_1_BREADY = S00_AXI_0_bready;
  assign S00_AXI_0_1_RREADY = S00_AXI_0_rready;
  assign S00_AXI_0_1_WDATA = S00_AXI_0_wdata[31:0];
  assign S00_AXI_0_1_WLAST = S00_AXI_0_wlast;
  assign S00_AXI_0_1_WSTRB = S00_AXI_0_wstrb[3:0];
  assign S00_AXI_0_1_WVALID = S00_AXI_0_wvalid;
  assign S00_AXI_0_arready = S00_AXI_0_1_ARREADY;
  assign S00_AXI_0_awready = S00_AXI_0_1_AWREADY;
  assign S00_AXI_0_bresp[1:0] = S00_AXI_0_1_BRESP;
  assign S00_AXI_0_bvalid = S00_AXI_0_1_BVALID;
  assign S00_AXI_0_rdata[31:0] = S00_AXI_0_1_RDATA;
  assign S00_AXI_0_rlast = S00_AXI_0_1_RLAST;
  assign S00_AXI_0_rresp[1:0] = S00_AXI_0_1_RRESP;
  assign S00_AXI_0_rvalid = S00_AXI_0_1_RVALID;
  assign S00_AXI_0_wready = S00_AXI_0_1_WREADY;
  assign S01_AXI_0_1_ARADDR = S01_AXI_0_araddr[31:0];
  assign S01_AXI_0_1_ARBURST = S01_AXI_0_arburst[1:0];
  assign S01_AXI_0_1_ARCACHE = S01_AXI_0_arcache[3:0];
  assign S01_AXI_0_1_ARLEN = S01_AXI_0_arlen[7:0];
  assign S01_AXI_0_1_ARLOCK = S01_AXI_0_arlock[0];
  assign S01_AXI_0_1_ARPROT = S01_AXI_0_arprot[2:0];
  assign S01_AXI_0_1_ARQOS = S01_AXI_0_arqos[3:0];
  assign S01_AXI_0_1_ARSIZE = S01_AXI_0_arsize[2:0];
  assign S01_AXI_0_1_ARVALID = S01_AXI_0_arvalid;
  assign S01_AXI_0_1_AWADDR = S01_AXI_0_awaddr[31:0];
  assign S01_AXI_0_1_AWBURST = S01_AXI_0_awburst[1:0];
  assign S01_AXI_0_1_AWCACHE = S01_AXI_0_awcache[3:0];
  assign S01_AXI_0_1_AWLEN = S01_AXI_0_awlen[7:0];
  assign S01_AXI_0_1_AWLOCK = S01_AXI_0_awlock[0];
  assign S01_AXI_0_1_AWPROT = S01_AXI_0_awprot[2:0];
  assign S01_AXI_0_1_AWQOS = S01_AXI_0_awqos[3:0];
  assign S01_AXI_0_1_AWSIZE = S01_AXI_0_awsize[2:0];
  assign S01_AXI_0_1_AWVALID = S01_AXI_0_awvalid;
  assign S01_AXI_0_1_BREADY = S01_AXI_0_bready;
  assign S01_AXI_0_1_RREADY = S01_AXI_0_rready;
  assign S01_AXI_0_1_WDATA = S01_AXI_0_wdata[31:0];
  assign S01_AXI_0_1_WLAST = S01_AXI_0_wlast;
  assign S01_AXI_0_1_WSTRB = S01_AXI_0_wstrb[3:0];
  assign S01_AXI_0_1_WVALID = S01_AXI_0_wvalid;
  assign S01_AXI_0_arready = S01_AXI_0_1_ARREADY;
  assign S01_AXI_0_awready = S01_AXI_0_1_AWREADY;
  assign S01_AXI_0_bresp[1:0] = S01_AXI_0_1_BRESP;
  assign S01_AXI_0_bvalid = S01_AXI_0_1_BVALID;
  assign S01_AXI_0_rdata[31:0] = S01_AXI_0_1_RDATA;
  assign S01_AXI_0_rlast = S01_AXI_0_1_RLAST;
  assign S01_AXI_0_rresp[1:0] = S01_AXI_0_1_RRESP;
  assign S01_AXI_0_rvalid = S01_AXI_0_1_RVALID;
  assign S01_AXI_0_wready = S01_AXI_0_1_WREADY;
  assign aclk_0_1 = aclk_0;
  assign aresetn_0_1 = aresetn_0;
  assign smartconnect_0_M00_AXI_ARREADY = M00_AXI_0_arready;
  assign smartconnect_0_M00_AXI_AWREADY = M00_AXI_0_awready;
  assign smartconnect_0_M00_AXI_BRESP = M00_AXI_0_bresp[1:0];
  assign smartconnect_0_M00_AXI_BVALID = M00_AXI_0_bvalid;
  assign smartconnect_0_M00_AXI_RDATA = M00_AXI_0_rdata[31:0];
  assign smartconnect_0_M00_AXI_RLAST = M00_AXI_0_rlast;
  assign smartconnect_0_M00_AXI_RRESP = M00_AXI_0_rresp[1:0];
  assign smartconnect_0_M00_AXI_RVALID = M00_AXI_0_rvalid;
  assign smartconnect_0_M00_AXI_WREADY = M00_AXI_0_wready;
  axi_crossbar_2x1_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arqos(smartconnect_0_M00_AXI_ARQOS),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awqos(smartconnect_0_M00_AXI_AWQOS),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .S00_AXI_araddr(S00_AXI_0_1_ARADDR),
        .S00_AXI_arburst(S00_AXI_0_1_ARBURST),
        .S00_AXI_arcache(S00_AXI_0_1_ARCACHE),
        .S00_AXI_arlen(S00_AXI_0_1_ARLEN),
        .S00_AXI_arlock(S00_AXI_0_1_ARLOCK),
        .S00_AXI_arprot(S00_AXI_0_1_ARPROT),
        .S00_AXI_arqos(S00_AXI_0_1_ARQOS),
        .S00_AXI_arready(S00_AXI_0_1_ARREADY),
        .S00_AXI_arsize(S00_AXI_0_1_ARSIZE),
        .S00_AXI_arvalid(S00_AXI_0_1_ARVALID),
        .S00_AXI_awaddr(S00_AXI_0_1_AWADDR),
        .S00_AXI_awburst(S00_AXI_0_1_AWBURST),
        .S00_AXI_awcache(S00_AXI_0_1_AWCACHE),
        .S00_AXI_awlen(S00_AXI_0_1_AWLEN),
        .S00_AXI_awlock(S00_AXI_0_1_AWLOCK),
        .S00_AXI_awprot(S00_AXI_0_1_AWPROT),
        .S00_AXI_awqos(S00_AXI_0_1_AWQOS),
        .S00_AXI_awready(S00_AXI_0_1_AWREADY),
        .S00_AXI_awsize(S00_AXI_0_1_AWSIZE),
        .S00_AXI_awvalid(S00_AXI_0_1_AWVALID),
        .S00_AXI_bready(S00_AXI_0_1_BREADY),
        .S00_AXI_bresp(S00_AXI_0_1_BRESP),
        .S00_AXI_bvalid(S00_AXI_0_1_BVALID),
        .S00_AXI_rdata(S00_AXI_0_1_RDATA),
        .S00_AXI_rlast(S00_AXI_0_1_RLAST),
        .S00_AXI_rready(S00_AXI_0_1_RREADY),
        .S00_AXI_rresp(S00_AXI_0_1_RRESP),
        .S00_AXI_rvalid(S00_AXI_0_1_RVALID),
        .S00_AXI_wdata(S00_AXI_0_1_WDATA),
        .S00_AXI_wlast(S00_AXI_0_1_WLAST),
        .S00_AXI_wready(S00_AXI_0_1_WREADY),
        .S00_AXI_wstrb(S00_AXI_0_1_WSTRB),
        .S00_AXI_wvalid(S00_AXI_0_1_WVALID),
        .S01_AXI_araddr(S01_AXI_0_1_ARADDR),
        .S01_AXI_arburst(S01_AXI_0_1_ARBURST),
        .S01_AXI_arcache(S01_AXI_0_1_ARCACHE),
        .S01_AXI_arlen(S01_AXI_0_1_ARLEN),
        .S01_AXI_arlock(S01_AXI_0_1_ARLOCK),
        .S01_AXI_arprot(S01_AXI_0_1_ARPROT),
        .S01_AXI_arqos(S01_AXI_0_1_ARQOS),
        .S01_AXI_arready(S01_AXI_0_1_ARREADY),
        .S01_AXI_arsize(S01_AXI_0_1_ARSIZE),
        .S01_AXI_arvalid(S01_AXI_0_1_ARVALID),
        .S01_AXI_awaddr(S01_AXI_0_1_AWADDR),
        .S01_AXI_awburst(S01_AXI_0_1_AWBURST),
        .S01_AXI_awcache(S01_AXI_0_1_AWCACHE),
        .S01_AXI_awlen(S01_AXI_0_1_AWLEN),
        .S01_AXI_awlock(S01_AXI_0_1_AWLOCK),
        .S01_AXI_awprot(S01_AXI_0_1_AWPROT),
        .S01_AXI_awqos(S01_AXI_0_1_AWQOS),
        .S01_AXI_awready(S01_AXI_0_1_AWREADY),
        .S01_AXI_awsize(S01_AXI_0_1_AWSIZE),
        .S01_AXI_awvalid(S01_AXI_0_1_AWVALID),
        .S01_AXI_bready(S01_AXI_0_1_BREADY),
        .S01_AXI_bresp(S01_AXI_0_1_BRESP),
        .S01_AXI_bvalid(S01_AXI_0_1_BVALID),
        .S01_AXI_rdata(S01_AXI_0_1_RDATA),
        .S01_AXI_rlast(S01_AXI_0_1_RLAST),
        .S01_AXI_rready(S01_AXI_0_1_RREADY),
        .S01_AXI_rresp(S01_AXI_0_1_RRESP),
        .S01_AXI_rvalid(S01_AXI_0_1_RVALID),
        .S01_AXI_wdata(S01_AXI_0_1_WDATA),
        .S01_AXI_wlast(S01_AXI_0_1_WLAST),
        .S01_AXI_wready(S01_AXI_0_1_WREADY),
        .S01_AXI_wstrb(S01_AXI_0_1_WSTRB),
        .S01_AXI_wvalid(S01_AXI_0_1_WVALID),
        .aclk(aclk_0_1),
        .aresetn(aresetn_0_1));
endmodule
