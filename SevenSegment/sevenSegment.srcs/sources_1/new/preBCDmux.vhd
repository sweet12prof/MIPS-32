
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity preBCDMUX is 
    port
    (   
        Pbm_iN1 : in std_logic_vector(3 downto 0);
        Pbm_iN2 : in std_logic_vector(3 downto 0);
        Pbm_iN3 : in std_logic_vector(3 downto 0);
        Pbm_iN4 : in std_logic_vector(3 downto 0);
        
        Pbm_Sel : in std_logic_vector(1 downto 0);
        
        Pbm_OUT :  out std_logic_vector(3 downto 0)
    );
end preBCDMUX;

architecture behave of preBCDMUX is
    begin 
        with Pbm_Sel select Pbm_OUT <=
            Pbm_iN1 when "00",
            Pbm_iN2 when "01",
            Pbm_iN3 when "10",
            Pbm_iN4 when "11",
            "0000" when others;                       
        end behave;