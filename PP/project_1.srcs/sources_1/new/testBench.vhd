
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity testBench is
end testBench;

architecture Behavioral of testBench is
component top 
	port
	(
		clk           : in STD_LOGIC;
		reset         : in STD_LOGIC;
		writedata     : inout STD_LOGIC_VECTOR(31 downto 0);
		dataadr       : inout STD_LOGIC_VECTOR(31 downto 0);
		memwrite      : inout STD_LOGIC
	);
end component;

signal writedata, dataadr: STD_LOGIC_VECTOR(31 downto 0);
signal clk, reset, memwrite: STD_LOGIC;
	
begin
-- instantiate device to be tested
	dut: top port map( 
	                     clk        =>  clk, 
	                     reset      =>  reset, 
	                     writedata  =>  writedata, 
	                     dataadr    =>  dataadr, 
	                     memwrite   =>  memwrite
	                 );
-- Generate clock with 10 ns period
	process begin
		clk <= '1';
			wait for 1 ns;
				clk <= '0';
			wait for	1 ns;
	end process;
-- Generate reset for first two clock cycles
	
	process begin
		reset <= '1';
		wait for 22 ns;
		reset <= '0';
		wait;
		end process;
-- check that 7 gets written to address 84 at end of program
	process(clk) begin
		if ((clk'event and clk = '0' and memwrite = '1')) then
			if (to_integer(unsigned(dataadr)) = 100 and to_integer(unsigned(writedata)) = 200) then
				report "NO ERRORS: Simulation succeeded" severity failure;
		elsif (to_integer(unsigned(dataadr)) /= 80) then
			report "Simulation failed" severity failure;
			end if;
		end if;
	end process;

end Behavioral;





