library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
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
end counter;

architecture Behavioral of counter is

    component cell is
        port (  
            X : in std_logic;
            nLOAD: in std_logic;
            CLR: in std_logic;
            CARRY1: in std_logic;
            CARRY2: in std_logic;
            DOWN: in std_logic;
            UP: in std_logic;
            Clk: in std_logic;
            Q: out std_logic;
            notQ: out std_logic
        );
    end component;
    
    component jk_trigger is
        port (  
            notR: in  STD_LOGIC;
            J: in  STD_LOGIC;
            Clk: in  STD_LOGIC;
            K: in  STD_LOGIC;
            notS: in  STD_LOGIC;
            Q : out STD_LOGIC;
            notQ: out STD_LOGIC
        );
    end component;

    signal nextUP : std_logic;
    signal nextDOWN : std_logic;
    signal notQ: std_logic_vector (3 downto 0);
    
    signal temporal: STD_LOGIC;
    signal UP_DIV: STD_LOGIC;
    signal DOWN_DIV: STD_LOGIC;
    signal counter : integer range 0 to 45000000 := 0;

begin

    frequency_divider: process (UP) begin
        if rising_edge(UP) then
            if (counter = 45000000) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    process (DOWN, temporal)
    begin
        if DOWN = '1' then
            UP_DIV <= temporal;
            DOWN_DIV <= '1';
        else
            UP_DIV <= '1';
            DOWN_DIV <= temporal;
        end if;
    end process;
    

    up_down: jk_trigger port map(
        notR => DOWN_DIV,
        J => '0',
        Clk => '0',
        K => '0',
        notS => UP_DIV,
        Q => nextUP,
        notQ => nextDOWN
    );
    
    qA: jk_trigger port map(
        notR => ((not X(0)) nand (not nLOAD)) and (not CLR),
        J => notQ(0),
        Clk => DOWN_DIV nand UP_DIV,
        K => not notQ(0),
        notS => not (X(0) and (not CLR) and (not nLOAD)),
        Q => Q(0),
        notQ => notQ(0)
    );
    
    cellB: cell port map(
        X => X(1),
        nLOAD => not nLOAD,
        CLR => not CLR,
        CARRY1 => not notQ(0),
        CARRY2 => notQ(0),
        DOWN => nextDOWN,
        UP => nextUP,
        Clk => DOWN_DIV nand UP_DIV,
        Q => Q(1),
        notQ => notQ(1)
    );
    
    cellC: cell port map(
        X => X(2),
        nLOAD => not nLOAD,
        CLR => not CLR,
        CARRY1 => (not notQ(0)) and (not notQ(1)),
        CARRY2 => notQ(0) and notQ(1),
        DOWN => nextDOWN,
        UP => nextUP,
        Clk => DOWN_DIV nand UP_DIV,
        Q => Q(2),
        notQ => notQ(2)
    );
        
    cellD: cell port map(
        X => X(3),
        nLOAD => not nLOAD,
        CLR => not CLR,
        CARRY1 => (not notQ(0)) and (not notQ(1)) and (not notQ(2)),
        CARRY2 => notQ(0) and notQ(1) and notQ(2),
        DOWN => nextDOWN,
        UP => nextUP,
        Clk => DOWN_DIV nand UP_DIV,
        Q => Q(3),
        notQ => notQ(3)
    );
    
    nCO <= not ((not notQ(0)) and (not notQ(1)) and (not notQ(2)) and (not notQ(3)) and (not UP_DIV));
    nBO <= not (notQ(0) and notQ(1) and notQ(2) and notQ(3) and (not DOWN_DIV));

end Behavioral;
