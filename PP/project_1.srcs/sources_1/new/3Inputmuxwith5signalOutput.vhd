----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:59:39 PM
-- Design Name: 
-- Module Name: 3Inputmuxwith5signalOutput - Behavioral
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
entity mux3_5  is 
	port(	
			mux2input5_1,mux2input5_2, mux2input5_3 : in STD_LOGIC_VECTOR(4 downto 0);
			mux2Control5 : in STD_LOGIC_VECTOR(1 downto 0);
			mux2output5 : out STD_LOGIC_VECTOR(4 downto 0)		
			);
end mux3_5 ;

architecture synth of mux3_5  is 
begin
    with mux2Control5 select mux2output5 <= 
	   	mux2input5_1 when "00",
	   	mux2input5_2 when "01",
	   	mux2input5_3 when "10",
			"00000" when others;
end synth;