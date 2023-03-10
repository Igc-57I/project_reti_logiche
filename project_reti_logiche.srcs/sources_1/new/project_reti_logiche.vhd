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
        
        io_fsm_sel : inout std_logic_vector(1 downto 0);
        io_mux_out_en : inout std_logic;
        io_reg_out_en : inout std_logic;
        io_done : inout std_logic;
        io_reg_rst : inout std_logic
        );
end project_reti_logiche;

architecture Behavioral of project_reti_logiche is
component FSM is
    port(
        START: in std_logic; 
        INPUT_FOR_SELECTOR: in std_logic; 
        CLOCK: in std_logic; 
        RST: in std_logic;
        REG_RST: out std_logic;
        MEM_ENABLE: out std_logic;
        SELECTOR: inout std_logic_vector(1 downto 0);
        MUX_OUT_ENABLE: out std_logic;
        REG_OUT_ENABLE: out std_logic;
        DONE: out std_logic);
end component;

component Reg_In is
    port(
        INPUT: in std_logic; 
        CLOCK: in std_logic;
        FSM_ENABLE: in std_logic;
        START_ENABLE: in std_logic;
        RST: in std_logic; 
        FSM_RST: in std_logic;
        ADDRESS: out std_logic_vector(15 downto 0));
end component;

component demux is
    port(
        SELECTOR: in std_logic_vector(1 downto 0);
        INPUT: in std_logic_vector(7 downto 0);
        CLOCK: in std_logic;
        FSM_ENABLE: in std_logic;
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
        INPUT_FOR_SELECTOR => i_w,
        CLOCK => i_clk,
        RST => i_rst,
        REG_RST => io_reg_rst,
        DONE => io_done,
        MEM_ENABLE => o_mem_en,
        SELECTOR => io_fsm_sel,
        MUX_OUT_ENABLE => io_mux_out_en,
        REG_OUT_ENABLE => io_reg_out_en
    );
    
    -- reg_in port map
    reg_in_map : Reg_In
    port map (
        INPUT => i_w,
        CLOCK => i_clk,
        FSM_ENABLE => io_reg_out_en,
        START_ENABLE => i_start,
        RST => i_rst,
        FSM_RST => io_reg_rst,
        ADDRESS => o_mem_addr
    );
    
    -- demux port map
    demux_map : demux
    port map (
        SELECTOR => io_fsm_sel,
        INPUT => i_mem_data,
        CLOCK => i_clk,
        FSM_ENABLE => io_mux_out_en,
        RST => i_rst,
        DONE => io_done,
        OUT0 => o_z0,
        OUT1 => o_z1,
        OUT2 => o_z2,
        OUT3 => o_z3
    );
    
    o_done <= io_done;
        
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_In is
    port(
    INPUT: in std_logic; 
    CLOCK: in std_logic;
    FSM_ENABLE: in std_logic;
    START_ENABLE: in std_logic;
    RST: in std_logic; 
    FSM_RST: in std_logic;
    ADDRESS: out std_logic_vector(15 downto 0));
end Reg_In;

architecture RSP of Reg_In is
begin
    process(CLOCK, RST, FSM_RST)
        variable REG_IN: std_logic_vector(15 downto 0) := (others => '0');
    begin
        if(RST = '1') then            
            REG_IN := (others => '0');
        elsif(FSM_RST = '1') then            
            REG_IN := (others => '0');
        elsif(FSM_ENABLE = '1' and START_ENABLE = '1' and CLOCK'event and CLOCK = '1') then
			REG_IN := REG_IN(14 downto 0) & INPUT;
		end if;
		ADDRESS <= REG_IN;
    end process;
end RSP;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    port(
        START: in std_logic; 
        INPUT_FOR_SELECTOR: in std_logic; 
        CLOCK: in std_logic; 
        RST: in std_logic;
        REG_RST: out std_logic;
        MEM_ENABLE: out std_logic;
        SELECTOR: inout std_logic_vector(1 downto 0);
        MUX_OUT_ENABLE: out std_logic;
        REG_OUT_ENABLE: out std_logic;
        DONE: out std_logic);
end FSM;
    
architecture FSM_arch of FSM is
    type S is (S0, S1, S2, S3, S4, S5, S6, S7);
    -- S0 = initial state (reset)
    -- S1 = read the first bit
    -- S2 = read the second bit
    -- S3 = read 0 - 16 bits in and put the in the input register
    -- S4 = wait one clock cicle
    -- S5 = interact with esternal memory (ask for data and wait for response)
    -- S6 = wait one clock cicle
    -- S7 = show output
    signal curr_state : S;
begin
    
    -- delta function = (syncronous) Changes the state and of the FSM, including the SELECTOR output
    delta_function : process(CLOCK, RST)
    variable REG_SELECTOR: std_logic_vector(1 downto 0);
    begin
        if (RST = '1') then
            curr_state <= S0;
        else
            if (CLOCK'event and CLOCK = '1') then
                case curr_state is
                    when S0 =>
                        if (START = '1') then
                            curr_state <= S1;
                            REG_SELECTOR(0) := INPUT_FOR_SELECTOR;
                        end if;
                    when S1 =>
                        curr_state <= S2;
                        REG_SELECTOR(1) := INPUT_FOR_SELECTOR;
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
        SELECTOR <= REG_SELECTOR;
    end process;
    
    -- lambda function: (asyncronous) handles the output signals of the FSM
    lambda_function : process(curr_state)
    begin
        case curr_state is
            when S0 =>
                DONE <= '0';
                MEM_ENABLE <= '0';
                MUX_OUT_ENABLE <= '0';
                REG_OUT_ENABLE <= '0';
                REG_RST <= '1';
            when S1 =>
                REG_RST <= '0';
                DONE <= '0';
                MEM_ENABLE <= '0';
                MUX_OUT_ENABLE <= '0';
                REG_OUT_ENABLE <= '0';
            when S2 =>
                REG_RST <= '0';
                REG_OUT_ENABLE <= '1';
                DONE <= '0';
                MEM_ENABLE <= '0';
                MUX_OUT_ENABLE <= '0';
            when S3 => 
                REG_RST <= '0';
                REG_OUT_ENABLE <= '1';
                DONE <= '0';
                MEM_ENABLE <= '0';
                MUX_OUT_ENABLE <= '0';
            when S4 =>
                REG_OUT_ENABLE <= '0';
                REG_RST <= '0';
                DONE <= '0';
                MEM_ENABLE <= '0';
                MUX_OUT_ENABLE <= '0';
            when S5 =>
                MEM_ENABLE <= '1';
                REG_OUT_ENABLE <= '0';
                REG_RST <= '0';
                DONE <= '0';
                MUX_OUT_ENABLE <= '0';
            when S6 =>
                MUX_OUT_ENABLE <= '1';
                MEM_ENABLE <= '1';
                REG_OUT_ENABLE <= '0';
                REG_RST <= '0';
                DONE <= '0';
            when S7 =>
                DONE <= '1';
                MUX_OUT_ENABLE <= '1';
                MEM_ENABLE <= '1';
                REG_OUT_ENABLE <= '0';
                REG_RST <= '0';
        end case;
    end process;
        
end FSM_arch;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux is
    port(
        SELECTOR: in std_logic_vector(1 downto 0);
        INPUT: in std_logic_vector(7 downto 0);
        CLOCK: in std_logic;
        FSM_ENABLE: in std_logic;
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
        elsif(FSM_ENABLE = '1' and CLOCK'event and CLOCK = '1') then
            if (SELECTOR(0) = '0' and SELECTOR(1) = '0') then
                REG0 := INPUT;
            elsif (SELECTOR(0) = '0' and SELECTOR(1) = '1') then
                REG1 := INPUT;
            elsif (SELECTOR(0) = '1' and SELECTOR(1) = '0') then
                REG2 := INPUT;
            elsif (SELECTOR(0) = '1' and SELECTOR(1) = '1') then
                REG3 := INPUT;
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