----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:32:02 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity ALU is
	port
	(
		ALUinput1,ALUinput2 : in STD_LOGIC_VECTOR(31 downto 0);
		ALUctrl :  in STD_LOGIC_VECTOR(3 downto 0);
		output  : out STD_LOGIC_VECTOR(31 downto 0);
		zero : out std_logic;
		carryOut: out STD_LOGIC
		);
end ALU;

architecture synth of ALU is
-----------------------------------
--2 input multiplexer 
----------------------------------
component mux2 
	port 
		(	
			mux2input1,mux2input2 : in STD_LOGIC_VECTOR(31 downto 0);
			mux2Control : in STD_LOGIC;
			mux2output : out STD_LOGIC_VECTOR(31 downto 0)
		);
end component;
-----------------------------------
--4 input multiplexer 
----------------------------------
component mux4
	port 
	(
		mux4input1,mux4input2,mux4input3, mux4input4 : in STD_LOGIC_VECTOR(31 downto 0);
		mux4Control : in STD_LOGIC_VECTOR( 1 downto 0);
		mux4output : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;
-----------------------------------
--FULL ADDER
----------------------------------
component Adder32 
port (
     Add32i1, Add32i2 : in std_logic_vector(31 downto 0);
		Cin32 : in std_logic;
		Add32Sum : out std_logic_vector(31 downto 0);
		Cout32 : out std_logic
	 );
end component;

-----------------------------------
--and gate
----------------------------------
component andGate
	port 
	(
		andInput1, andInput2 : in STD_LOGIC_VECTOR(31 downto 0);
		andOutput : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;  
-----------------------------------
--or gate
----------------------------------
component orGate
	port 
	(
		orInput1, orInput2 : in STD_LOGIC_VECTOR(31 downto 0);
		orOutput : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;
-----------------------------------
--not gate
----------------------------------
component notGate 
	port
	(
		notInput : in STD_LOGIC_VECTOR(31 downto 0);
		notOutput : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component xorGate 
	port 
	(
		xorInput1,xorInput2  : in STD_LOGIC_VECTOR(31 downto 0);
		xorOutput : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component sllGate 
	port 
	(
		
		shift_amt : in std_logic_vector(4 downto 0);
		shift_in : in std_logic_vector(31 downto 0);
		shift_out : out std_logic_vector(31 downto 0) 
	);
end component;

component srlGate 
	port 
	(
		
		shift_amt : in std_logic_vector(4 downto 0);
		shift_in : in std_logic_vector(31 downto 0);
		shift_out : out std_logic_vector(31 downto 0) 
	);
end component;

component mux7 
	port 
	(
		mux4input1,mux4input2,mux4input3,mux4input4, mux4input5, mux4input6,mux4input7 : in STD_LOGIC_VECTOR(31 downto 0);
		mux4Control : in STD_LOGIC_VECTOR( 2 downto 0);
		mux4output : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

signal postNotgate1, postmux2, postadder, postandGate, postorGate, postxorGate, postsllGate, postsrlGate  : STD_LOGIC_VECTOR(31 downto 0);
signal testNegative : std_logic_vector(31 downto 0);
signal preOutput : std_logic_vector(31 downto 0);
begin
	notGate1 : notGate port map(ALUinput2, postNotgate1);
	mux21 : mux2 port map(ALUinput2, postNotgate1, ALUctrl(3), postmux2);
	adder1 :Adder32 port map(ALUinput1, postmux2, ALUctrl(3),postadder,carryOut);
	testNegative <= "0000000000000000000000000000000" & postadder(31);
	andGate1 : andGate port map(ALUinput1, postmux2,postandGate);
	
	xorGate1: xorGate port map(ALUinput1, postmux2, postxorGate);
	sllGate1: sllGate port map(ALUinput1(10 downto 6),postmux2,postsllGate);
	srlGate1: srlGate port map(ALUinput1(10 downto 6),postmux2, postsrlGate);
	
	
	orGate1 : orGate port map (ALUinput1, postmux2,postorGate);
	preALUoutmux : mux7 port map (postandGate, postorGate, postadder,testNegative, postxorGate, postsllGate, postsrlGate,ALUctrl(2 downto 0), preOutput);
	output <= preOutput;
	
	process(preOutput) begin 
		if preOutput = "00000000000000000000000000000000"
			then zero <= '1';
				else zero <= '0';
		end if;
	end process;
end synth;
