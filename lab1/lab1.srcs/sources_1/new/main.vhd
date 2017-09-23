library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    port ( A : in STD_LOGIC_VECTOR (4 downto 1);
           B : in STD_LOGIC_VECTOR (4 downto 1);
           C0: in STD_LOGIC;
           C4: out STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (4 downto 1));
end main;

architecture Behavioral of main is

    signal tmp: std_logic_vector(21 downto 0);

begin

    tmp(0) <= not C0;
    tmp(1) <= A(1) nor B(1);
    tmp(2) <= A(1) nand B(1);
    tmp(3) <= A(2) nor B(2);
    tmp(4) <= A(2) nand B(2);
    tmp(5) <= A(3) nor B(3);
    tmp(6) <= A(3) nand B(3);
    tmp(7) <= A(4) nor B(4);
    tmp(8) <= A(4) nand B(4);
    
    Z(1) <= C0 xor ( tmp(2) and (not tmp(1)) );
    
    tmp(9) <= tmp(0) and tmp(2);
    tmp(10) <= (not tmp(3)) and tmp(4);
    
    Z(2) <= tmp(10) xor (tmp(1) nor tmp(9));
    
    tmp(11) <= tmp(9) and tmp(4);
    tmp(12) <= tmp(4) and tmp(1);
    tmp(13) <= tmp(6) and (not tmp(5));
    
    Z(3) <= ( not (tmp(11) or tmp(12) or tmp(3)) ) xor tmp(13);
    
    tmp(14) <= tmp(11) and tmp(6);
    tmp(15) <= tmp(12) and tmp(6);
    tmp(16) <= tmp(6) and tmp(3);
    tmp(17) <= tmp(8) and (not tmp(7));
    
    Z(4) <= tmp(17) xor ( not (tmp(14) or tmp(15) or tmp(16) or tmp(5)) );
    
    tmp(18) <= tmp(14) and tmp(8);
    tmp(19) <= tmp(15) and tmp(8);
    tmp(20) <= tmp(6) and tmp(8) and tmp(3);
    tmp(21) <= tmp(8) and tmp(5);
    
    C4 <= not(tmp(18) or tmp(19) or tmp(20) or tmp(21) or tmp(7));

end Behavioral;
