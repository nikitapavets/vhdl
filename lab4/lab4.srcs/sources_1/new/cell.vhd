library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cell is
    port ( 
        CLOCK: in std_logic;
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
end cell;

architecture Behavioral of cell is

    component jk_trigger is
        port (  
            CLOCK: in std_logic;
            notR: in  STD_LOGIC;
            J: in  STD_LOGIC;
            Clk: in  STD_LOGIC;
            K: in  STD_LOGIC;
            notS: in  STD_LOGIC;
            Q : out STD_LOGIC;
            notQ: out STD_LOGIC
        );
    end component;

    signal notS: STD_LOGIC;
    signal notR: STD_LOGIC;
    signal Jsig: STD_LOGIC;
    signal notQsig: STD_LOGIC;

begin

    JK: jk_trigger port map(CLOCK, notR, Jsig, Clk, not Jsig, notS, Q, notQsig);

    process (CLOCK, X, nLOAD, CLR, CARRY1, notQsig, UP, CARRY2, DOWN)
    begin
        if CLOCK'event and CLOCK = '1' then
        
            notS <= not (X and nLOAD and CLR);
            notR <= ((not X) nand nLOAD) and CLR;
            Jsig <= ((CARRY1 xor (not notQsig)) and UP) or (((not notQsig) xor CARRY2) and DOWN);
            notQ <= notQsig; 
            
        end if;
    end process;

end Behavioral;
