----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 03:06:56 PM
-- Design Name: 
-- Module Name: TOPmodule - Behavioral
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
use IEEE.STD_LOGIC_1164.all; use IEEE.NUMERIC_STD.all;
entity top is -- top-level design for testing
		port(
			clk, reset: in STD_LOGIC;
			writedata, dataadr: inout STD_LOGIC_VECTOR(31 downto 0);
			memwrite: inout STD_LOGIC
			);
end top;

architecture test of top is
	component SingleCycleProcessor
			port(
					clk, reset : in std_logic;
					instr : in std_logic_vector(31 downto 0);
					pc, writeData : inout std_logic_vector(31 downto 0);
					ALUout : inout std_logic_vector(31 downto 0);
					readData : in std_logic_vector(31 downto 0);
					memWrite : out std_logic
					);
	end component;

	component  imem is -- instruction memory
		port
		(
			a: in STD_LOGIC_VECTOR(5 downto 0);
			rd: out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;

	component dmem
			port(
					clk,we: in STD_LOGIC;
					adr: in STD_LOGIC_VECTOR(31 downto 0);
					din: in STD_LOGIC_VECTOR(31 downto 0);
					dout: out STD_LOGIC_VECTOR(31 downto 0)
					);
	end component;
		
		signal pc, instr,readdata: STD_LOGIC_VECTOR(31 downto 0);
begin
-- instantiate processor and memories
			mips1: SingleCycleProcessor port map(    
			                                         clk => clk, 
			                                         reset => reset, 
			                                         instr => instr,
			                                         pc => pc,
			                                         writeData => writedata, 
			                                         ALUout => dataadr,
			                                         readData => readdata, 
			                                         memWrite => memwrite 			                                         
			                                     );
			
			imem1: imem port map             
			                     (
			                        a => pc(7 downto 2), 
			                        rd => instr
			                      );
			                      
			dmem1: dmem port map(
			                       clk => clk, 
			                       we => memwrite, 
			                       adr => dataadr,
			                       din => writedata, 
			                       dout => readdata
			                     );
end;