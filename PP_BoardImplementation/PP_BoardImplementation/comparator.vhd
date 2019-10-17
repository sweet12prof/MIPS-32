----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:53:58 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator is
	port(
			com_i1, com_i2 : in STD_LOGIC_VECTOR(31 downto 0);
			com_o1 : out STD_LOGIC
	 );
end comparator;

architecture Behavioral of comparator is
	component compracctor8 is 
		port(
			com8_i1, com8_i2 : in STD_LOGIC_VECTOR(7 downto 0);
			com8_o1 : out STD_LOGIC
		);
	end component;

signal com8_o  : STD_LOGIC_VECTOR(3 downto 0);
begin
	com8_1 : compracctor8 port map(com_i1(7 downto 0), com_i2(7 downto 0), com8_o(0));
	com8_2 : compracctor8 port map(com_i1(15 downto 8), com_i2(15 downto 8), com8_o(1));
	com8_3 : compracctor8 port map(com_i1(23 downto 16), com_i2(23 downto 16), com8_o(2));
	com8_4 : compracctor8 port map(com_i1(31 downto 24), com_i2(31 downto 24), com8_o(3));
	
	com_o1 <= com8_o(0) and com8_o(1) and com8_o(2) and com8_o(3);
	
end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compracctor8 is 
	port(
			com8_i1, com8_i2 : in STD_LOGIC_VECTOR(7 downto 0);
			com8_o1 : out STD_LOGIC
	);
end compracctor8;
 
architecture behave of  compracctor8 is 

	component compracctor4 is 
		port(
			com4_i1, com4_i2 : in STD_LOGIC_VECTOR(3 downto 0);
			com4_o1 : out STD_LOGIC
		);
	end component;
	
	signal com4_o  : STD_LOGIC_VECTOR(1 downto 0);
	
begin
	com4_1: compracctor4 port map(com8_i1(3 downto 0), com8_i2(3 downto 0), com4_o(0));
	com4_2: compracctor4 port map(com8_i1(7 downto 4), com8_i2(7 downto 4), com4_o(1));
	
	com8_o1 <=  com4_o(0) and com4_o(1);
	
end behave;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compracctor4 is 
	port(
			com4_i1, com4_i2 : in STD_LOGIC_VECTOR(3 downto 0);
			com4_o1 : out STD_LOGIC
	);
end compracctor4;



architecture behave of  compracctor4 is  

component compracctor1 is 
		port(
			com1_i1, com1_i2 : in STD_LOGIC;
			com1_o1 : out STD_LOGIC
		);
end component;
signal com1_o  : STD_LOGIC_VECTOR(3 downto 0);
begin 
	com1_1 :  compracctor1 port map(com4_i1(0), com4_i2(0), com1_o(0));
	com1_2 :  compracctor1 port map(com4_i1(1), com4_i2(1), com1_o(1));
	com1_3 :  compracctor1 port map(com4_i1(2), com4_i2(2), com1_o(2));
	com1_4 :  compracctor1 port map(com4_i1(3), com4_i2(3), com1_o(3));
	
	com4_o1 <=  com1_o(0) and com1_o(1) and com1_o(2) and com1_o(3);
end behave;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compracctor1 is 
		port(
			com1_i1, com1_i2 : in STD_LOGIC;
			com1_o1 : out STD_LOGIC
		);
end compracctor1;

architecture behave of  compracctor1 is 
signal notcom1_i1 : STD_LOGIC;
signal notcom1_i2 : STD_LOGIC;
signal andcom1_i1 : STD_LOGIC;
signal andcom1_i2 : STD_LOGIC;
begin 
	notcom1_i1 <= not com1_i1;
	notcom1_i2 <= not com1_i2;
	
	andcom1_i1 <= notcom1_i1 and notcom1_i2;  
	andcom1_i2 <=  com1_i2 and com1_i1;
	
	
	com1_o1 <=  andcom1_i1 or andcom1_i2;
end behave; 