----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2019 12:54:35 PM
-- Design Name: 
-- Module Name: instructionMemory - Behavioral
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
	entity imem is
		port(
				a: in STD_LOGIC_VECTOR(5 downto 0);
				rd: out STD_LOGIC_VECTOR(31 downto 0)
		);
	end imem;
architecture synth of imem is
signal dout : STD_LOGIC_VECTOR(31 downto 0);
begin
	rd <= dout;
	process(a) begin
		case a is
				when "000000" => dout <= x"20020005"; --
				when "000001" => dout <= x"2003000c";--
				when "000010" => dout <= x"2067fff7";--
				when "000011" => dout <= x"00e22025";-- 
				when "000100" => dout <= x"00642824";---
				when "000101" => dout <= x"00a42820"; ---
				when "000110" => dout <= x"10a7000a";--x"ac020018";-- 
				when "000111" => dout <= x"0064202a";---x"00000000";---
   			when "001000" => dout <= x"10800001";---x"00000000";--- 
    			when "001001" => dout <= x"20050000";--x"00000000";---
				when "001010" => dout <= x"00e2202a";--x"00000000";---
				when "001011" => dout <= x"00853820";--x"00000000";---
				when "001100" => dout <= x"00e23822";--x"00000000";--- 
				when "001101" => dout <= x"ac670044";-- x"00000000";---
				when "001110" => dout <= x"8c020050";--- x"00000000";---
				when "001111" => dout <= x"08000011";---x"00000000";---
				when "010000" => dout <= x"20020001";--x"00000000";--
				when "010001" => dout <= x"ac020054";--x"00000000"; 
				when  others => dout <=  x"00000000";
				
				
--				when "000000" => dout <= x"2002000a"; --x"20020005";
--				when "000001" => dout <= x"20030064";--x"2003000c";
--				when "000010" => dout <= x"2004000a";--x"2067fff7";
--				when "000011" => dout <= x"00441020";-- x"00e22025";
--				when "000100" => dout <= x"10430001";---x"00642824";
--				when "000101" => dout <= x"08100003"; ---x"00a42820";
--				when "000110" => dout <= x"ac020018";-- x"10a7000a";
--				when "000111" => dout <= x"00000000";---x"0064202a";
--				when "001000" => dout <= x"00000000";--- x"10800001";
--				when "001001" => dout <= x"00000000";---x"20050000";
--				when "001010" => dout <= x"00000000";---x"00e2202a";
--				when "001011" => dout <= x"00000000";---x"00853820";
--				when "001100" => dout <= x"00000000";--- x"00e23822";
--				when "001101" => dout <= x"00000000";---x"ac670044";
--				when "001110" => dout <= x"00000000";---x"8c020050";
--				when "001111" => dout <= x"00000000";---x"08000011";
--				when "010000" => dout <= x"00000000";---x"20020001";
--				when "010001" => dout <= x"00000000";--x"ac020054";
--				when  others => dout <=  x"00000000";
end case;
end process;
end;


-----------------------------------------
-----
-----------------------------------------
--library IEEE;
--use IEEE.STD_LOGIC_1164.all; use STD.TEXTIO.all;
--use IEEE.NUMERIC_STD.all;
--
--entity imem is -- instruction memory
--	port
--		(
--			a: in STD_LOGIC_VECTOR(5 downto 0);
--			rd: out STD_LOGIC_VECTOR(31 downto 0)
--		);
--end;
--architecture behave of imem is
--	begin
--		process is
--			file mem_file: TEXT;
--			variable L: line;
--			variable ch: character;
--			variable i, index, result: integer;
--			type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
--			variable mem: ramtype;
--				begin
---- initialize memory from file
--					for i in 0 to 63 loop -- set all contents low
--						mem(i) := (others => '0');
--					end loop;
--					
--					index := 0;
--					FILE_OPEN (mem_file, "C:/Users/chris/Documents/VHDL/PROJECT/PROJECT/FINAL/SINGLE CYCLE/ExternalMemories/memory/memfile.txt", READ_MODE);
--					
--					while not endfile(mem_file) loop
--							readline(mem_file, L);
--							result := 0;
--						for i in 1 to 8 loop
--							read (L, ch);
--							if '0' <= ch and ch <= '9' then
--								result := character'pos(ch) - character'pos('0');
--								elsif 'a' <= ch and ch <= 'f' then
--									result := character'pos(ch) - character'pos('a')+10;
--								else report "Format error on line" & integer' image(index) severity error;
--							end if;
--							
--							mem(index)(35-i*4 downto 32-i*4) := std_logic_vector(to_unsigned(result,4));
--						end loop;
--
--						index := index + 1;
--						end loop;
--					
--					-- read memory
--					loop
--						rd <= mem(to_integer(unsigned(a)));
--						wait on a;
--					end loop;
--	end process;
--end;


