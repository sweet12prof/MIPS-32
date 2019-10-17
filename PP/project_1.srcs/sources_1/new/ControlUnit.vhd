----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:32:02 PM
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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
entity CU is
	port(
		op, funct : in std_logic_vector(5 downto 0);
		equal : in std_logic;
		memWrite, memtoReg : out std_logic;
		regWrite, regDst : out std_logic;
		alusrc : out std_logic;
		jump, branch, shifts,jal, jr: out std_logic;
		pcSrc : out std_logic_vector(3 downto 0);
		alucontrol : out std_logic_vector(3 downto 0);
		haltCPU : out std_logic
		);   
end CU;

architecture Behavioral of CU is
	
	component mainDEC
		port(
			op           : in std_logic_vector(5 downto 0);
			memWrite     : out std_logic;
			memtoReg     : out std_logic;
			regWrite     : out std_logic;
			regDst       : out std_logic;
			alusrc       : out std_logic; 
			branch       : out std_logic;
			ALUOp        : out std_logic_vector(1 downto 0);
			jump         : out std_logic;
			jal          : out std_logic;
			haltCPU      : out std_logic
		   );
	end component;
	
	component aluDEC
		port(
			funct        : in std_logic_vector(5 downto 0);
			ALUOp        : in std_logic_vector(1 downto 0);
			alucontrol   : out std_logic_vector(3 downto 0);
			shifts       : out std_logic;
			jr           : out std_logic
			);
	end component;
   signal branchSig, preSrc, jumpSig,  aludecShifts,jalSig, jrSig, haltCPUsig : std_logic;
	signal ALUopSig : std_logic_vector(1 downto 0);
begin
	md: mainDEC port map(
	                         op       =>  op,
	                         memWrite =>  memWrite,
	                         memtoReg =>  memtoReg,
	                         regWrite =>  regWrite, 
	                         regDst   =>  regDst, 
	                         alusrc   =>  alusrc,
	                         branch   =>  branchSig,
	                         ALUOp    =>  ALUopSig, 
	                         jump     =>  jumpSig, 
	                         jal      =>  jalSig,
	                         haltCPU  =>  haltCPUsig
	                      ); 
	
	ad: aluDEC port map(      
	                          funct      => funct, 
	                          ALUOp      => ALUopSig, 
	                          alucontrol => alucontrol, 
	                          shifts     => aludecShifts, 
	                          jr         => jrSig
	                    );
	
	haltCPU <= haltCPUsig;
	jal <= jalSig;
	preSrc <= branchSig and equal;
	pcSrc <=  jrSig & jalSig & jumpSig & preSrc;
	branch <= branchSig;
	jump <= jumpSig;
	jr <= jrSig;
	shifts <= aludecShifts;
end Behavioral;