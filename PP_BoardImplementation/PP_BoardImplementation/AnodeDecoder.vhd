----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2019 02:08:04 PM
-- Design Name: 
-- Module Name: AnodeDecoder - Behavioral
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

entity AnodeDecoder is
  Port      
       (
           AD_In : in std_logic_vector(1 downto 0);
           AD_out : out std_logic_vector(3 downto 0) 
        );
end AnodeDecoder;

architecture Behavioral of AnodeDecoder is

begin
        AD_out <= 
        "0001" when (AD_In = "00") else
        "0010" when (AD_In = "01") else
        "0100" when (AD_In = "10") else 
        "1000" when (AD_In = "11") else
        "0000";

end Behavioral;

