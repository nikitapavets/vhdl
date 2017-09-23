library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity main_tb is
end main_tb;

architecture Behavioral of main_tb is
    component main is   
        port ( A : in STD_LOGIC_VECTOR (4 downto 1);
               B : in STD_LOGIC_VECTOR (4 downto 1);
               C0: in STD_LOGIC;
               C4: out STD_LOGIC;
               Z : out STD_LOGIC_VECTOR (4 downto 1));
    end component;
    
    component main_mod is   
            port ( A : in STD_LOGIC_VECTOR (4 downto 1);
                   B : in STD_LOGIC_VECTOR (4 downto 1);
                   C0: in STD_LOGIC;
                   C4: out STD_LOGIC;
                   Z : out STD_LOGIC_VECTOR (4 downto 1));
        end component;
    
    signal inC0 : STD_LOGIC;
    signal inA, inB : STD_LOGIC_VECTOR (4 downto 1);
    signal outC4, outC4_mod : STD_LOGIC;
    signal outZ, outZ_mod : STD_LOGIC_VECTOR (4 downto 1);
begin
    main_map: main port map(inA, inB, inC0, outC4, outZ);
    main_mod_map: main_mod port map(inA, inB, inC0, outC4_mod, outZ_mod);
    
    process
    begin
    
        for c0_loop in std_logic range '0' to '1' loop
            for a_loop in 0 to 15 loop
                for b_loop in 0 to 15 loop
                    inC0 <= c0_loop;
                    inA <= std_logic_vector(to_unsigned(a_loop, inA'length));
                    inB <= std_logic_vector(to_unsigned(b_loop, inB'length));
                    wait for 1 ns;
                end loop;
            end loop;
        end loop;
        
    end process;
    
end Behavioral;
