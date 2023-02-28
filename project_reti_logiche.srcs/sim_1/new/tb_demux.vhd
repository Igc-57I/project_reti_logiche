----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2023 16:17:01
-- Design Name: 
-- Module Name: tb_demux - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_demux is
end tb_demux;

architecture Behavioral of tb_demux is
    CONSTANT CLOCK_PERIOD : TIME := 100 ns;
    signal tb_S0 : std_logic;
    signal tb_S1 : std_logic;
    signal tb_I : std_logic_vector(7 downto 0);
    signal tb_clk : std_logic := '0';
    signal tb_O0 : std_logic_vector(7 downto 0);
    signal tb_O1 : std_logic_vector(7 downto 0);
    signal tb_O2 : std_logic_vector(7 downto 0);
    signal tb_O3 : std_logic_vector(7 downto 0);
    
    component demux is
        port (
            S0: in std_logic;
            S1: in std_logic;
            I: in std_logic_vector(7 downto 0);
            CLOCK: in std_logic;
            OUT0: out std_logic_vector(7 downto 0);
            OUT1: out std_logic_vector(7 downto 0);
            OUT2: out std_logic_vector(7 downto 0);
            OUT3: out std_logic_vector(7 downto 0)
        );
    end component demux;
    
begin
    
    uut: demux
        port map(
            S0 => tb_S0,
            S1 => tb_S1,
            I => tb_I,
            CLOCK => tb_clk,
            OUT0 => tb_O0,
            OUT1 => tb_O1,
            OUT2 => tb_O2,
            OUT3 => tb_O3
            );
            
    -- Process for the clock generation
    CLK_GEN : PROCESS IS
    BEGIN
        WAIT FOR CLOCK_PERIOD/2;
        tb_clk <= NOT tb_clk;
    END PROCESS CLK_GEN;

    test : process is
    begin
        tb_S0 <= '0';
        tb_S1 <= '0';
        tb_I <= "01101001";
        wait for 100 ns;
        tb_S0 <= '0';
        tb_S1 <= '1';
        tb_I <= "00001001";
        wait for 100 ns;
        tb_S0 <= '1';
        tb_S1 <= '0';
        tb_I <= "01110001";
        wait for 100 ns;
        tb_S0 <= '1';
        tb_S1 <= '1';
        tb_I <= "10001010";
        wait for 100 ns;
        tb_S0 <= '0';
        tb_S1 <= '0';
        tb_I <= "00000000";
        wait for 100 ns;
        tb_S0 <= '0';
        tb_S1 <= '1';
        tb_I <= "00000000";
        wait for 100 ns;
        tb_S0 <= '1';
        tb_S1 <= '0';
        tb_I <= "00000000";
        wait for 100 ns;
        tb_S0 <= '1';
        tb_S1 <= '1';
        tb_I <= "00000000";
        wait for 100 ns;
    end process;
end Behavioral;
