library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use std.textio.all;

entity main_tb_file_mod is
end main_tb_file_mod;

architecture Behavioral of main_tb_file_mod is
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
    
    signal inC0 : STD_LOGIC_VECTOR (1 downto 1);
    signal inA, inB : STD_LOGIC_VECTOR (4 downto 1);
    signal outC4, outC4_mod : STD_LOGIC_VECTOR (1 downto 1);
    signal outZ, outZ_mod : STD_LOGIC_VECTOR (4 downto 1);
    
    constant success : string(1 to 2) := "ok";
    constant failed : string(1 to 6) := "failed";
    
    file file_read : text open read_mode is "D:\university\vhdl\vhdl\lab1\tb\tb.txt";
    file file_write : text open write_mode is "D:\university\vhdl\vhdl\lab1\tb\tb_out_mod.txt";
begin
    main_map: main port map(inA, inB, inC0(1), outC4(1), outZ);
    main_mod_map: main_mod port map(inA, inB, inC0(1), outC4_mod(1), outZ_mod);
  
    process
        variable row, row_ethalon, row_out : line;
        variable v_data_read, v_data_read_ethalon : integer;
    begin

        for c0_loop in 0 to 1 loop
            for a_loop in 0 to 15 loop
                for b_loop in 0 to 15 loop
                    
                    readline(file_read, row);
                    read(row, v_data_read);
                    inC0 <= std_logic_vector(to_unsigned(v_data_read, inC0'length));
                    read(row, v_data_read);
                    inA <= std_logic_vector(to_unsigned(v_data_read, inA'length));
                    read(row, v_data_read);
                    inB <= std_logic_vector(to_unsigned(v_data_read, inB'length));
                    
                    if (to_integer(unsigned(outZ_mod)) = to_integer(unsigned(outZ))) then
                        if (to_integer(unsigned(outC4_mod)) = to_integer(unsigned(outC4))) then
                            write (row_out, success);
                        else
                            write (row_out, failed);
                        end if;
                    else
                        write (row_out, failed);
                    end if;
                    
                    writeline (file_write, row_out);
          
                    wait for 1 ns;
                    
                end loop;
            end loop;
        end loop;
        
        wait;
        
    end process;
end Behavioral;
