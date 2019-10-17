----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 01:23:22 PM
-- Design Name: 
-- Module Name: 32BitsignExtender - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


-------------------------------------------
----signExt
-----------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity signExt is
	port (
		a : in std_logic_vector(15 downto 0);
		y : out std_logic_vector(31 downto 0)
	);
end signExt;

architecture Behavioral of signExt is

begin
	process(a) begin 
		if(a(15) = '0') then 
			y <= "0000000000000000" & a;
				else 
					y <= "1111111111111111" & a;
		end if;
		
	end process;

end Behavioral;