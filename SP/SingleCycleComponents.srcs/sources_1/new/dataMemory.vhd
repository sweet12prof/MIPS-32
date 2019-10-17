----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 12:55:53 PM
-- Design Name: 
-- Module Name: dataMemory - Behavioral
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

-------------------------------------
--Data Memory
----------------------------------------
library IEEE; use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity dmem is
    generic(N: integer := 32);
port(
		clk,we: in STD_LOGIC;
		adr: in STD_LOGIC_VECTOR(31 downto 0);
		din: in STD_LOGIC_VECTOR(31 downto 0);
		dout: out STD_LOGIC_VECTOR(31 downto 0)
	  );
end dmem;

architecture synth of dmem is
			type mem_array is array ( 63 downto 0)
					of STD_LOGIC_VECTOR (31 downto 0);
			signal mem: mem_array;
begin
		process(clk, adr) 
		begin
			if rising_edge(clk) 
				then
					if we='1'
						then 
							mem(TO_INTEGER(unsigned(adr(7 downto 2)))) <= din;
				   end if;
			end if;
		end process;
		dout <= mem(TO_INTEGER(unsigned(adr(7 downto 2))));
end synth;


