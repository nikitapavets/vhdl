library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity main_mod is
    port ( A : in std_logic_vector(4 downto 1);
           B : in std_logic_vector(4 downto 1);
           C0: in std_logic;
           C4: out std_logic;
           Z : out std_logic_vector(4 downto 1));
end main_mod;

architecture Behavioral of main_mod is

    signal h_sum              : std_logic_vector(4 downto 1);
    signal carry_generate     : std_logic_vector(4 downto 1);
    signal carry_propagate    : std_logic_vector(4 downto 1);
    signal carry_in_internal  : std_logic_vector(4 downto 2);

begin

    h_sum <= A xor B;
    carry_generate <= A and B;
    carry_propagate <= A or B;
    
    process(carry_generate,carry_propagate,carry_in_internal)
    begin
        
        carry_in_internal(2) <= carry_generate(1) or (carry_propagate(1) and C0);
        for i in 2 to 3 loop
            carry_in_internal(i+1) <= carry_generate(i) or (carry_propagate(i) and carry_in_internal(i));
        end loop;
        C4 <= carry_generate(4) or (carry_propagate(4) and carry_in_internal(4));
        
    end process;
    
    Z(1) <= h_sum(1) XOR C0;
    Z(4 downto 2) <= h_sum(4 downto 2) xor carry_in_internal(4 downto 2);

end Behavioral;
