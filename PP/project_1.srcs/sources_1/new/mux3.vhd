----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:57:22 PM
-- Design Name: 
-- Module Name: mux3 - Behavioral
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

entity mux3 is
		port(
		mux4input1,mux4input2,mux4input3 : in STD_LOGIC_VECTOR(31 downto 0);
		mux4Control : in STD_LOGIC_VECTOR( 1 downto 0);
		mux4output : out STD_LOGIC_VECTOR(31 downto 0)
			);
end mux3;

architecture synth of mux3 is 
begin
	with mux4Control select mux4output <= 
	   	mux4input1 when "00",
	   	mux4input2 when "01",
	   	mux4input3 when "10",
			x"00000000" when others;
end synth;
