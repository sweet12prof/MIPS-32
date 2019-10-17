library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity notGate is 
	port
	(
		notInput : in STD_LOGIC_VECTOR(31 downto 0);
		notOutput : out STD_LOGIC_VECTOR(31 downto 0)
	);
end notGate;

architecture synth of notGate is 
	begin 
			notOutput <= not notInput;
	end synth;
