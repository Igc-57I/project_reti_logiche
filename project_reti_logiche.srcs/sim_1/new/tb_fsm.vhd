----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2023 19:29:32
-- Design Name: 
-- Module Name: tb_fsm - Behavioral
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

entity tb_fsm is
--  Port ( );
end tb_fsm;

architecture tb_fsm_arch of tb_fsm is
    CONSTANT CLOCK_PERIOD : TIME := 100 ns;
    signal tb_START : std_logic;
    signal tb_W : std_logic; 
    signal tb_RST : std_logic; 
    signal tb_W_TO_REG : std_logic;
    signal tb_MEM_EN : std_logic;
    signal tb_A : std_logic_vector(1 downto 0); --bro?
    signal tb_DONE : std_logic;
    SIGNAL tb_clk : STD_LOGIC := '0';
    
    component FSM is
    port(
        START: in std_logic; 
        W: in std_logic; 
        CLOCK: in std_logic; 
        RST: in std_logic; 
        W_TO_REG: out std_logic;
        MEM_EN: out std_logic;
        A: inout std_logic_vector(1 downto 0); --bro?
        DONE: out std_logic);
    end component FSM;

begin
    uut : fsm
    port map (
        START => tb_START,
        W => tb_W,
        CLOCK => tb_clk,
        RST => tb_RST,
        W_TO_REG => tb_W_TO_REG,
        MEM_EN => tb_MEM_EN,
        A => tb_A,
        DONE => tb_DONE
        );
            
     -- Process for the clock generation
    CLK_GEN : PROCESS IS
    BEGIN
        WAIT FOR CLOCK_PERIOD/2;
        tb_clk <= NOT tb_clk;
    END PROCESS CLK_GEN;
    
    test: process is
    begin
        tb_RST <= '1';
        tb_START <= '0';
        wait for 100 ns;
        tb_RST <= '0';
        tb_W <= '1';
        wait for 100 ns;
        tb_W <= '1';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '0';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '1';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '0';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '0';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '1';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '1';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '0';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '0';
        wait for 100 ns;
        tb_START <= '0';
        tb_W <= '1';
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        tb_RST <= '1';
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        tb_RST <= '0';
        tb_W <= '1';
        wait for 100 ns;
        tb_W <= '1';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '1';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '1';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '0';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '0';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '1';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '1';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '0';
        wait for 100 ns;
        tb_START <= '1';
        tb_W <= '0';
        wait for 100 ns;
        tb_START <= '0';
        tb_W <= '1';
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;
        tb_RST <= '1';
        wait for 100 ns;
        wait for 100 ns;
    end process;

end tb_fsm_arch;
