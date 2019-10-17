----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 12:58:33 PM
-- Design Name: 
-- Module Name: PC register - Behavioral
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


library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity PCflopr is -- flip-flop with synchronous reset
--generic (width: integer);
		port(
				clk, reset: in STD_LOGIC;
				d: in STD_LOGIC_VECTOR(31 downto 0);
				q: out STD_LOGIC_VECTOR(31 downto 0)
			  );
end PCflopr;
architecture synchronous of PCflopr is
begin
			process(clk, reset) begin
					if reset = '1' then q <= (others => '0');
						elsif rising_edge(clk) then
							q <= d;
					end if;
			end process;
end synchronous;