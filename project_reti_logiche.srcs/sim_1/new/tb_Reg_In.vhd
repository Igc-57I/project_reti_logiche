LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE std.textio.ALL;

entity tb_Reg_In is
end tb_Reg_In;

architecture tb_reg_in_arch of tb_Reg_In is 
    CONSTANT CLOCK_PERIOD : TIME := 100 ns;
    signal D_in : std_logic;
    signal reg_rst : std_logic;
    signal Q_out: std_logic_vector(15 downto 0);
    SIGNAL tb_clk : STD_LOGIC := '0';
    
    component Reg_In is
        port(
            D: in std_logic; 
            CLOCK: in std_logic; 
            RST: in std_logic; 
            Q: out std_logic_vector(15 downto 0)
            );
    end component Reg_In;
    
    begin
        uut: Reg_In
        port map(
            D => D_in,
            Q => Q_out,
            CLOCK => tb_clk,
            RST => reg_rst
            );
            
        -- Process for the clock generation
        CLK_GEN : PROCESS IS
        BEGIN
            WAIT FOR CLOCK_PERIOD/2;
            tb_clk <= NOT tb_clk;
        END PROCESS CLK_GEN;
        
        test: process is
        begin
            reg_rst <= '0';
            D_in <= '0';
            wait for 100 ns;
            reg_rst <= '1';
            D_in <= '1';
            wait for 100 ns;
            reg_rst <= '0';
            D_in <= '0';
            wait for 100 ns;
            D_in <= '0';
            wait for 100 ns;
            D_in <= '1';
            wait for 100 ns;
            D_in <= '0';
            wait for 100 ns;
            D_in <= '1';
            wait for 100 ns;
            D_in <= '0';
            wait for 100 ns;
            D_in <= '1';
            wait for 100 ns;
            D_in <= '0';
            wait for 100 ns;
            D_in <= '0';
            wait for 100 ns;
            D_in <= '1';
            wait for 100 ns;
            D_in <= '1';
            wait for 100 ns;
            D_in <= '0';
            wait for 100 ns;
            D_in <= '1';
            wait for 100 ns;
            D_in <= '0';
            wait for 100 ns;
            D_in <= '1';
            wait for 100 ns;
            D_in <= '1';
            wait for 100 ns;
            D_in <= '1';
            wait for 100 ns;
            reg_rst <= '1';
            D_in <= '1';
            wait for 100 ns;
            reg_rst <= '0';
            D_in <= '1';
            wait for 100 ns;
            D_in <= '1';
            wait for 100 ns;
            D_in <= '1';
        end process;

end tb_reg_in_arch;