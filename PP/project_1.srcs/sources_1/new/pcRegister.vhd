----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 03:01:24 PM
-- Design Name: 
-- Module Name: pcRegister - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flopr is
		port(
				clk, reset, en: in STD_LOGIC;
				d: in STD_LOGIC_VECTOR(31 downto 0);
				q: out STD_LOGIC_VECTOR(31 downto 0)
			  );
end flopr;

architecture Behavioral of flopr is

begin
process(clk, reset) begin
					if reset = '1' then q <= (others => '0');
						elsif rising_edge(clk) then
							if en = '0' then 
								q <= d;
							end if;
					end if;
	end process;

end Behavioral;

