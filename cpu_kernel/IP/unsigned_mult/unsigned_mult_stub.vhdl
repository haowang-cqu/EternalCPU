-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Sun Jul 18 23:08:06 2021
-- Host        : NSCSCC-Server running 64-bit Debian GNU/Linux 11 (bullseye)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/fanqin/Desktop/nscscc2021_group_v0.01/func_test_v0.01/soc_axi_func/run_vivado/mycpu_prj1/mycpu.srcs/sources_1/ip/unsigned_mult/unsigned_mult_stub.vhdl
-- Design      : unsigned_mult
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unsigned_mult is
  Port ( 
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SUBTRACT : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 63 downto 0 );
    PCOUT : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );

end unsigned_mult;

architecture stub of unsigned_mult is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,CE,SCLR,A[31:0],B[31:0],C[31:0],SUBTRACT,P[63:0],PCOUT[47:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "xbip_multadd_v3_0_15,Vivado 2019.2";
begin
end;
