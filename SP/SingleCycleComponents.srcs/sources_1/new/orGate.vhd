----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 02:17:57 PM
-- Design Name: 
-- Module Name: orGate - Behavioral
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
entity orGate is
	port 
	(
		orInput1, orInput2 : in STD_LOGIC_VECTOR(31 downto 0);
		orOutput : out STD_LOGIC_VECTOR(31 downto 0)
	);
end orGate; 

architecture synth of orGate is 
	begin 
		orOutput <= orInput1 or orInput2;
	end synth;

