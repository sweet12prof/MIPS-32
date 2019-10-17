----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 01:25:29 PM
-- Design Name: 
-- Module Name: shiftLeft2 - Behavioral
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

entity sl2 is
	port(
		a : in std_logic_vector(31 downto 0);
		b : out std_logic_vector(31 downto 0)
	);
end sl2;

architecture Behavioral of sl2 is
begin
	b <= a(29 downto 0) & "00";

end Behavioral;
