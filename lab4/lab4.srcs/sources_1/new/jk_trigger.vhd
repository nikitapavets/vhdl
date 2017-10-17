library ieee;
use ieee.std_logic_1164.all;

entity jk_trigger is

    port (  
        CLOCK: in  std_logic;
        notR: in  std_logic;
        J: in  std_logic;
        Clk: in  std_logic;
        K: in  std_logic;
        notS: in  std_logic;
        Q : out std_logic;
        notQ: out std_logic );
            
end jk_trigger;

architecture behaviour of jk_trigger is

  signal Qtmp : std_logic := '0';
  signal notQtmp : std_logic := '1';
  
begin

  Q <= Qtmp;
  notQ <= notQtmp;

  process (CLOCK, Clk, notR, notS)
  begin
    if CLOCK'event and CLOCK = '1' then
        if notR = '0' then
          Qtmp <= '0';
          notQtmp <= '1';
        elsif notS = '0' then
          Qtmp <= '1';
          notQtmp <= '0';
        elsif Clk'event and Clk = '1' then
          if (J = '1') and (K = '0') then
            Qtmp <= '1';
            notQtmp <= '0';
          elsif (J = '0') and (K = '1') then
            Qtmp <= '0';
            notQtmp <= '1';
          elsif (J = '1') and (K = '1') then
            Qtmp <= not Qtmp;
            notQtmp <= not notQtmp;
          end if;
        end if;
    end if;
  end process;

end behaviour;