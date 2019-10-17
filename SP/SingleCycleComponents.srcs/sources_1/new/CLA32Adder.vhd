library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Adder32 is
	port(
		Add32i1, Add32i2 : in std_logic_vector(31 downto 0);
		Cin32 : in std_logic;
		Add32Sum : out std_logic_vector(31 downto 0);
		Cout32 : out std_logic
	);
end Adder32;

architecture Behavioral of Adder32 is
	component Adder8
		port(
				Add8i1, Add8i2 : in std_logic_vector(7 downto 0);
				Cin8 : in std_logic;
				Cout8 : out std_logic;
				Add8Sum : out std_logic_vector(7 downto 0)		
			 );
	end component  Adder8;
	
signal Cin8s :  std_logic_vector(3 downto 0);
signal sum32 : std_logic_vector(31 downto 0);

begin 
		Adder8_1 : Adder8 port map(
		                              Add8i1 => Add32i1(7 downto 0), 
		                              Add8i2 => Add32i2(7 downto 0), 
		                              Cin8 => Cin32, 
		                              Cout8 => Cin8s(0),
		                              Add8Sum => sum32(7 downto 0)
		                           );
		
		Adder8_2 : Adder8 port map(  
		                              Add8i1 => Add32i1(15 downto 8), 
		                              Add8i2 => Add32i2(15 downto 8), 
		                              Cin8 => Cin8s(0), 
		                              Cout8 => Cin8s(1),
		                              Add8Sum => sum32(15 downto 8)
		                           );
		
		Adder8_3 : Adder8 port map(
		                              Add8i1 => Add32i1(23 downto 16), 
		                              Add8i2 =>Add32i2(23 downto 16), 
		                              Cin8 => Cin8s(1), 
		                              Cout8 => Cin8s(2),
		                              Add8Sum => sum32(23 downto 16)
		                           );
		
		Adder8_4 : Adder8 port map (
		                              Add8i1 => Add32i1(31 downto 24), 
		                              Add8i2 => Add32i2(31 downto 24), 
		                              Cin8 => Cin8s(2),   
		                              Cout8 => Cin8s(3) ,  
		                              Add8Sum => sum32(31 downto 24)
		                            );
		Add32Sum <= sum32;
		Cout32 <= Cin8s(3);
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder8 is 
 generic (
    g_WIDTH : integer := 8
    );
	port(
		Add8i1, Add8i2 : in std_logic_vector(7 downto 0);
				Cin8 : in std_logic;
				Cout8 : out std_logic;
				Add8Sum : out std_logic_vector(7 downto 0)
	);
end Adder8;

architecture Behavioral of Adder8 is

component Adder1
	port (
				Add1i1, Add1i2 : in std_logic;
				Cin1 : in std_logic;
				Cout1 : out std_logic;
				Add1Sum : out std_logic
				
	);
end component Adder1;
signal w_C : std_logic_vector(8 downto 0);   -- Carry
signal w_SUM  : std_logic_vector(7 downto 0);
 
begin 

	w_C(0) <= Cin8 ; 

	
	Adder1_1 : Adder1 port map(
	                            Add1i1 => Add8i1(0), 
	                            Add1i2 => Add8i2(0), 
	                            Cin1 => w_C(0), 
	                            Cout1 => w_C(1), 
	                            Add1Sum => w_SUM(0)
	                           );
	
	Adder1_2 : Adder1 port map(    
	                               Add1i1 => Add8i1(1),  
	                               Add1i2 => Add8i2(1),  
	                               Cin1 => w_C(1), 
	                               Cout1 => w_C(2), 
	                               Add1Sum => w_SUM(1)
	                           );
	
	Adder1_3 : Adder1 port map(
	                               Add1i1 => Add8i1(2), 
	                               Add1i2 => Add8i2(2), 
	                               Cin1 => w_C(2), 
	                               Cout1 => w_C(3), 
	                               Add1Sum => w_SUM(2)
	                           );
	                           
	Adder1_4 : Adder1 port map(
	                               Add1i1 => Add8i1(3), 
	                               Add1i2 => Add8i2(3), 
	                               Cin1 => w_C(3), 
	                               Cout1 => w_C(4), 
	                               Add1Sum => w_SUM(3)
	                            );
	
	Adder1_5 : Adder1 port map(
	                               Add1i1 => Add8i1(4), 
	                               Add1i2 => Add8i2(4), 
	                               Cin1 => w_C(4), 
	                               Cout1 => w_C(5), 
	                               Add1Sum => w_SUM(4)
	                           );
	
	Adder1_6 : Adder1 port map(    
	                               Add1i1 => Add8i1(5), 
	                               Add1i2 => Add8i2(5), 
	                               Cin1 => w_C(5), 
                                   Cout1 => w_C(6), 
	                               Add1Sum => w_SUM(5)
	                           );
	
	Adder1_7 : Adder1 port map(
	                               Add1i1 => Add8i1(6), 
	                               Add1i2 =>Add8i2(6), 
	                               Cin1 => w_C(6), 
	                               Cout1 =>w_C(7), 
	                               Add1Sum => w_SUM(6)
	                           );
	
	Adder1_8 : Adder1 port map(    
	                               Add1i1 => Add8i1(7), 
	                               Add1i2 => Add8i2(7), 
	                               Cin1 => w_C(7), 
	                               Cout1 => w_C(8), 
	                               Add1Sum => w_SUM(7)
	                           );
	
    
	 Cout8 <= w_C(g_WIDTH);
	 Add8Sum <= w_SUM; 

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder1 is 
	port(
				Add1i1, Add1i2 : in std_logic;
				Cin1 : in std_logic;
				Add1Sum : out std_logic;
				Cout1 : out std_logic
				
	);
end Adder1;

architecture behaviour of Adder1 is
		signal w_G : std_logic; -- Generate
		signal w_P : std_logic; -- Propagate
	begin 
		w_G   <= Add1i1 and Add1i2;
		w_P   <= Add1i1 or Add1i2;  
		Cout1  <= w_G or (w_P and Cin1);
		Add1Sum <=  Add1i1 xor Add1i2  xor  Cin1;
	end behaviour;
