----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:39:58 PM
-- Design Name: 
-- Module Name: andGate - Behavioral
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
entity andGate is
	port 
	(
		andInput1, andInput2 : in STD_LOGIC_VECTOR(31 downto 0);
		andOutput : out STD_LOGIC_VECTOR(31 downto 0)
	);
end andGate; 

architecture synth of andGate is 
begin 
		andOutput  <= andInput1  and andInput2;
end synth;
