library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity  srlGate  is
	port
	(
		shift_amt : in std_logic_vector(4 downto 0);
		shift_in : in std_logic_vector(31 downto 0);
		
		shift_out : out std_logic_vector(31 downto 0) 
	 );
end  srlGate;

architecture Behavioral of  srlGate is
signal controls : std_logic_vector(31 downto 0); 
begin
--     process (shift_amt) begin 
--		case shift_amt is
--			when "00000" => controls <= shift_in(31 downto 0);
--			when "00001" => controls <= '0' & shift_in(31 downto 1);
--			when "00010" => controls <= "00" & shift_in(31 downto 2);
--			when "00011" => controls <= "000" & shift_in(31 downto 3);
--			when "00100" => controls <= "0000" & shift_in(31 downto 4);
--			when "00101" => controls <= "00000" & shift_in(31 downto 5);
--			when "00110" => controls <= "000000" & shift_in(31 downto 6);
--			when "00111" => controls <= "0000000" & shift_in(31 downto 7);
--			when others => controls <= shift_in(31 downto 0);
--		end case; 
--	 end process; --sll to_integer(unsigned(shift_amt));
--	 shift_out  <= controls;

 with shift_amt select shift_out <=
	           shift_in when "00000",
	           "0"                               & shift_in(31 downto 1) when "00001",
	           "00"                             & shift_in(31  downto 2) when  "00010", 
	           "000"                            & shift_in(31  downto 3) when  "00011", 
	           "0000"                           & shift_in(31  downto 4) when  "00100", 
	           "00000"                          & shift_in(31  downto 5) when  "00101", 
	           "000000"                         & shift_in(31  downto 6) when  "00110", 
	           "0000000"                        & shift_in(31  downto 7) when  "00111", 
	           "00000000"                       & shift_in(31  downto 8) when  "01000", 
	           "000000000"                      & shift_in(31  downto 9) when  "01001", 
	           "0000000000"                     & shift_in(31  downto 10) when  "01010", 
	           "00000000000"                    & shift_in(31  downto 11) when  "01011", 
	           "000000000000"                   & shift_in(31  downto 12) when  "01100", 
	           "0000000000000"                  & shift_in(31  downto 13) when  "01101", 
	           "00000000000000"                 & shift_in(31  downto 14) when  "01110", 
	           "000000000000000"                & shift_in(31  downto 15) when  "01111", 
	           "0000000000000000"               & shift_in(31  downto 16) when  "10000", 
               "00000000000000000"              & shift_in(31  downto 17) when "10001", 
	           "000000000000000000"             & shift_in(31  downto 18) when  "10010", 
	           "0000000000000000000"            & shift_in(31  downto 19) when  "10011", 
	           "00000000000000000000"           & shift_in(31  downto 20) when  "10100", 
	           "000000000000000000000"          & shift_in(31  downto 21) when  "10101", 
	           "0000000000000000000000"         & shift_in(31  downto 22) when  "10110", 
	           "00000000000000000000000"        & shift_in(31 downto 23)  when  "10111", 
	           "000000000000000000000000"       & shift_in(31 downto 24)  when  "11000", 
	           "0000000000000000000000000"      & shift_in(31 downto 25)  when  "11001", 
	           "00000000000000000000000000"     & shift_in(31 downto 26)  when  "11010", 
	           "000000000000000000000000000"    & shift_in(31 downto 27)  when  "11011", 
	           "0000000000000000000000000000"    & shift_in(31 downto 28)  when "11100",  
	           "00000000000000000000000000000"   & shift_in(31 downto 29)  when "11101",  
	           "000000000000000000000000000000"  & shift_in(31 downto 30)  when "11110",  
	           "0000000000000000000000000000000" & shift_in(31)  when "11111",
	            ( others => '0') when others;
	            end Behavioral;

