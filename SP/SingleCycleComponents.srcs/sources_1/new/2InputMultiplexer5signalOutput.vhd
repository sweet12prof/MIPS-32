----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 02:06:25 PM
-- Design Name: 
-- Module Name: 2InputMultiplexer5signalOutput - Behavioral
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
entity mux2_5  is 
	port(	
			mux2input5_1,mux2input5_2 : in STD_LOGIC_VECTOR(4 downto 0);
			mux2Control5 : in STD_LOGIC;
			mux2output5 : out STD_LOGIC_VECTOR(4 downto 0)		
			);
end mux2_5 ;

architecture synth of mux2_5  is 
begin
    mux2output5  <= mux2input5_2 when mux2Control5 = '1'  else mux2input5_1;
end synth;