library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use std.textio.all;

entity counter_tb_file is
end counter_tb_file;

architecture Behavioral of counter_tb_file is

    component counter is
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
    end component;

    signal CLR: std_logic := '0';
    signal UP: std_logic := '0';
    signal DOWN: std_logic := '0';
    signal nLOAD: std_logic := '1';
    signal X: std_logic_vector (3 downto 0) := "0000";
    signal nCO: STD_LOGIC_VECTOR (1 downto 1);
    signal nBO: STD_LOGIC_VECTOR (1 downto 1);
    signal Q: std_logic_vector (3 downto 0);
    
    constant clk_period : time := 1 ns;
    constant success : string(1 to 2) := "ok";
    constant failed : string(1 to 6) := "failed";

    file file_read : text open read_mode is "D:\university\vhdl\vhdl\lab2\tb\tb.txt";
    file file_read_ethalon : text open read_mode is "D:\university\vhdl\vhdl\lab2\tb\tb_ethalon.txt";
    file file_write : text open write_mode is "D:\university\vhdl\vhdl\lab2\tb\tb_out.txt";
begin

    counter_map: counter port map (CLR, UP, DOWN, nLOAD, X, nCO(1), nBO(1), Q);
    
    process
        variable row, row_ethalon, row_out: line;
        variable v_data_read, v_data_read_ethalon : integer;
    begin
    
        while (not(endfile(file_read))) loop
        
            readline(file_read, row);
            read(row, v_data_read);
            if(v_data_read = 0) then CLR <= '0'; else CLR <= '1'; end if;
            read(row, v_data_read);
            if(v_data_read = 0) then UP <= '0'; else UP <= '1'; end if;
            read(row, v_data_read);
            if(v_data_read = 0) then DOWN <= '0'; else DOWN <= '1'; end if;
            read(row, v_data_read);
            if(v_data_read = 0) then nLOAD <= '0'; else nLOAD <= '1'; end if;
            read(row, v_data_read);
            X <= std_logic_vector(to_unsigned(v_data_read, X'length));
            
            readline(file_read_ethalon, row_ethalon);
            read(row_ethalon, v_data_read_ethalon);
            if (v_data_read_ethalon = to_integer(unsigned(Q))) then
                read(row_ethalon, v_data_read_ethalon);
                if (v_data_read_ethalon = to_integer(unsigned(nCO))) then
                    read(row_ethalon, v_data_read_ethalon);
                    if (v_data_read_ethalon = to_integer(unsigned(nBO))) then
                        write (row_out, success);
                    else
                        write (row_out, failed);
                        report "Expected " & integer'image(v_data_read_ethalon) & ", but found " & integer'image(to_integer(unsigned(nBO))) severity error;
                    end if;
                else
                    write (row_out, failed);
                    report "Expected " & integer'image(v_data_read_ethalon) & ", but found " & integer'image(to_integer(unsigned(nCO))) severity error;
                end if;
            else
                write (row_out, failed);
                report "Expected " & integer'image(v_data_read_ethalon) & ", but found " & integer'image(to_integer(unsigned(Q))) severity error;
            end if;
            writeline (file_write, row_out);
            
            wait for clk_period;
        
        end loop;
    
        wait;
        
    end process;

end Behavioral;
