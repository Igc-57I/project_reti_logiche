----------------------------------------------------------------------------------
-- Company: Politecnico di Milano
-- Engineer: Brunetta Giacomo, Carminati Gabriele
-- 
-- Create Date: 02/23/2023 03:05:19 PM
-- Design Name: 
-- Module Name: project_reti_logiche - Behavioral
-- Project Name: Progetto Reti Logiche AA 22/23
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
        o_mem_we : out std_logic := '0';
        o_mem_en : out std_logic;
        
        io_fsm_a : inout std_logic_vector(1 downto 0);
        io_mux_out_sync : inout std_logic;
        io_reg_out_sync : inout std_logic;
        io_my_done : inout std_logic;
        io_reg_rst : inout std_logic
        );
end project_reti_logiche;

architecture Behavioral of project_reti_logiche is
component FSM is
    port(
        START: in std_logic; 
        W: in std_logic; 
        CLOCK: in std_logic; 
        RST: in std_logic;
        REG_RST: out std_logic;
        MEM_EN: out std_logic;
        A: inout std_logic_vector(1 downto 0); --bro?
        MUX_OUT_SYNC: out std_logic;
        REG_OUT_SYNC: out std_logic;
        DONE: out std_logic);
end component;

component Reg_In is
    port(
        D: in std_logic; 
        CLOCK: in std_logic;
        FSM_SYNC: in std_logic;
        START_SYNC: in std_logic;
        RST: in std_logic; 
        FSM_RST: in std_logic;
        Q: out std_logic_vector(15 downto 0));
end component;

component demux is
    port(
        A: in std_logic_vector(1 downto 0);
        I: in std_logic_vector(7 downto 0);
        CLOCK: in std_logic;
        FSM_SYNC: in std_logic;
        RST: in std_logic;
        DONE: in std_Logic;
        OUT0: out std_logic_vector(7 downto 0);
        OUT1: out std_logic_vector(7 downto 0);
        OUT2: out std_logic_vector(7 downto 0);
        OUT3: out std_logic_vector(7 downto 0)
    );
end component;

begin
    -- fsm port map
    fsm_map : FSM
    port map (
        START => i_start,
        W => i_w,
        CLOCK => i_clk,
        RST => i_rst,
        REG_RST => io_reg_rst,
        DONE => io_my_done,
        MEM_EN => o_mem_en,
        A => io_fsm_a,
        MUX_OUT_SYNC => io_mux_out_sync,
        REG_OUT_SYNC => io_reg_out_sync
    );
    
    -- reg in port map
    reg_in_map : Reg_In
    port map (
        D => i_w,
        CLOCK => i_clk,
        FSM_SYNC => io_reg_out_sync,
        START_SYNC => i_start,
        RST => i_rst,
        FSM_RST => io_reg_rst,
        Q => o_mem_addr
    );
    
    -- mux port map
    mux_map : demux
    port map (
        A => io_fsm_a,
        I => i_mem_data,
        CLOCK => i_clk,
        FSM_SYNC => io_mux_out_sync,
        RST => i_rst,
        DONE => io_my_done,
        OUT0 => o_z0,
        OUT1 => o_z1,
        OUT2 => o_z2,
        OUT3 => o_z3
    );
    
    o_done <= io_my_done;
        
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Registro ingresso SP

entity Reg_In is
    port(
    D: in std_logic; 
    CLOCK: in std_logic;
    FSM_SYNC: in std_logic; -- usato per leggere i valori in ingresso solo quando lo dice la fsm
    START_SYNC: in std_logic; -- usato per sincronizzare su start
    RST: in std_logic; 
    FSM_RST: in std_logic;
    Q: out std_logic_vector(15 downto 0));
end Reg_In;

architecture RSP of Reg_In is
begin
    process(CLOCK, RST, FSM_RST) --scorrimento ed inserimento
        variable REG: std_logic_vector(15 downto 0) := (others => '0');
    begin
        if(RST = '1') then            
            REG := (others => '0');
        elsif(FSM_RST = '1') then            
            REG := (others => '0');
        elsif(FSM_SYNC = '1' and START_SYNC = '1' and CLOCK'event and CLOCK = '1') then
			REG := REG(14 downto 0) & D;
		end if;
		Q <= REG;
    end process;
end RSP;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- fsm
entity FSM is
    port(
        START: in std_logic; 
        W: in std_logic; 
        CLOCK: in std_logic; 
        RST: in std_logic;
        REG_RST: out std_logic;
        MEM_EN: out std_logic;
        A: inout std_logic_vector(1 downto 0);
        MUX_OUT_SYNC: out std_logic; -- usato per comandare al mux di leggere il dato dalla memoria solo quando la fsm sta nello stato giusto
        REG_OUT_SYNC: out std_logic; -- usato per dire al reg in quando leggere l'input
        DONE: out std_logic);
end FSM;
    
architecture FSM_arch of FSM is
    type S is (S0, S1, S2, S3, S4, S5, S6, S7);
    -- S0 = stato iniziale / reset
    -- S1 = leggo primo bit
    -- S2 = leggo secondo bit
    -- S3 = leggo bit per indirizzo di memoria
    -- S4 = aspetto un cliclo di clock
    -- S5 = interazione con memoria
    -- S6 = aspetto un ciclo di clock
    -- S7 = visualizzo uscite
    signal curr_state : S;
begin
    
    -- delta function = funzione per le transizioni di stato (ed A)
    delta_function : process(CLOCK, RST)
    variable REGA: std_logic_vector(1 downto 0);
    begin
        if (RST = '1') then
            curr_state <= S0;
        else
            if (CLOCK'event and CLOCK = '1') then
                case curr_state is
                    when S0 =>
                        if (START = '1') then
                            curr_state <= S1;
                            REGA(0) := W;
                        end if;
                    when S1 =>
                        curr_state <= S2;
                        REGA(1) := W;
                    when S2 =>
                        curr_state <= S3;
                    when S3 =>
                        if (START = '0') then
                            curr_state <= S4;
                        end if;
                    when S4 =>
                        curr_state <= S5;
                    when S5 =>
                        curr_state <= S6;
                    when S6 =>
                        curr_state <= S7;
                    when S7 =>
                        curr_state <= S0;
                end case;
            end if;                      
        end if;
        A <= REGA;
    end process;
    
    -- lambda function = funzione per gestire le uscite
    lambda_function : process(curr_state)
    begin
        case curr_state is
            when S0 =>
                DONE <= '0';
                MEM_EN <= '0';
                MUX_OUT_SYNC <= '0';
                REG_OUT_SYNC <= '0';
                REG_RST <= '1';
            when S1 =>
                REG_RST <= '0';
                DONE <= '0';
                MEM_EN <= '0';
                MUX_OUT_SYNC <= '0';
                REG_OUT_SYNC <= '0';
            when S2 =>
                REG_RST <= '0';
                REG_OUT_SYNC <= '1';
                DONE <= '0';
                MEM_EN <= '0';
                MUX_OUT_SYNC <= '0';
            when S3 => 
                REG_RST <= '0';
                REG_OUT_SYNC <= '1';
                DONE <= '0';
                MEM_EN <= '0';
                MUX_OUT_SYNC <= '0';
            when S4 =>
                REG_OUT_SYNC <= '0';
                REG_RST <= '0';
                DONE <= '0';
                MEM_EN <= '0';
                MUX_OUT_SYNC <= '0';
            when S5 =>
                MEM_EN <= '1';
                REG_OUT_SYNC <= '0';
                REG_RST <= '0';
                DONE <= '0';
                MUX_OUT_SYNC <= '0';
            when S6 =>
                MUX_OUT_SYNC <= '1';
                MEM_EN <= '1';
                REG_OUT_SYNC <= '0';
                REG_RST <= '0';
                DONE <= '0';
            when S7 =>
                DONE <= '1';
                MUX_OUT_SYNC <= '1';
                MEM_EN <= '1';
                REG_OUT_SYNC <= '0';
                REG_RST <= '0';
        end case;
    end process;
        
end FSM_arch;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux is
    port(
        A: in std_logic_vector(1 downto 0);
        I: in std_logic_vector(7 downto 0);
        CLOCK: in std_logic;
        FSM_SYNC: in std_logic; -- vedi MUX_OUT_SYNC nella fsm
        RST: in std_logic;
        DONE: in std_logic;
        OUT0: out std_logic_vector(7 downto 0);
        OUT1: out std_logic_vector(7 downto 0);
        OUT2: out std_logic_vector(7 downto 0);
        OUT3: out std_logic_vector(7 downto 0)
    );
end demux;

architecture DMX_arc of demux is
    begin
    process(CLOCK, RST, DONE)
        variable REG0: std_logic_vector(7 downto 0) := (others => '0');
        variable REG1: std_logic_vector(7 downto 0) := (others => '0');
        variable REG2: std_logic_vector(7 downto 0) := (others => '0');
        variable REG3: std_logic_vector(7 downto 0) := (others => '0');
    begin
        if (RST = '1') then
            REG0 := (others => '0');
            REG1 := (others => '0');
            REG2 := (others => '0');
            REG3 := (others => '0');
        elsif(FSM_SYNC = '1' and CLOCK'event and CLOCK = '1') then
            if (A(0) = '0' and A(1) = '0') then
                REG0 := I;
            elsif (A(0) = '0' and A(1) = '1') then
                REG1 := I;
            elsif (A(0) = '1' and A(1) = '0') then
                REG2 := I;
            elsif (A(0) = '1' and A(1) = '1') then
                REG3 := I;
            end if;
        end if;
        
        if (DONE = '1') then
            OUT0 <= REG0;
            OUT1 <= REG1;
            OUT2 <= REG2;
            OUT3 <= REG3;
        else
            OUT0 <= (others => '0');
            OUT1 <= (others => '0');
            OUT2 <= (others => '0');
            OUT3 <= (others => '0');
        end if;
    end process;
end DMX_arc;