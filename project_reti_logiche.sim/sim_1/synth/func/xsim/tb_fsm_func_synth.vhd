-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Wed Mar  1 07:19:17 2023
-- Host        : DESKTOP-D997S7A running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/crmgr/Desktop/project_reti_logiche/project_reti_logiche.sim/sim_1/synth/func/xsim/tb_fsm_func_synth.vhd
-- Design      : project_reti_logiche
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k70tfbv676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity project_reti_logiche is
  port (
    i_clk : in STD_LOGIC;
    i_rst : in STD_LOGIC;
    i_start : in STD_LOGIC;
    i_w : in STD_LOGIC;
    o_z0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_done : out STD_LOGIC;
    o_mem_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    i_mem_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    o_mem_we : out STD_LOGIC;
    o_mem_en : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of project_reti_logiche : entity is true;
end project_reti_logiche;

architecture STRUCTURE of project_reti_logiche is
begin
o_done_OBUF_inst: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_done,
      T => '1'
    );
\o_mem_addr_OBUF[0]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(0),
      T => '1'
    );
\o_mem_addr_OBUF[10]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(10),
      T => '1'
    );
\o_mem_addr_OBUF[11]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(11),
      T => '1'
    );
\o_mem_addr_OBUF[12]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(12),
      T => '1'
    );
\o_mem_addr_OBUF[13]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(13),
      T => '1'
    );
\o_mem_addr_OBUF[14]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(14),
      T => '1'
    );
\o_mem_addr_OBUF[15]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(15),
      T => '1'
    );
\o_mem_addr_OBUF[1]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(1),
      T => '1'
    );
\o_mem_addr_OBUF[2]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(2),
      T => '1'
    );
\o_mem_addr_OBUF[3]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(3),
      T => '1'
    );
\o_mem_addr_OBUF[4]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(4),
      T => '1'
    );
\o_mem_addr_OBUF[5]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(5),
      T => '1'
    );
\o_mem_addr_OBUF[6]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(6),
      T => '1'
    );
\o_mem_addr_OBUF[7]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(7),
      T => '1'
    );
\o_mem_addr_OBUF[8]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(8),
      T => '1'
    );
\o_mem_addr_OBUF[9]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_addr(9),
      T => '1'
    );
o_mem_en_OBUF_inst: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_en,
      T => '1'
    );
o_mem_we_OBUF_inst: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_mem_we,
      T => '1'
    );
\o_z0_OBUF[0]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z0(0),
      T => '1'
    );
\o_z0_OBUF[1]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z0(1),
      T => '1'
    );
\o_z0_OBUF[2]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z0(2),
      T => '1'
    );
\o_z0_OBUF[3]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z0(3),
      T => '1'
    );
\o_z0_OBUF[4]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z0(4),
      T => '1'
    );
\o_z0_OBUF[5]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z0(5),
      T => '1'
    );
\o_z0_OBUF[6]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z0(6),
      T => '1'
    );
\o_z0_OBUF[7]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z0(7),
      T => '1'
    );
\o_z1_OBUF[0]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z1(0),
      T => '1'
    );
\o_z1_OBUF[1]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z1(1),
      T => '1'
    );
\o_z1_OBUF[2]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z1(2),
      T => '1'
    );
\o_z1_OBUF[3]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z1(3),
      T => '1'
    );
\o_z1_OBUF[4]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z1(4),
      T => '1'
    );
\o_z1_OBUF[5]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z1(5),
      T => '1'
    );
\o_z1_OBUF[6]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z1(6),
      T => '1'
    );
\o_z1_OBUF[7]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z1(7),
      T => '1'
    );
\o_z2_OBUF[0]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z2(0),
      T => '1'
    );
\o_z2_OBUF[1]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z2(1),
      T => '1'
    );
\o_z2_OBUF[2]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z2(2),
      T => '1'
    );
\o_z2_OBUF[3]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z2(3),
      T => '1'
    );
\o_z2_OBUF[4]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z2(4),
      T => '1'
    );
\o_z2_OBUF[5]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z2(5),
      T => '1'
    );
\o_z2_OBUF[6]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z2(6),
      T => '1'
    );
\o_z2_OBUF[7]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z2(7),
      T => '1'
    );
\o_z3_OBUF[0]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z3(0),
      T => '1'
    );
\o_z3_OBUF[1]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z3(1),
      T => '1'
    );
\o_z3_OBUF[2]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z3(2),
      T => '1'
    );
\o_z3_OBUF[3]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z3(3),
      T => '1'
    );
\o_z3_OBUF[4]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z3(4),
      T => '1'
    );
\o_z3_OBUF[5]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z3(5),
      T => '1'
    );
\o_z3_OBUF[6]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z3(6),
      T => '1'
    );
\o_z3_OBUF[7]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => o_z3(7),
      T => '1'
    );
end STRUCTURE;
