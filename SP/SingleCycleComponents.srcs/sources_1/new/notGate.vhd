----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 02:13:10 PM
-- Design Name: 
-- Module Name: notGate - Behavioral
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
entity notGate is 
	port
	(
		notInput : in STD_LOGIC_VECTOR(31 downto 0);
		notOutput : out STD_LOGIC_VECTOR(31 downto 0)
	);
end notGate;

architecture synth of notGate is 
	begin 
			notOutput <= not notInput;
	end synth;
