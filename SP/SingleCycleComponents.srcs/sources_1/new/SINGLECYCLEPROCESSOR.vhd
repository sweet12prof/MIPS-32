----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 02:59:51 PM
-- Design Name: 
-- Module Name: SINGLECYCLEPROCESSOR - Behavioral
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
-------singleCycle
----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SingleCycleProcessor is
	port(
		clk, reset : in std_logic;
		instr : in std_logic_vector(31 downto 0);
		pc, writeData : inout std_logic_vector(31 downto 0);
		ALUout : inout std_logic_vector(31 downto 0);
		readData : in std_logic_vector(31 downto 0);
		memWrite : out std_logic
	);
end SingleCycleProcessor;

architecture Behavioral of SingleCycleProcessor is
	component CU
		port(
				op, funct : in std_logic_vector(5 downto 0);
				zero : in std_logic;
				memWrite, memtoReg : out std_logic;
				regWrite, regDst : out std_logic;
				alusrc, pcSrc : out std_logic;
				jump: out std_logic;
				alucontrol : out std_logic_vector(2 downto 0)	
		);
	end component;
	
	component dataPath
		port(
				clk, reset : in std_logic;
				readData: in std_logic_vector(31 downto 0);
				pc, ALUout, WriteData : inout std_logic_vector(31 downto 0);
				memtoReg : in std_logic;
				regWrite, regDst : in std_logic;
				alusrc, pcSrc : in std_logic;
				jump: in std_logic;
				alucontrol : in std_logic_vector(2 downto 0);
				zero: out std_logic;
				instr : in std_logic_vector(25 downto 0)
		);
	end component;
	
	signal zero : std_logic;
	signal memtoReg,regWrite, regDst, alusrc, pcSrc, jump : std_logic;
	signal alucontrol : std_logic_vector(2 downto 0);

begin
		control : CU port map(
		                           op => instr(31 downto 26), 
		                           funct => instr(5 downto 0),
		                           zero => zero, 
		                           memWrite => memWrite, 
		                           memtoReg => memtoReg,
		                           regWrite => regWrite,
		                           regDst => regDst, 
		                           alusrc => alusrc, 
		                           pcSrc => pcSrc, 
		                           jump => jump, 
		                           alucontrol => alucontrol 	
		                       );
		                       
		                       
		dpath: dataPath port map(
		                           clk => clk, 
		                           reset => reset,
		                           readData => readData,
		                           pc => pc, 
		                           ALUout => ALUout,
		                           WriteData => writeData,
		                           memtoReg => memtoReg,
		                           regWrite => regWrite,
		                           regDst => regDst, 
		                           alusrc => alusrc, 
                                   pcSrc =>pcSrc, 
		                           jump => jump, 
		                           alucontrol => alucontrol, 
		                           zero => zero, 
		                           instr => instr(25 downto 0) 		                           
		                        );

end Behavioral;

