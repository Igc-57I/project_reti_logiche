-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Fri Mar  3 21:00:29 2023
-- Host        : JackB_Laptop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/jackb/Documents/GitHub/project_reti_logiche/project_reti_logiche.sim/sim_edo/synth/func/xsim/cleverRst_tb_func_synth.vhd
-- Design      : project_reti_logiche
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k70tfbv676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FSM is
  port (
    i_rst : out STD_LOGIC;
    io_reg_rst_OBUF : out STD_LOGIC;
    io_reg_out_sync_OBUF : out STD_LOGIC;
    o_z0_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    io_my_done_OBUF : out STD_LOGIC;
    o_z1_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z2_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_z3_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \delta_function.REGA_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    io_mux_out_sync_OBUF : out STD_LOGIC;
    \delta_function.REGA_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \delta_function.REGA_reg[0]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \delta_function.REGA_reg[0]_2\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    o_mem_en_OBUF : out STD_LOGIC;
    \FSM_sequential_curr_state_reg[2]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    i_start_IBUF : in STD_LOGIC;
    i_rst_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \o_z1[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \o_z2[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \o_z3[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end FSM;

architecture STRUCTURE of FSM is
  signal \curr_state__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \curr_state__0__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal curr_state_n_0 : STD_LOGIC;
  signal \delta_function.REGA[0]_i_1_n_0\ : STD_LOGIC;
  signal \delta_function.REGA[1]_i_1_n_0\ : STD_LOGIC;
  signal \^delta_function.rega_reg[1]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^io_mux_out_sync_obuf\ : STD_LOGIC;
  signal \^io_my_done_obuf\ : STD_LOGIC;
  signal \^io_reg_out_sync_obuf\ : STD_LOGIC;
  signal \^io_reg_rst_obuf\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_curr_state[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_sequential_curr_state[2]_i_1\ : label is "soft_lutpair3";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_curr_state_reg[0]\ : label is "s0:000,s1:001,s2:010,s3:011,s4:100,s5:101,s6:110,s7:111";
  attribute FSM_ENCODED_STATES of \FSM_sequential_curr_state_reg[1]\ : label is "s0:000,s1:001,s2:010,s3:011,s4:100,s5:101,s6:110,s7:111";
  attribute FSM_ENCODED_STATES of \FSM_sequential_curr_state_reg[2]\ : label is "s0:000,s1:001,s2:010,s3:011,s4:100,s5:101,s6:110,s7:111";
  attribute SOFT_HLUTNM of MEM_EN : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \REG0[7]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \REG1[7]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \REG2[7]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \REG3[7]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of io_mux_out_sync_OBUF_inst_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of io_reg_out_sync_OBUF_inst_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of io_reg_rst_OBUF_inst_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \o_z0_OBUF[0]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \o_z0_OBUF[1]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \o_z0_OBUF[2]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \o_z0_OBUF[3]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \o_z0_OBUF[4]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \o_z0_OBUF[5]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \o_z0_OBUF[6]_inst_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \o_z0_OBUF[7]_inst_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \o_z1_OBUF[0]_inst_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \o_z1_OBUF[1]_inst_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \o_z1_OBUF[2]_inst_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \o_z1_OBUF[3]_inst_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \o_z1_OBUF[4]_inst_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \o_z1_OBUF[5]_inst_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \o_z1_OBUF[6]_inst_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \o_z1_OBUF[7]_inst_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \o_z2_OBUF[0]_inst_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \o_z2_OBUF[1]_inst_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \o_z2_OBUF[2]_inst_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \o_z2_OBUF[3]_inst_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \o_z2_OBUF[4]_inst_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \o_z2_OBUF[5]_inst_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \o_z2_OBUF[6]_inst_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \o_z2_OBUF[7]_inst_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \o_z3_OBUF[0]_inst_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \o_z3_OBUF[1]_inst_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \o_z3_OBUF[2]_inst_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \o_z3_OBUF[3]_inst_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \o_z3_OBUF[4]_inst_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \o_z3_OBUF[5]_inst_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \o_z3_OBUF[6]_inst_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \o_z3_OBUF[7]_inst_i_1\ : label is "soft_lutpair20";
begin
  \delta_function.REGA_reg[1]_0\(1 downto 0) <= \^delta_function.rega_reg[1]_0\(1 downto 0);
  io_mux_out_sync_OBUF <= \^io_mux_out_sync_obuf\;
  io_my_done_OBUF <= \^io_my_done_obuf\;
  io_reg_out_sync_OBUF <= \^io_reg_out_sync_obuf\;
  io_reg_rst_OBUF <= \^io_reg_rst_obuf\;
\FSM_sequential_curr_state[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \curr_state__0\(0),
      O => \curr_state__0__0\(0)
    );
\FSM_sequential_curr_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \curr_state__0\(0),
      I1 => \curr_state__0\(1),
      O => \curr_state__0__0\(1)
    );
\FSM_sequential_curr_state[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \curr_state__0\(1),
      I1 => \curr_state__0\(0),
      I2 => \curr_state__0\(2),
      O => \curr_state__0__0\(2)
    );
\FSM_sequential_curr_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_n_0,
      CLR => i_rst_IBUF,
      D => \curr_state__0__0\(0),
      Q => \curr_state__0\(0)
    );
\FSM_sequential_curr_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_n_0,
      CLR => i_rst_IBUF,
      D => \curr_state__0__0\(1),
      Q => \curr_state__0\(1)
    );
\FSM_sequential_curr_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_n_0,
      CLR => i_rst_IBUF,
      D => \curr_state__0__0\(2),
      Q => \curr_state__0\(2)
    );
MEM_EN: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \curr_state__0\(2),
      I1 => \curr_state__0\(1),
      I2 => \curr_state__0\(0),
      O => o_mem_en_OBUF
    );
\REG0[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \^delta_function.rega_reg[1]_0\(0),
      I1 => \^delta_function.rega_reg[1]_0\(1),
      I2 => \^io_mux_out_sync_obuf\,
      O => E(0)
    );
\REG1[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^delta_function.rega_reg[1]_0\(0),
      I1 => \^delta_function.rega_reg[1]_0\(1),
      I2 => \^io_mux_out_sync_obuf\,
      O => \delta_function.REGA_reg[0]_0\(0)
    );
\REG2[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \^delta_function.rega_reg[1]_0\(0),
      I1 => \^delta_function.rega_reg[1]_0\(1),
      I2 => \^io_mux_out_sync_obuf\,
      O => \delta_function.REGA_reg[0]_2\(0)
    );
\REG3[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^delta_function.rega_reg[1]_0\(0),
      I1 => \^delta_function.rega_reg[1]_0\(1),
      I2 => \^io_mux_out_sync_obuf\,
      O => \delta_function.REGA_reg[0]_1\(0)
    );
\REG[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_reg_out_sync_obuf\,
      I1 => i_start_IBUF,
      O => \FSM_sequential_curr_state_reg[2]_0\(0)
    );
\REG[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => i_rst_IBUF,
      I1 => \^io_reg_rst_obuf\,
      O => i_rst
    );
curr_state: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFFE"
    )
        port map (
      I0 => \curr_state__0\(2),
      I1 => \curr_state__0\(1),
      I2 => i_start_IBUF,
      I3 => \curr_state__0\(0),
      O => curr_state_n_0
    );
\delta_function.REGA[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \curr_state__0\(1),
      I1 => i_start_IBUF,
      I2 => \curr_state__0\(2),
      I3 => \curr_state__0\(0),
      I4 => i_rst_IBUF,
      O => \delta_function.REGA[0]_i_1_n_0\
    );
\delta_function.REGA[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \curr_state__0\(1),
      I1 => \curr_state__0\(2),
      I2 => \curr_state__0\(0),
      I3 => i_rst_IBUF,
      O => \delta_function.REGA[1]_i_1_n_0\
    );
\delta_function.REGA_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \delta_function.REGA[0]_i_1_n_0\,
      D => D(0),
      Q => \^delta_function.rega_reg[1]_0\(0),
      R => '0'
    );
\delta_function.REGA_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \delta_function.REGA[1]_i_1_n_0\,
      D => D(0),
      Q => \^delta_function.rega_reg[1]_0\(1),
      R => '0'
    );
io_mux_out_sync_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \curr_state__0\(1),
      I1 => \curr_state__0\(2),
      O => \^io_mux_out_sync_obuf\
    );
io_reg_out_sync_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => \curr_state__0\(2),
      I1 => \curr_state__0\(1),
      O => \^io_reg_out_sync_obuf\
    );
io_reg_rst_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \curr_state__0\(2),
      I1 => \curr_state__0\(0),
      I2 => \curr_state__0\(1),
      O => \^io_reg_rst_obuf\
    );
o_done_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \curr_state__0\(2),
      I1 => \curr_state__0\(0),
      I2 => \curr_state__0\(1),
      O => \^io_my_done_obuf\
    );
\o_z0_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => Q(0),
      O => o_z0_OBUF(0)
    );
\o_z0_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => Q(1),
      O => o_z0_OBUF(1)
    );
\o_z0_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => Q(2),
      O => o_z0_OBUF(2)
    );
\o_z0_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => Q(3),
      O => o_z0_OBUF(3)
    );
\o_z0_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => Q(4),
      O => o_z0_OBUF(4)
    );
\o_z0_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => Q(5),
      O => o_z0_OBUF(5)
    );
\o_z0_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => Q(6),
      O => o_z0_OBUF(6)
    );
\o_z0_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => Q(7),
      O => o_z0_OBUF(7)
    );
\o_z1_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z1[7]\(0),
      O => o_z1_OBUF(0)
    );
\o_z1_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z1[7]\(1),
      O => o_z1_OBUF(1)
    );
\o_z1_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z1[7]\(2),
      O => o_z1_OBUF(2)
    );
\o_z1_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z1[7]\(3),
      O => o_z1_OBUF(3)
    );
\o_z1_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z1[7]\(4),
      O => o_z1_OBUF(4)
    );
\o_z1_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z1[7]\(5),
      O => o_z1_OBUF(5)
    );
\o_z1_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z1[7]\(6),
      O => o_z1_OBUF(6)
    );
\o_z1_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z1[7]\(7),
      O => o_z1_OBUF(7)
    );
\o_z2_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z2[7]\(0),
      O => o_z2_OBUF(0)
    );
\o_z2_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z2[7]\(1),
      O => o_z2_OBUF(1)
    );
\o_z2_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z2[7]\(2),
      O => o_z2_OBUF(2)
    );
\o_z2_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z2[7]\(3),
      O => o_z2_OBUF(3)
    );
\o_z2_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z2[7]\(4),
      O => o_z2_OBUF(4)
    );
\o_z2_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z2[7]\(5),
      O => o_z2_OBUF(5)
    );
\o_z2_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z2[7]\(6),
      O => o_z2_OBUF(6)
    );
\o_z2_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z2[7]\(7),
      O => o_z2_OBUF(7)
    );
\o_z3_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z3[7]\(0),
      O => o_z3_OBUF(0)
    );
\o_z3_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z3[7]\(1),
      O => o_z3_OBUF(1)
    );
\o_z3_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z3[7]\(2),
      O => o_z3_OBUF(2)
    );
\o_z3_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z3[7]\(3),
      O => o_z3_OBUF(3)
    );
\o_z3_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z3[7]\(4),
      O => o_z3_OBUF(4)
    );
\o_z3_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z3[7]\(5),
      O => o_z3_OBUF(5)
    );
\o_z3_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z3[7]\(6),
      O => o_z3_OBUF(6)
    );
\o_z3_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^io_my_done_obuf\,
      I1 => \o_z3[7]\(7),
      O => o_z3_OBUF(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Reg_In is
  port (
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    \REG_reg[0]_0\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end Reg_In;

architecture STRUCTURE of Reg_In is
  signal \^q\ : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  Q(15 downto 0) <= \^q\(15 downto 0);
\REG_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => D(0),
      Q => \^q\(0)
    );
\REG_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(9),
      Q => \^q\(10)
    );
\REG_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(10),
      Q => \^q\(11)
    );
\REG_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(11),
      Q => \^q\(12)
    );
\REG_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(12),
      Q => \^q\(13)
    );
\REG_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(13),
      Q => \^q\(14)
    );
\REG_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(14),
      Q => \^q\(15)
    );
\REG_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(0),
      Q => \^q\(1)
    );
\REG_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(1),
      Q => \^q\(2)
    );
\REG_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(2),
      Q => \^q\(3)
    );
\REG_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(3),
      Q => \^q\(4)
    );
\REG_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(4),
      Q => \^q\(5)
    );
\REG_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(5),
      Q => \^q\(6)
    );
\REG_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(6),
      Q => \^q\(7)
    );
\REG_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(7),
      Q => \^q\(8)
    );
\REG_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => \REG_reg[0]_0\,
      D => \^q\(8),
      Q => \^q\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity demux is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \REG1_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \REG2_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \REG3_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \REG1_reg[7]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \REG2_reg[7]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \REG3_reg[7]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end demux;

architecture STRUCTURE of demux is
begin
\REG0_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => D(0),
      Q => Q(0)
    );
\REG0_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => D(1),
      Q => Q(1)
    );
\REG0_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => D(2),
      Q => Q(2)
    );
\REG0_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => D(3),
      Q => Q(3)
    );
\REG0_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => D(4),
      Q => Q(4)
    );
\REG0_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => D(5),
      Q => Q(5)
    );
\REG0_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => D(6),
      Q => Q(6)
    );
\REG0_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => D(7),
      Q => Q(7)
    );
\REG1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG1_reg[7]_1\(0),
      CLR => AR(0),
      D => D(0),
      Q => \REG1_reg[7]_0\(0)
    );
\REG1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG1_reg[7]_1\(0),
      CLR => AR(0),
      D => D(1),
      Q => \REG1_reg[7]_0\(1)
    );
\REG1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG1_reg[7]_1\(0),
      CLR => AR(0),
      D => D(2),
      Q => \REG1_reg[7]_0\(2)
    );
\REG1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG1_reg[7]_1\(0),
      CLR => AR(0),
      D => D(3),
      Q => \REG1_reg[7]_0\(3)
    );
\REG1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG1_reg[7]_1\(0),
      CLR => AR(0),
      D => D(4),
      Q => \REG1_reg[7]_0\(4)
    );
\REG1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG1_reg[7]_1\(0),
      CLR => AR(0),
      D => D(5),
      Q => \REG1_reg[7]_0\(5)
    );
\REG1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG1_reg[7]_1\(0),
      CLR => AR(0),
      D => D(6),
      Q => \REG1_reg[7]_0\(6)
    );
\REG1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG1_reg[7]_1\(0),
      CLR => AR(0),
      D => D(7),
      Q => \REG1_reg[7]_0\(7)
    );
\REG2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG2_reg[7]_1\(0),
      CLR => AR(0),
      D => D(0),
      Q => \REG2_reg[7]_0\(0)
    );
\REG2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG2_reg[7]_1\(0),
      CLR => AR(0),
      D => D(1),
      Q => \REG2_reg[7]_0\(1)
    );
\REG2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG2_reg[7]_1\(0),
      CLR => AR(0),
      D => D(2),
      Q => \REG2_reg[7]_0\(2)
    );
\REG2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG2_reg[7]_1\(0),
      CLR => AR(0),
      D => D(3),
      Q => \REG2_reg[7]_0\(3)
    );
\REG2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG2_reg[7]_1\(0),
      CLR => AR(0),
      D => D(4),
      Q => \REG2_reg[7]_0\(4)
    );
\REG2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG2_reg[7]_1\(0),
      CLR => AR(0),
      D => D(5),
      Q => \REG2_reg[7]_0\(5)
    );
\REG2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG2_reg[7]_1\(0),
      CLR => AR(0),
      D => D(6),
      Q => \REG2_reg[7]_0\(6)
    );
\REG2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG2_reg[7]_1\(0),
      CLR => AR(0),
      D => D(7),
      Q => \REG2_reg[7]_0\(7)
    );
\REG3_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG3_reg[7]_1\(0),
      CLR => AR(0),
      D => D(0),
      Q => \REG3_reg[7]_0\(0)
    );
\REG3_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG3_reg[7]_1\(0),
      CLR => AR(0),
      D => D(1),
      Q => \REG3_reg[7]_0\(1)
    );
\REG3_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG3_reg[7]_1\(0),
      CLR => AR(0),
      D => D(2),
      Q => \REG3_reg[7]_0\(2)
    );
\REG3_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG3_reg[7]_1\(0),
      CLR => AR(0),
      D => D(3),
      Q => \REG3_reg[7]_0\(3)
    );
\REG3_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG3_reg[7]_1\(0),
      CLR => AR(0),
      D => D(4),
      Q => \REG3_reg[7]_0\(4)
    );
\REG3_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG3_reg[7]_1\(0),
      CLR => AR(0),
      D => D(5),
      Q => \REG3_reg[7]_0\(5)
    );
\REG3_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG3_reg[7]_1\(0),
      CLR => AR(0),
      D => D(6),
      Q => \REG3_reg[7]_0\(6)
    );
\REG3_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \REG3_reg[7]_1\(0),
      CLR => AR(0),
      D => D(7),
      Q => \REG3_reg[7]_0\(7)
    );
end STRUCTURE;
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
    o_mem_en : out STD_LOGIC;
    io_fsm_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    io_mux_out_sync : inout STD_LOGIC;
    io_reg_out_sync : inout STD_LOGIC;
    io_my_done : inout STD_LOGIC;
    io_reg_rst : inout STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of project_reti_logiche : entity is true;
end project_reti_logiche;

architecture STRUCTURE of project_reti_logiche is
  signal REG0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal REG00 : STD_LOGIC;
  signal REG1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal REG10 : STD_LOGIC;
  signal REG2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal REG20 : STD_LOGIC;
  signal REG3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal REG30 : STD_LOGIC;
  signal fsm_map_n_0 : STD_LOGIC;
  signal fsm_map_n_44 : STD_LOGIC;
  signal i_clk_IBUF : STD_LOGIC;
  signal i_clk_IBUF_BUFG : STD_LOGIC;
  signal i_mem_data_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal i_rst_IBUF : STD_LOGIC;
  signal i_start_IBUF : STD_LOGIC;
  signal i_w_IBUF : STD_LOGIC;
  signal io_fsm_a_IBUF : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal io_mux_out_sync_OBUF : STD_LOGIC;
  signal io_my_done_OBUF : STD_LOGIC;
  signal io_reg_out_sync_OBUF : STD_LOGIC;
  signal io_reg_rst_OBUF : STD_LOGIC;
  signal o_mem_addr_OBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal o_mem_en_OBUF : STD_LOGIC;
  signal o_z0_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_z1_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_z2_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_z3_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
fsm_map: entity work.FSM
     port map (
      CLK => i_clk_IBUF_BUFG,
      D(0) => i_w_IBUF,
      E(0) => REG00,
      \FSM_sequential_curr_state_reg[2]_0\(0) => fsm_map_n_44,
      Q(7 downto 0) => REG0(7 downto 0),
      \delta_function.REGA_reg[0]_0\(0) => REG10,
      \delta_function.REGA_reg[0]_1\(0) => REG30,
      \delta_function.REGA_reg[0]_2\(0) => REG20,
      \delta_function.REGA_reg[1]_0\(1 downto 0) => io_fsm_a_IBUF(1 downto 0),
      i_rst => fsm_map_n_0,
      i_rst_IBUF => i_rst_IBUF,
      i_start_IBUF => i_start_IBUF,
      io_mux_out_sync_OBUF => io_mux_out_sync_OBUF,
      io_my_done_OBUF => io_my_done_OBUF,
      io_reg_out_sync_OBUF => io_reg_out_sync_OBUF,
      io_reg_rst_OBUF => io_reg_rst_OBUF,
      o_mem_en_OBUF => o_mem_en_OBUF,
      o_z0_OBUF(7 downto 0) => o_z0_OBUF(7 downto 0),
      \o_z1[7]\(7 downto 0) => REG1(7 downto 0),
      o_z1_OBUF(7 downto 0) => o_z1_OBUF(7 downto 0),
      \o_z2[7]\(7 downto 0) => REG2(7 downto 0),
      o_z2_OBUF(7 downto 0) => o_z2_OBUF(7 downto 0),
      \o_z3[7]\(7 downto 0) => REG3(7 downto 0),
      o_z3_OBUF(7 downto 0) => o_z3_OBUF(7 downto 0)
    );
i_clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_clk_IBUF,
      O => i_clk_IBUF_BUFG
    );
i_clk_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_clk,
      O => i_clk_IBUF
    );
\i_mem_data_IBUF[0]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(0),
      O => i_mem_data_IBUF(0)
    );
\i_mem_data_IBUF[1]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(1),
      O => i_mem_data_IBUF(1)
    );
\i_mem_data_IBUF[2]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(2),
      O => i_mem_data_IBUF(2)
    );
\i_mem_data_IBUF[3]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(3),
      O => i_mem_data_IBUF(3)
    );
\i_mem_data_IBUF[4]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(4),
      O => i_mem_data_IBUF(4)
    );
\i_mem_data_IBUF[5]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(5),
      O => i_mem_data_IBUF(5)
    );
\i_mem_data_IBUF[6]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(6),
      O => i_mem_data_IBUF(6)
    );
\i_mem_data_IBUF[7]_inst\: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_mem_data(7),
      O => i_mem_data_IBUF(7)
    );
i_rst_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_rst,
      O => i_rst_IBUF
    );
i_start_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_start,
      O => i_start_IBUF
    );
i_w_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => i_w,
      O => i_w_IBUF
    );
\io_fsm_a_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => io_fsm_a_IBUF(0),
      O => io_fsm_a(0)
    );
\io_fsm_a_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => io_fsm_a_IBUF(1),
      O => io_fsm_a(1)
    );
io_mux_out_sync_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => io_mux_out_sync_OBUF,
      O => io_mux_out_sync
    );
io_my_done_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => io_my_done_OBUF,
      O => io_my_done
    );
io_reg_out_sync_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => io_reg_out_sync_OBUF,
      O => io_reg_out_sync
    );
io_reg_rst_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => io_reg_rst_OBUF,
      O => io_reg_rst
    );
mux_map: entity work.demux
     port map (
      AR(0) => i_rst_IBUF,
      CLK => i_clk_IBUF_BUFG,
      D(7 downto 0) => i_mem_data_IBUF(7 downto 0),
      E(0) => REG00,
      Q(7 downto 0) => REG0(7 downto 0),
      \REG1_reg[7]_0\(7 downto 0) => REG1(7 downto 0),
      \REG1_reg[7]_1\(0) => REG10,
      \REG2_reg[7]_0\(7 downto 0) => REG2(7 downto 0),
      \REG2_reg[7]_1\(0) => REG20,
      \REG3_reg[7]_0\(7 downto 0) => REG3(7 downto 0),
      \REG3_reg[7]_1\(0) => REG30
    );
o_done_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => io_my_done_OBUF,
      O => o_done
    );
\o_mem_addr_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(0),
      O => o_mem_addr(0)
    );
\o_mem_addr_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(10),
      O => o_mem_addr(10)
    );
\o_mem_addr_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(11),
      O => o_mem_addr(11)
    );
\o_mem_addr_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(12),
      O => o_mem_addr(12)
    );
\o_mem_addr_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(13),
      O => o_mem_addr(13)
    );
\o_mem_addr_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(14),
      O => o_mem_addr(14)
    );
\o_mem_addr_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(15),
      O => o_mem_addr(15)
    );
\o_mem_addr_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(1),
      O => o_mem_addr(1)
    );
\o_mem_addr_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(2),
      O => o_mem_addr(2)
    );
\o_mem_addr_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(3),
      O => o_mem_addr(3)
    );
\o_mem_addr_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(4),
      O => o_mem_addr(4)
    );
\o_mem_addr_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(5),
      O => o_mem_addr(5)
    );
\o_mem_addr_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(6),
      O => o_mem_addr(6)
    );
\o_mem_addr_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(7),
      O => o_mem_addr(7)
    );
\o_mem_addr_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(8),
      O => o_mem_addr(8)
    );
\o_mem_addr_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_mem_addr_OBUF(9),
      O => o_mem_addr(9)
    );
o_mem_en_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_mem_en_OBUF,
      O => o_mem_en
    );
o_mem_we_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => o_mem_we
    );
\o_z0_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(0),
      O => o_z0(0)
    );
\o_z0_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(1),
      O => o_z0(1)
    );
\o_z0_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(2),
      O => o_z0(2)
    );
\o_z0_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(3),
      O => o_z0(3)
    );
\o_z0_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(4),
      O => o_z0(4)
    );
\o_z0_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(5),
      O => o_z0(5)
    );
\o_z0_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(6),
      O => o_z0(6)
    );
\o_z0_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z0_OBUF(7),
      O => o_z0(7)
    );
\o_z1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(0),
      O => o_z1(0)
    );
\o_z1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(1),
      O => o_z1(1)
    );
\o_z1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(2),
      O => o_z1(2)
    );
\o_z1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(3),
      O => o_z1(3)
    );
\o_z1_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(4),
      O => o_z1(4)
    );
\o_z1_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(5),
      O => o_z1(5)
    );
\o_z1_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(6),
      O => o_z1(6)
    );
\o_z1_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z1_OBUF(7),
      O => o_z1(7)
    );
\o_z2_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(0),
      O => o_z2(0)
    );
\o_z2_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(1),
      O => o_z2(1)
    );
\o_z2_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(2),
      O => o_z2(2)
    );
\o_z2_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(3),
      O => o_z2(3)
    );
\o_z2_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(4),
      O => o_z2(4)
    );
\o_z2_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(5),
      O => o_z2(5)
    );
\o_z2_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(6),
      O => o_z2(6)
    );
\o_z2_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z2_OBUF(7),
      O => o_z2(7)
    );
\o_z3_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(0),
      O => o_z3(0)
    );
\o_z3_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(1),
      O => o_z3(1)
    );
\o_z3_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(2),
      O => o_z3(2)
    );
\o_z3_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(3),
      O => o_z3(3)
    );
\o_z3_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(4),
      O => o_z3(4)
    );
\o_z3_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(5),
      O => o_z3(5)
    );
\o_z3_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(6),
      O => o_z3(6)
    );
\o_z3_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_z3_OBUF(7),
      O => o_z3(7)
    );
reg_in_map: entity work.Reg_In
     port map (
      CLK => i_clk_IBUF_BUFG,
      D(0) => i_w_IBUF,
      E(0) => fsm_map_n_44,
      Q(15 downto 0) => o_mem_addr_OBUF(15 downto 0),
      \REG_reg[0]_0\ => fsm_map_n_0
    );
end STRUCTURE;
