----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:32:02 PM
-- Design Name: 
-- Module Name: mainDecoder - Behavioral
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
entity  mainDEC is 
	port(
			op : in std_logic_vector(5 downto 0);
			memWrite, memtoReg : out std_logic;
			regWrite, regDst : out std_logic;
			alusrc, branch : out std_logic;
			ALUOp : out std_logic_vector(1 downto 0);
			jump, jal: out std_logic;
			haltCPU : out std_logic
	);
end mainDEC;

architecture synth of mainDEC is 
	signal controls: STD_LOGIC_VECTOR(10 downto 0);
begin 
	process(op) begin
		case op is 
			when "000000" => controls <= "00110000010"; -- RTYPE
			when "100011" => controls <= "00101001000"; -- LW
			when "101011" => controls <= "00001010000"; -- SW
			when "000100" => controls <= "00000100001"; -- BEQ
			when "001000" => controls <= "00101000000"; -- ADDI
			when "000010" => controls <= "00000000100"; -- J
			when "000011" => controls <= "01100000000"; -- Jal
			when "111111" => controls <= "10000000000";
			when others => controls <= "-----------"; -- illegal op 
		end case;
	end process;
 --	(regWrite, regDst, alusrc, branch, memWrite, memtoReg, jump, ALUOp(1 downto 0)) <= controls;
 haltCPU <= controls(10) when op ="111111" else '0';
 jal <= controls(9);
 regWrite <= controls(8);
 regDst <= controls(7);
 alusrc <= controls(6);
 branch <= controls(5);
 memWrite <= controls(4);
 memtoReg <= controls(3);
 jump <= controls(2);
 ALUOp <= controls (1 downto 0);
end synth;
