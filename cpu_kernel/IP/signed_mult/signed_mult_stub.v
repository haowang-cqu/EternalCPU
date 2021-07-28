// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Sun Jul 18 23:07:49 2021
// Host        : NSCSCC-Server running 64-bit Debian GNU/Linux 11 (bullseye)
// Command     : write_verilog -force -mode synth_stub
//               /home/fanqin/Desktop/nscscc2021_group_v0.01/func_test_v0.01/soc_axi_func/run_vivado/mycpu_prj1/mycpu.srcs/sources_1/ip/signed_mult/signed_mult_stub.v
// Design      : signed_mult
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *)
module signed_mult(CLK, CE, SCLR, A, B, C, SUBTRACT, P, PCOUT)
/* synthesis syn_black_box black_box_pad_pin="CLK,CE,SCLR,A[31:0],B[31:0],C[31:0],SUBTRACT,P[63:0],PCOUT[47:0]" */;
  input CLK;
  input CE;
  input SCLR;
  input [31:0]A;
  input [31:0]B;
  input [31:0]C;
  input SUBTRACT;
  output [63:0]P;
  output [47:0]PCOUT;
endmodule
