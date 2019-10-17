----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 01:34:23 PM
-- Design Name: 
-- Module Name: 4InputMultiplexer - Behavioral
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


-----------------------------------
--4 input multiplexer Implementation
----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity mux4 is 
	port 
	(
		mux4input1,mux4input2,mux4input3,mux4input4: in STD_LOGIC_VECTOR(31 downto 0);
		mux4Control : in STD_LOGIC_VECTOR( 1 downto 0);
		mux4output : out STD_LOGIC_VECTOR(31 downto 0)
	);
end mux4;

architecture synth of mux4 is 
begin
	with mux4Control select mux4output <= 
	   	mux4input1 when "00",
	   	mux4input2 when "01",
	   	mux4input3 when "10",
	    mux4input4 when others;
					
end synth;