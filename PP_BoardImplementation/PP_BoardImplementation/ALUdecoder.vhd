----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:32:02 PM
-- Design Name: 
-- Module Name: ALUdecoder - Behavioral
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
entity aluDEC is 
	port(
			funct : in std_logic_vector(5 downto 0);
			ALUOp : in std_logic_vector(1 downto 0);
			alucontrol : out std_logic_vector(3 downto 0);
			shifts, jr : out std_logic
		  );
end aluDEC;

architecture synth of aluDEC is 
signal control: STD_LOGIC_VECTOR(5 downto 0);
begin 
	process(ALUOp, funct) begin
		case aluop is
			when "00" => control <= "000010"; -- add (for 1w/sw/addi)
			when "01" => control <= "001010"; -- sub (for beq)
			when others => case funct is -- R-type instructions
					when "100000" => control <= "000010"; -- add
					when "100010" => control <= "001010"; -- sub
					when "100100" => control <= "000000"; -- and
					when "100101" => control <= "000001"; -- or
					when "101010" => control <= "001011"; -- slt
					when "100110" => control <= "000100"; -- xor
					when "000000" => control <= "010101"; -- sll
					when "000010"  =>control <= "010110"; --srl
					when "001000" =>control <=  "100000"; --jr
					when others =>   control <= "00----"; -- ???
			end case;
		end case;
	end process;
	alucontrol <= control(3 downto 0);
	shifts <= control(4);
	jr <= control(5);
end synth;
