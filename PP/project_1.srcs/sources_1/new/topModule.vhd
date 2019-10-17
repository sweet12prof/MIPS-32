----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 03:05:02 PM
-- Design Name: 
-- Module Name: topModule - Behavioral
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


entity top is
   port
	(
		------------For TestBench --------------------
		clk, reset: in STD_LOGIC;
		writedata, dataadr: out STD_LOGIC_VECTOR(31 downto 0);
		memwrite: out STD_LOGIC
	);
end top;

architecture Behavioral of top is

component pipeLinedProcessor
	port 
	(
		clk, reset: in STD_LOGIC;
		pc: out STD_LOGIC_VECTOR(31 downto 0);
		instr: in STD_LOGIC_VECTOR(31 downto 0);
		memwrite: out STD_LOGIC;
		aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0);
		readdata: in STD_LOGIC_VECTOR(31 downto 0)
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

component imem is -- instruction memory
	port
		(
			a: in STD_LOGIC_VECTOR(5 downto 0);
			rd: out STD_LOGIC_VECTOR(31 downto 0)
		);
end component;

signal pc, instr,readdata, dataadrSignal, writeDataSignal : STD_LOGIC_VECTOR(31 downto 0);
signal memWriteSignal : std_logic;
begin

pipe : pipeLinedProcessor port map(clk, reset, pc, instr, memWriteSignal, dataadrSignal,  writeDataSignal, readData);
imem1: imem port map(pc(7 downto 2), instr);
dmem1: dmem port map(clk, memWriteSignal, dataadrSignal, writedataSignal, readData);

memwrite <=  memWriteSignal;
dataadr <= dataadrSignal;
writedata <= writedataSignal;

--pipe : pipeLinedProcessor port map(clk, reset, pc, instr, memWrite, dataadr,  writeData, readData);
end Behavioral;
