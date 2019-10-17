----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 01:48:04 PM
-- Design Name: 
-- Module Name: regFile - Behavioral
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


--------------------------
----Register File
---------------------------	
library IEEE; 
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity newregfile is -- three-port register file
port(
		clk: in STD_LOGIC;
		we3: in STD_LOGIC;
		ra1, ra2, wa3: in STD_LOGIC_VECTOR(4 downto 0);
		wd3: in STD_LOGIC_VECTOR(31 downto 0);
		rd1, rd2: out STD_LOGIC_VECTOR(31 downto 0)
		);
end newregfile;
architecture behave of newregfile is
		type ramtype is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);	
		signal mem: ramtype;
begin
-- three-ported register file
-- read two ports combinationally
-- write third port on rising edge of clk
-- register 0 hardwired to 0
-- note: for pipelined processor, write third port
-- on falling edge of clk	
	process(clk) begin
			if rising_edge(clk) then
				if we3 = '1' then mem(to_integer(unsigned(wa3))) <= wd3; 
				end if;
			end if;
	end process;
	
	process(ra1, ra2, wa3, mem) begin
		if (to_integer(unsigned(ra1)) = 0) then rd1 <= X"00000000";
-- register 0 holds 0
			else rd1 <= mem(to_integer(unsigned(ra1)));
		end if;
		if (to_integer(unsigned(ra2)) = 0) then rd2 <= X"00000000";
			else rd2 <= mem(to_integer(unsigned(ra2)));
		end if;
	end process;
end behave;