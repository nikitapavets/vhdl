library ieee;
use ieee.std_logic_1164.all;

entity jk_trigger_tb is
end jk_trigger_tb;

architecture behaviour of jk_trigger_tb is
  
    component jk_trigger is
        port (  notR: in  std_logic;
                J: in  std_logic;
                Clk: in  std_logic;
                K: in  std_logic;
                notS: in  std_logic;
                Q : out std_logic;
                notQ: out std_logic );
    end component;

    signal notR: std_logic;
    signal J: std_logic;
    signal Clk: std_logic;
    signal K: std_logic;
    signal notS: std_logic;
    signal Q: std_logic;
    signal notQ: std_logic;
    
    constant clk_period : time := 1 ns;

begin
    jk_trigger_map: jk_trigger port map (notR, J, Clk, K, notS, Q, notQ);
  
    clk_process: process
    begin
            Clk <= '0';
            wait for clk_period / 2;
            Clk <= '1';
            wait for clk_period / 2;
    end process;
  
    stim_proc: process
    begin
    
        for not_r_loop in std_logic range '0' to '1' loop
            for not_s_loop in std_logic range '0' to '1' loop
                for j_loop in std_logic range '0' to '1' loop
                    for k_loop in std_logic range '0' to '1' loop
                    
                        notR <= not_r_loop;
                        notS <= not_s_loop;
                        J <= j_loop;
                        K <= k_loop;
                        wait for clk_period;
                        
                    end loop;
                end loop;
            end loop;
        end loop;
        
        wait;
        
    end process;

end behaviour;
