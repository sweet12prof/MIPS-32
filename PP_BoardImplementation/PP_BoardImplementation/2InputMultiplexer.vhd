----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 01:27:49 PM
-- Design Name: 
-- Module Name: 2InputMultiplexer - Behavioral
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
entity mux2 is 
	port(	
			mux2input1,mux2input2 : in STD_LOGIC_VECTOR(31 downto 0);
			mux2Control : in STD_LOGIC;
			mux2output : out STD_LOGIC_VECTOR(31 downto 0)
		);
end mux2;

architecture synth of mux2 is 
begin
    mux2output <= mux2input2 when mux2Control = '1'  else mux2input1;
end synth;
