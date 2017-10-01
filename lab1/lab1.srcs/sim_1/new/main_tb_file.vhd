library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use std.textio.all;

entity main_tb_file is
end main_tb_file;

architecture Behavioral of main_tb_file is
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
    signal outC4 : STD_LOGIC_VECTOR (1 downto 1);
    signal outZ : STD_LOGIC_VECTOR (4 downto 1);
    
    constant success : string(1 to 2) := "ok";
    constant failed : string(1 to 6) := "failed";
    
    file file_read : text open read_mode is "D:\university\vhdl\vhdl\lab1\tb\tb.txt";
    file file_read_ethalon : text open read_mode is "D:\university\vhdl\vhdl\lab1\tb\tb_ethalon.txt";
    file file_write : text open write_mode is "D:\university\vhdl\vhdl\lab1\tb\tb_out.txt";
begin
    main_map: main port map(inA, inB, inC0(1), outC4(1), outZ);
  
    process
        variable row, row_ethalon, row_out, row_out_mod : line;
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
                  
                    readline(file_read_ethalon, row_ethalon);
                    read(row_ethalon, v_data_read_ethalon);
                    if (v_data_read_ethalon = to_integer(unsigned(outZ))) then
                        read(row_ethalon, v_data_read_ethalon);
                        if (v_data_read_ethalon = to_integer(unsigned(outC4))) then
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
