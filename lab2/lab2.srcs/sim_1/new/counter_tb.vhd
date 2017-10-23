library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity counter_tb is
end counter_tb;

architecture Behavioral of counter_tb is

    component counter is
        port (  
            CLR: in std_logic;
            UP: in std_logic;
            DOWN: in std_logic;
            nLOAD: in std_logic;
            X: in std_logic_vector (3 downto 0);
            nCO: out std_logic;
            nBO: out std_logic;
            Q: out std_logic_vector (3 downto 0)
        );
    end component;

    signal CLR: std_logic := '0';
    signal UP: std_logic := '0';
    signal DOWN: std_logic := '0';
    signal nLOAD: std_logic := '1';
    signal X: std_logic_vector (3 downto 0) := "0000";
    signal nCO: std_logic;
    signal nBO: std_logic;
    signal Q: std_logic_vector (3 downto 0);
    
    constant clk_period : time := 1 ns;

begin

    counter_map: counter port map (CLR, UP, DOWN, nLOAD, X, nCO, nBO, Q);
    
    process
    begin
    
        wait for clk_period;
        X <= "0100";
        nLOAD <= '0';
        wait for clk_period;
        nLOAD <= '0';
        wait for clk_period;
        CLR <= '1';
        wait for clk_period;
        CLR <= '0';
        wait for clk_period;
        DOWN <= '1';
    
        for i in 0 to 25 loop
            UP <= '0';
            wait for clk_period / 2;
            UP <= '1';
            wait for clk_period / 2;
        end loop;
        
        UP <= '1';
        
        for i in 0 to 25 loop
            DOWN <= '0';
            wait for clk_period / 2;
            DOWN <= '1';
            wait for clk_period / 2;
        end loop;
        
        wait;
        
    end process;

end Behavioral;
