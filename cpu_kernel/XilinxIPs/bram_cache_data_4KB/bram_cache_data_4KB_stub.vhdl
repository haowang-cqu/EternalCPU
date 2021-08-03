-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Tue Aug  3 13:13:03 2021
-- Host        : NSCSCC-Server running 64-bit Debian GNU/Linux 11 (bullseye)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/andy/workspaces/Xilinx/nscscc2021_group_v0.01/perf_test_v0.01/soc_axi_perf/run_vivado/mycpu_prj1/mycpu.srcs/sources_1/ip/bram_cache_data_4KB/bram_cache_data_4KB_stub.vhdl
-- Design      : bram_cache_data_4KB
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bram_cache_data_4KB is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end bram_cache_data_4KB;

architecture stub of bram_cache_data_4KB is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,wea[3:0],addra[9:0],dina[31:0],douta[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_4,Vivado 2019.2";
begin
end;
