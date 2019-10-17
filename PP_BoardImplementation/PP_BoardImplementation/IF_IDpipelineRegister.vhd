----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:47:04 PM
-- Design Name: 
-- Module Name: IF_IDpipelineRegister - Behavioral
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
entity IFreg is
	port
	(
		clk, reset, asyncReset, en: in STD_LOGIC;	
		IF_InstrF : in STD_LOGIC_VECTOR( 31 downto 0);
		IF_PCPlus4F : in STD_LOGIC_VECTOR( 31 downto 0);
			
		IF_InstrD : out STD_LOGIC_VECTOR( 31 downto 0);
		IF_PCPlus4D : out STD_LOGIC_VECTOR( 31 downto 0)			
	);
end IFreg;

architecture synth of IFreg is
	begin 
		process(clk, reset, asyncReset) begin
					if reset = '1'   
						then 
							IF_InstrD <= (others => '0');
							IF_PCPlus4D <= (others => '0');
								
								elsif rising_edge(clk) then
									 if asyncReset = '1' then 
										IF_InstrD <= (others => '0');
										IF_PCPlus4D <= (others => '0');
									
								    elsif asyncReset /= '1' then
									if en = '0' then 
										IF_InstrD <= IF_InstrF;
										IF_PCPlus4D <= IF_PCPlus4F;
									end if;
									END IF; 
									end if;
					
	end process;
	end synth;


