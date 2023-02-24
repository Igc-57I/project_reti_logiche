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
--TODO: mappare le entity alle porte
begin


end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- registro uscita (PP) 0

entity Reg_Out_0 is
	port (D: in std_logic_vector(7 downto 0); CLOCK: in std_logic; RST: in std_logic; Q: out std_logic_vector(7 downto 0));
end Reg_Out_0;

architecture RegPP0 of Reg_Out_0 is
begin
	process(CLOCK) --assegnamento dell'ingresso
		variable REG: std_logic_vector(7 downto 0);
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- registro uscita (PP) 1

entity Reg_Out_1 is
	port (D: in std_logic_vector(7 downto 0); CLOCK: in std_logic; RST: in std_logic; Q: out std_logic_vector(7 downto 0));
end Reg_Out_1;

architecture RegPP1 of Reg_Out_1 is
begin
	process(CLOCK) --assegnamento dell'ingresso
		variable REG: std_logic_vector(7 downto 0);
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
		
end RegPP1;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- registro uscita (PP) 2

entity Reg_Out_2 is
	port (D: in std_logic_vector(7 downto 0); CLOCK: in std_logic; RST: in std_logic; Q: out std_logic_vector(7 downto 0));
end Reg_Out_2;

architecture RegPP2 of Reg_Out_2 is
begin
	process(CLOCK) --assegnamento dell'ingresso
		variable REG: std_logic_vector(7 downto 0);
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
		
end RegPP2;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- registro uscita (PP) 3

entity Reg_Out_3 is
	port (D: in std_logic_vector(7 downto 0); CLOCK: in std_logic; RST: in std_logic; Q: out std_logic_vector(7 downto 0));
end Reg_Out_3;

architecture RegPP3 of Reg_Out_3 is
begin
	process(CLOCK) --assegnamento dell'ingresso
		variable REG: std_logic_vector(7 downto 0);
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
		
end RegPP3;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Registro ingresso SP

entity Reg_In is
    port(D: in std_logic; CLOCK: in std_logic; RST: in std_logic; Q: out std_logic_vector(15 downto 0));
end Reg_In;

architecture RSP of Reg_In is
begin
    process(CLOCK) --scorrimento ed inserimento
        variable REG: std_logic_vector(15 downto 0);
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

-- ma che cazzo di senso ha che devo copiare la libreira sopra ogni entity se voglio usare gli std_logic?
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- fsm
entity FSM is
    port(
        START: in std_logic; 
        W: in std_logic; 
        CLOCK: in std_logic; 
        RST: in std_logic; 
        W_TO_REG: out std_logic;
        MEM_EN: out std_logic;
        A: inout std_logic_vector(1 downto 0); --bro?
        DONE: out std_logic);
end FSM;
    
architecture FSM_arch of FSM is
    type S is (S0, S1, S2, S3, S4, S5);
    -- S0 = stato iniziale / reset
    -- S1 = leggo primo bit
    -- S2 = leggo secondo bit
    -- S3 = leggo bit per indirizzo di memoria
    -- S4 = interazione con memoria
    -- S5 = visualizzo uscite
    signal curr_state : S;
begin
    
    -- delta function = funzione per le transizioni di stato
    delta_function : process(CLOCK, RST)
    begin
        if (RST'event and RST='1') then
            curr_state <= S0;
        elsif (CLOCK'event and CLOCK='1') then
            if (curr_state = S0 and START = '1') then
                curr_state <= S1;
            elsif (curr_state = S1) then
                curr_state <= S2;
            elsif (curr_state = S2) then
                curr_state <= S3;
            elsif (curr_state = S3 and START = '0') then
                curr_state <= S4;
            elsif (curr_state = S4) then
                curr_state <= S5;
            elsif (curr_state = S5) then
                curr_state <= S0;
            else
                curr_state <= curr_state;
            -- aggiunto else
            end if;
        end if;
    end process;
    
    -- lambda function = funzione per gestire le uscite
    lambda_function : process(START, W, CLOCK, curr_state)
    begin
        if (curr_state = S0) then
            -- in S0 setto tutte le uscite a zero
            DONE <= '0';
            W_TO_REG <= '0'; -- forse questa non serve
            MEM_EN <= '0';
        elsif (curr_state = S1) then
            -- mantengo uscite a 0 tranne A(0) primo bit mux
            DONE <= '0';
            W_TO_REG <= '0'; -- forse questa non serve
            MEM_EN <= '0';
            A(0) <= W;
        elsif (curr_state = S2) then
            -- come sopra ma modifico secondo bit
            DONE <= '0';
            W_TO_REG <= '0'; -- forse questa non serve
            MEM_EN <= '0';
            A(1) <= W;
        elsif (curr_state = S3) then
            -- mando i bit in ingresso al registro usando W_TO_REG
            DONE <= '0';
            W_TO_REG <= W; -- poi il registro gestisce come salvarlo
            MEM_EN <= '0';
        elsif (curr_state = S4) then
            -- interagisco con memoria, tengo a 0 le uscite e aspetto 1 ciclo di clock per la risposta
            DONE <= '0';
            W_TO_REG <= '0'; -- forse non serve
            MEM_EN <= '1'; -- cambio per interagire con memoria
        elsif (curr_state = S5) then --cambiato in s5 (probabile typo)
            -- salvo il dato dalla memoria nei registri d'uscita e li rendo visibili
            DONE <= '1'; -- rendo visibili le uscite
            W_TO_REG <= '0'; -- forse non serve
            MEM_EN <= '1'; -- credo serve = 1 per poter copiare il dato nei registri ma forse va bene a 0
        end if;
    end process;
        
end FSM_arch;

-- TODO:
        -- forse aggiungere un altro segnale di sincronizzazione per i registri, per farli lavorare solo quando serve e non a ogni ciclo di clock
        -- forse aggiungere un input a fsm per il dato dalla memoria invece di mandarlo direttamente nel mux, non so se cambia qualcosa