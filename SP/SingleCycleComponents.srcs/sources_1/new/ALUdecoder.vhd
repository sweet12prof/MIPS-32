----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 02:54:36 PM
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
			alucontrol : out std_logic_vector(2 downto 0)
		  );
end aluDEC;

architecture synth of aluDEC is 
begin 
	process(ALUOp, funct) begin
		case aluop is
			when "00" => alucontrol <= "010"; -- add (for 1w/sw/addi)
			when "01" => alucontrol <= "110"; -- sub (for beq)
			when others => case funct is -- R-type instructions
					when "100000" => alucontrol <= "010"; -- add
					when "100010" => alucontrol <= "110"; -- sub
					when "100100" => alucontrol <= "000"; -- and
					when "100101" => alucontrol <= "001"; -- or
					when "101010" => alucontrol <= "111"; -- slt
					when others => alucontrol <= "---"; -- ???
			end case;
		end case;
	end process;
end synth;
