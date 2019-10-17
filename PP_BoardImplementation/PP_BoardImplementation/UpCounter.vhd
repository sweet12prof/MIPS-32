library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity clockDivider2 is
  Port (
            clk : in std_logic;
            count : out std_logic_vector(1 downto 0)
         );
end clockDivider2;

architecture Behavioral of clockDivider2 is
    constant stepDownFactor : integer := 40000;
    signal countToFactor : std_logic_vector(27 downto 0) := ( others => '0');
    
    signal countSig : std_logic_vector(1 downto 0) := ( others => '0');
begin

 
    CountToFactorProcess : process(clk, countToFactor) begin 
                        if(rising_edge(clk)) 
                            then
                                if(countToFactor =  stepDownFactor - 1 )
                                    then 
                                        countSig <=  countSig + 1;        
                                        countToFactor <= x"0000000";
                                else 
                                    countToFactor <= countToFactor + 1 ;
                                end if;
                             end if;
                    end process;
                      
    count <= countSig;              
                   
                            
end Behavioral;