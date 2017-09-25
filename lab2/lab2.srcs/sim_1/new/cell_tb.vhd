library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity cell_tb is
end cell_tb;

architecture Behavioral of cell_tb is

    component cell is
        port (  
            X : in STD_LOGIC;
            nLOAD: in STD_LOGIC;
            CLR: in STD_LOGIC;
            CARRY1: in STD_LOGIC;
            CARRY2: in STD_LOGIC;
            DOWN: in STD_LOGIC;
            UP: in STD_LOGIC;
            Clk: in STD_LOGIC;
            Q: out STD_LOGIC;
            notQ: out STD_LOGIC
        );
    end component;
    
    signal X : STD_LOGIC;
    signal nLOAD: STD_LOGIC;
    signal CLR: STD_LOGIC;
    signal CARRY1: STD_LOGIC;
    signal CARRY2: STD_LOGIC;
    signal DOWN: STD_LOGIC;
    signal UP: STD_LOGIC;
    signal Clk: STD_LOGIC;
    signal Q: STD_LOGIC;
    signal notQ: STD_LOGIC;

begin

    cell_map: cell port map (X, nLOAD, CLR, CARRY1, CARRY2, DOWN, UP, Clk, Q, notQ);
    
    process
    begin
    
        for x_loop in std_logic range '0' to '1' loop
            for nload_loop in std_logic range '0' to '1' loop
                for clr_loop in std_logic range '0' to '1' loop
                    for carry1_loop in std_logic range '0' to '1' loop
                        for carry2_loop in std_logic range '0' to '1' loop
                            for down_loop in std_logic range '0' to '1' loop
                                for up_loop in std_logic range '0' to '1' loop
                                    for clk_loop in std_logic range '0' to '1' loop
                                        X <= x_loop;
                                        nLOAD <= nload_loop;
                                        CLR <= clr_loop;
                                        CARRY1 <= carry1_loop;
                                        CARRY2 <= carry2_loop;
                                        DOWN <= down_loop;
                                        UP <= up_loop;
                                        Clk <= clk_loop;
                                        wait for 1 ns;
                                    end loop;
                                end loop;
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
        
        wait;
        
    end process;

end Behavioral;
