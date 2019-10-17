library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity mux7 is 
	port 
	(
		mux4input1,mux4input2,mux4input3,mux4input4, mux4input5, mux4input6,mux4input7 : in STD_LOGIC_VECTOR(31 downto 0);
		mux4Control : in STD_LOGIC_VECTOR( 2 downto 0);
		mux4output : out STD_LOGIC_VECTOR(31 downto 0)
	);
end mux7;

architecture synth of mux7 is 
begin
	with mux4Control select mux4output <= 
	   	mux4input1 when "000",
	   	mux4input2 when "001",
	   	mux4input3 when "010",
			mux4input4 when "011",
			mux4input5 when "100",
			mux4input6 when "101",
			mux4input7 when "110",
			x"00000000" when others;
end synth;

