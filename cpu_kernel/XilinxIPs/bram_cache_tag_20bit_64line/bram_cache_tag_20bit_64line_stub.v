// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Tue Aug  3 14:49:15 2021
// Host        : NSCSCC-Server running 64-bit Debian GNU/Linux 11 (bullseye)
// Command     : write_verilog -force -mode synth_stub
//               /home/andy/workspaces/Xilinx/nscscc2021_group_v0.01/perf_test_v0.01/soc_axi_perf/run_vivado/mycpu_prj1/mycpu.srcs/sources_1/ip/bram_cache_tag_20bit_64line/bram_cache_tag_20bit_64line_stub.v
// Design      : bram_cache_tag_20bit_64line
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module bram_cache_tag_20bit_64line(clka, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[5:0],dina[19:0],douta[19:0]" */;
  input clka;
  input [0:0]wea;
  input [5:0]addra;
  input [19:0]dina;
  output [19:0]douta;
endmodule
