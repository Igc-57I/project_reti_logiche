----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2023 03:05:19 PM
-- Design Name: 
-- Module Name: project_reti_logiche - Behavioral
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

entity project_reti_logiche is
    port (
        i_clk : in std_logic;
        i_rst : in std_logic;
        i_start : in std_logic;
        i_w : in std_logic;
        o_z0 : out std_logic_vector(7 downto 0);
        o_z1 : out std_logic_vector(7 downto 0);
        o_z2 : out std_logic_vector(7 downto 0);
        o_z3 : out std_logic_vector(7 downto 0);
        o_done : out std_logic;
        o_mem_addr : out std_logic_vector(15 downto 0);
        i_mem_data : in std_logic_vector(7 downto 0);
        o_mem_we : out std_logic;
        o_mem_en : out std_logic
        );
end project_reti_logiche;

architecture Behavioral of project_reti_logiche is

begin


end Behavioral;

-- registro uscita (PP) 0

entity Reg_Out_0 is
	port (D: in bit_vector(7 downto 0); CLOCK: in bit; RST: in bit; Q: out bit_vector(7 downto 0));
end Reg_Out_0;

architecture RegPP0 of Reg_Out_0 is
begin
	process(CLOCK) --assegnamento dell'ingresso
		variable REG: bit_vector(7 downto 0);
	begin
		if(CLOCK'event and CLOCK = '1') then
			REG:= D;
		end if;
		Q  <= REG;
	end process;

	process(RST) --reset al valore 0
	begin
		if(RST'event and RST = '1') then
			Q <= (others => '0');
		end if;
	end process;
		
end RegPP0;

-- x4 registri uscita ... (todo)

-- Registro ingresso RSP

entity Reg_In is
    port(D: in bit; CLOCK: in bit; RST: in bit; Q: out bit_vector(15 downto 0));
end Reg_In;

architecture RSP of Reg_In is
begin
    process(CLOCK) --scorrimento ed inserimento
        variable REG: bit_vector(15 downto 0);
    begin
        if(CLOCK'event and CLOCK = '1') then
			REG := REG(14 downto 0) & D;
		end if;
		Q <= REG;
    end process;
    
    process(RST)
    begin
        if(RST'event and RST = '1') then            
            Q <= (others => '0');
        end if;
    end process;
end RSP;

--Multiplexer

entity Multiplexer is
    port(S: in bit_vector(1 downto 0); CLOCK: in bit;
    O0: out bit_vector(7 downto 0);
    O1: out bit_vector(7 downto 0);
    O2: out bit_vector(7 downto 0);
    O3: out bit_vector(7 downto 0);
    I: in bit_vector(7 downto 0));
end Multiplexer;

architecture mult4 of Multiplexer is
begin
    process(CLOCK)
        variable REG: bit_vector(7 downto 0);
    begin
    if(CLOCK'event and CLOCK = '1') then
        REG := I;
        if(S = "00") then
            O0 <= REG;
        elsif(S = "01") then
            O1 <= REG;
        elsif(S = "10") then
            O2 <= REG;
        else
            O3 <= REG;
        end if;
    end if;
    end process;
end mult4;