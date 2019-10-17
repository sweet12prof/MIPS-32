----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 02:29:37 PM
-- Design Name: 
-- Module Name: datapath - Behavioral
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

---------------------------------------------
-----Entity Datapath
---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dataPath is
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
end dataPath;

architecture Behavioral of dataPath is
	component AlU 
		port(
				ALUinput1,ALUinput2 : in STD_LOGIC_VECTOR(31 downto 0);
				ALUctrl :  in STD_LOGIC_VECTOR(2 downto 0);
				output  : out STD_LOGIC_VECTOR(31 downto 0);
				zero : out std_logic;
				carryOut: out STD_LOGIC
			  );
	end component;
	
	component newregFile 
		port(
				clk: in STD_LOGIC;
				we3: in STD_LOGIC;
				ra1, ra2, wa3: in STD_LOGIC_VECTOR(4 downto 0);
				wd3: in STD_LOGIC_VECTOR(31 downto 0);
				rd1, rd2: out STD_LOGIC_VECTOR(31 downto 0)
				);
	end component;
	
	component  Adder32 
		port(
				 Add32i1, Add32i2 : in std_logic_vector(31 downto 0);
				 Cin32 : in std_logic;
				 Add32Sum : out std_logic_vector(31 downto 0);
				 Cout32 : out std_logic
		    );
	end component;
	
	component sl2 
		port(
				a : in std_logic_vector(31 downto 0);
				b : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component signExt
		port(
			a : in std_logic_vector(15 downto 0);
			y : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component PCflopr
		port(
			clk, reset: in STD_LOGIC;
			d: in STD_LOGIC_VECTOR(31 downto 0);
			q: out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;
		
	component mux2 
		port(
			mux2input1,mux2input2 : in STD_LOGIC_VECTOR(31 downto 0);
			mux2Control : in STD_LOGIC;
			mux2output : out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;
	
	-----------------------------------
--2 5_input multiplexer 
----------------------------------
component mux2_5 
	port 
		(	
			mux2input5_1,mux2input5_2 : in STD_LOGIC_VECTOR(4 downto 0);
			mux2Control5 : in STD_LOGIC;
			mux2output5 : out STD_LOGIC_VECTOR(4 downto 0)
		);
end component;

	signal pcJump : std_logic_vector(31 downto 0);
	signal pcplus4 : std_logic_vector(31 downto 0);
	signal PCmux : std_logic_vector(31 downto 0);
	signal signExtOut, signExtOutSl2 : std_logic_vector(31 downto 0);
	signal PCAdd2res : std_logic_vector(31 downto 0);
	signal pcmux1res :  std_logic_vector(31 downto 0);
	--------reg Signals
	signal regWriteAddress : std_logic_vector(4 downto 0);
	signal regDataMuxOut : std_logic_vector(31 downto 0);
	signal srcA : std_logic_vector(31 downto 0);
	-------Alu signals
	signal srcB : std_logic_vector(31 downto 0);
	--signal ALUgrd : std_logic;
begin
		---PC LOGIC
		pcJump <= pcplus4(31 downto 28) & instr(25 downto 0) & "00";
		pcflop : PCflopr port map(
		                              clk => clk, 
		                              reset => reset, 
		                              d => PCmux, 
		                              q => pc
		                          );
		
		pcAdder1 : Adder32 port map (
		                                  Add32i1 => pc, 
		                                  Add32i2 => "00000000000000000000000000000100",
		                                  Cin32 => '0', 
		                                  Add32Sum => pcplus4  
		                             );
		
		immSign : signExt port map(
		                                  a => instr(15 downto 0), 
		                                  y => signExtOut 
		                           );
		
		pcBranchsl2 : sl2 port map(
		                                  a => signExtOut, 
		                                  b => signExtOutSl2
		                           );
		
		pcAdder2 : Adder32 port map(
		                                  Add32i1 => signExtOutSl2, 
		                                  Add32i2 => pcplus4,
		                                  Cin32 => '0', 
		                                  Add32Sum => PCAdd2res 
		                            );
		
		pcbrmux : mux2 port map(
		                                  mux2input1 => pcplus4,
		                                  mux2input2 => PCAdd2res, 
		                                  mux2Control => pcSrc, 
		                                  mux2output => pcmux1res
		                         );
		                         
		pcmux1 : mux2 port map    (
		                                  mux2input1 => pcmux1res, 
		                                  mux2input2 => pcJump, 
		                                  mux2Control =>jump, 
		                                  mux2output => PCmux
		                           );
		
		---Register File Logic
		rf : newregFile port map(
		                                  clk => clk,
		                                  we3 => regWrite, 
		                                  ra1 => instr(25 downto 21), 
		                                  ra2 => instr(20 downto 16),
		                                  wa3 => regWriteAddress, 
		                                  wd3 => regDataMuxOut,
		                                  rd1 => srcA, 
		                                  rd2 => WriteData
		                          );
		
		regwAdrmux : mux2_5 port map(
		                                   mux2input5_1 => instr(20 downto 16), 
		                                   mux2input5_2 => instr(15 downto 11), 
		                                   mux2Control5 => regDst, 
		                                   mux2output5 => regWriteAddress
		                             );
		
		regdatamux : mux2 port map (
		                                 mux2input1 =>  ALUout, 
		                                 mux2input2 =>  readData, 
		                                 mux2Control => memtoReg, 
		                                 mux2output =>  regDataMuxOut 
		                            );
		
		----AlU logic
		AlUinput2mux : mux2 port map(
		                               mux2input1  =>  WriteData, 
		                               mux2input2  =>  signExtOut,
		                               mux2Control => alusrc, 
		                               mux2output  =>  srcB
		                             );
		
		aluini : ALU port map(
		                               ALUinput1 => srcA, 
		                               ALUinput2 => srcB, 
		                               ALUctrl => alucontrol, 
		                               output => ALUout, 
		                               zero => zero, 
		                               carryOut => open 		                           
		                      );
end Behavioral;

