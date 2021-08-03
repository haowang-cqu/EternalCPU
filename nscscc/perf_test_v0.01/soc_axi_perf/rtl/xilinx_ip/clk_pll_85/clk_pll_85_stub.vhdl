-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Tue Aug  3 21:21:17 2021
-- Host        : cyy-pc running 64-bit Debian GNU/Linux 11 (bullseye)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/cyy/EternalCPU/nscscc/perf_test_v0.01/soc_axi_perf/rtl/xilinx_ip/clk_pll_85/clk_pll_85_stub.vhdl
-- Design      : clk_pll_85
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_pll_85 is
  Port ( 
    cpu_clk : out STD_LOGIC;
    sys_clk : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_pll_85;

architecture stub of clk_pll_85 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "cpu_clk,sys_clk,clk_in1";
begin
end;
