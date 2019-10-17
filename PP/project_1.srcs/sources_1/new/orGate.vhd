library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity orGate is
	port 
	(
		orInput1, orInput2 : in STD_LOGIC_VECTOR(31 downto 0);
		orOutput : out STD_LOGIC_VECTOR(31 downto 0)
	);
end orGate; 

architecture synth of orGate is 
	begin 
		orOutput <= orInput1 or orInput2;
	end synth;