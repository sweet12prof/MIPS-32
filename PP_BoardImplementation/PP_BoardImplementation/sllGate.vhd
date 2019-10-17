library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity  sllGate  is
	port
	(
		shift_amt : in std_logic_vector(4 downto 0);
		shift_in : in std_logic_vector(31 downto 0);
		
		shift_out : out std_logic_vector(31 downto 0) 
	 );
end  sllGate;
architecture Behavioral of  sllGate  is
signal controls : std_logic_vector(31 downto 0); 
begin
--    process (shift_amt) begin 
--		case shift_amt is
--			when "00000" => controls <= shift_in(31 downto 0);
--			when "00001" => controls <= shift_in(30 downto 0) & '0';
--			when "00010" => controls <= shift_in(29 downto 0) & "00";
--			when "00011" => controls <= shift_in(28 downto 0) & "000";
--			when "00100" => controls <= shift_in(27 downto 0) & "0000";
--			when "00101" => controls <= shift_in(26 downto 0) & "00000";
--			when "00110" => controls <= shift_in(25 downto 0) & "000000";
--			when "00111" => controls <= shift_in(24 downto 0) & "0000000";
--			when others => controls <= shift_in(31 downto 0);
--		end case; 
--	 end process; --sll to_integer(unsigned(shift_amt));
--	 shift_out  <= controls;
	 
	 
	 
	 with shift_amt select shift_out <=
	           shift_in(31 downto 0)                                       when "00000",
	           shift_in(30 downto 0) & "0"                                 when "00001",
	           shift_in(29 downto 0) & "00"                                when "00010",
	           shift_in(28 downto 0) & "000"                               when "00011",
	           shift_in(27 downto 0) & "0000"                              when "00100",
	           shift_in(26 downto 0) & "00000"                             when "00101",
	           shift_in(25 downto 0) & "000000"                            when "00110",
	           shift_in(24 downto 0) & "0000000"                           when "00111",
	           shift_in(23 downto 0) & "00000000"                          when "01000",
	           shift_in(22 downto 0) & "000000000"                         when "01001",
	           shift_in(21 downto 0) & "0000000000"                        when "01010",
	           shift_in(20 downto 0) & "00000000000"                       when "01011",
	           shift_in(19 downto 0) & "000000000000"                      when "01100",
	           shift_in(18 downto 0) & "0000000000000"                     when "01101",
	           shift_in(17 downto 0) & "00000000000000"                    when "01110",
	           shift_in(16 downto 0) & "000000000000000"                   when "01111",
               shift_in(15 downto 0) & "0000000000000000"                  when "10000",
	           shift_in(14 downto 0) & "00000000000000000"                 when "10001",
	           shift_in(13 downto 0) & "000000000000000000"                when "10010",
	           shift_in(12 downto 0) & "0000000000000000000"               when "10011",
	           shift_in(11 downto 0) & "00000000000000000000"              when "10100",
	           shift_in(10 downto 0) & "000000000000000000000"             when "10101",
	           shift_in(9 downto 0) &  "0000000000000000000000"            when "10110",
	           shift_in(8 downto 0) &  "00000000000000000000000"           when "10111",
	           shift_in(7 downto 0) &  "000000000000000000000000"          when "11000",
	           shift_in(6 downto 0) &  "0000000000000000000000000"         when "11001",
	           shift_in(5 downto 0) &  "00000000000000000000000000"        when "11010",
	           shift_in(4 downto 0) &  "000000000000000000000000000"       when "11011",
	           shift_in(3 downto 0) &  "0000000000000000000000000000"      when "11100",
	           shift_in(2 downto 0) &  "00000000000000000000000000000"     when "11101",
	           shift_in(1 downto 0) &  "000000000000000000000000000000"    when "11110",
	           shift_in(0)          &  "0000000000000000000000000000000"    when "11111",             	           
               ( others => '0') when others;   
	           
	           
	           
	           
end Behavioral;