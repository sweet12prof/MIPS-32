library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;


entity xorGate is 
	port 
	(
		xorInput1,xorInput2  : in STD_LOGIC_VECTOR(31 downto 0);
		xorOutput : out STD_LOGIC_VECTOR(31 downto 0)
	);
end xorGate;

architecture synth of xorGate is 
	begin 
		xorOutput <= xorInput1 xor xorInput2;
	end synth;