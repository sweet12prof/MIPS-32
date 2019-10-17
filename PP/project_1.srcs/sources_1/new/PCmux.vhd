library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity PCMUX is 
	port 
	(
		mux4input1,mux4input2,mux4input3,mux4input4, mux4input5: in STD_LOGIC_VECTOR(31 downto 0);
		mux4Control : in STD_LOGIC_VECTOR( 3 downto 0);
		mux4output : out STD_LOGIC_VECTOR(31 downto 0)
	);
end PCMUX;

architecture synth of PCMUX is 
begin
	with mux4Control select mux4output <= 
	   	mux4input1 when "0000",
	   	mux4input2 when "0001",
	   	mux4input3 when "0010",
			mux4input4 when "0100",
			mux4input5 when "1000",
			x"00000000" when others;
		
end synth;