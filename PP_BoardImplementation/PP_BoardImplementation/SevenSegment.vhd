----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2019 02:11:30 PM
-- Design Name: 
-- Module Name: SevenSegment - Behavioral
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
entity Seven_Segment is
  Port 
        (
            clk : in std_logic;
            SS_In1 : in std_logic_vector(7 downto 0);
            SS_In2 : in std_logic_Vector(7 downto 0);
            
            An_Out : out std_logic_Vector(3 downto 0);
            SS_Out : out std_logic_Vector(6 downto 0)
        );
end Seven_Segment;


architecture Behavioral of Seven_Segment is


    component clockDivider2 
        Port (
            clk : in std_logic;
            count : out std_logic_vector(1 downto 0)
         );
    end component;
    
    component AnodeDecoder
        Port      
            (
                AD_In : in std_logic_vector(1 downto 0);
                AD_out : out std_logic_vector(3 downto 0) 
             );
    end component;
    
    component  preBCDMUX 
            port
            (   
                Pbm_iN1 : in std_logic_vector(3 downto 0);
                Pbm_iN2 : in std_logic_vector(3 downto 0);
                Pbm_iN3 : in std_logic_vector(3 downto 0);
                Pbm_iN4 : in std_logic_vector(3 downto 0);
                
                Pbm_Sel : in std_logic_vector(1 downto 0);
                
                Pbm_OUT :  out std_logic_vector(3 downto 0)
            );
    end component;
    
    component BCD 
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
    end component;

signal A, B, C, D, E, F, G : std_logic;
signal counter : std_logic_vector(1 downto 0);
signal preAn_OUT, preBCDMUXOUT: std_logic_vector(3 downto 0);

begin
        UP_COUNTER1 : clockDivider2 port map
                                    (
                                        clk => clk ,
                                        count => counter
                                    );
       
       preBCDMUX1 : preBCDMUX port map
                                    (
                                         Pbm_iN1 => SS_In1(3 downto 0),
                                         Pbm_iN2 => SS_In1(7 downto 4),
                                         Pbm_iN3 => SS_In2(3 downto 0),
                                         Pbm_iN4 => SS_In2(7 downto 4),
                                         Pbm_Sel => counter,
                                         Pbm_OUT => preBCDMUXOUT 
                                    );
       
       AnodeDecoder1 : AnodeDecoder port map
                                    (
                                        AD_In  => counter,
                                        AD_out => preAn_OUT
                                    );
                                    
       BCD1 : BCD port map
                                    (
                                        b_In =>  preBCDMUXOUT, 
                                        A  =>  A, --A
                                        B =>   B,
                                        C =>   C,
                                        D =>   D,
                                        E =>   E,
                                        F =>   F,
                                        G =>   G
    
                                    );                          
      
       SS_Out(6) <= A;
       SS_Out(5) <= B;
       SS_Out(4) <= C;
       SS_Out(3) <= D;
       SS_Out(2) <= E;
       SS_Out(1) <= F;
       SS_Out(0) <= G;
       
       
        An_Out <= not preAn_OUT;
       

end Behavioral;