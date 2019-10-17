library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DebugCounter is 
   port( Clock_enable_B: in std_logic;
 	 Clock: in std_logic;
 	 newClock : out std_logic
	 );
end DebugCounter;
 
architecture Behavioral of DebugCounter is
   signal temp: std_logic_vector(27 downto 0) := (others => '0') ;
	 constant stepDownFactor : integer := 37000000;
begin   process(Clock)
   begin
      if(rising_edge(Clock)) then
         if Clock_enable_B='1' then
            if temp= stepDownFactor then
               temp<=(others => '0');
					newClock <= '1';
            else
               temp <= temp + 1;
					newClock <= '0';
            end if;
         end if;
      end if;
   end process;
end Behavioral;