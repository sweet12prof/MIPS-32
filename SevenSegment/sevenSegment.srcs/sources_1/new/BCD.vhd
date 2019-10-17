library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD is
  Port 
    (
        b_In : in std_logic_vector(3 downto 0);
        
        A : out std_logic;
        B : out std_logic;
        C : out std_logic;
        D : out std_logic;
        E : out std_logic;
        F : out std_logic;
        G : out std_logic
        
     );
end BCD;

architecture Behavioral of BCD is
signal controls : std_logic_vector(6 downto 0);
begin
    process(b_In) begin 
        case(b_In) is
            when x"0" => controls <=  "0000001";
            when x"1" => controls <=  "1001111";
            when x"2" => controls <=  "0010010";
            when x"3" => controls <=  "0000110";
            when x"4" => controls <=  "1001100";
            when x"5" => controls <=  "0100100";
            when x"6" => controls <=  "0100000";
            when x"7" => controls <=  "0001111";
            when x"8" => controls <=  "0000000";
            when x"9" => controls <=  "0000100";
            when x"A" => controls <=  "0001000";
            when x"B" => controls <=  "1100000";
            when x"C" => controls <=  "0110001";
            when x"D" => controls <=  "1000010";
            when x"E" => controls <=  "0110000";
            when x"F" => controls <=  "0111000";
            when others => controls <="1000001";
        end case;
    end process;
        
        A <= controls(6);
        B <= controls(5);
        C <= controls(4);
        D <= controls(3);
        E <= controls(2);
        F <= controls(1);
        G <= controls(0);
      
end Behavioral;