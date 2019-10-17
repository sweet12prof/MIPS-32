library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity IMreg is
	port
	(
			clk, reset: in STD_LOGIC;
			
			IM_memtoregE, IM_jalE  : in STD_LOGIC;
			IM_regwriteE, IM_memWriteE: in STD_LOGIC;
			IM_ALUoutE, IM_WriteDataE, IM_PCPLUS4E : in STD_LOGIC_VECTOR(31 downto 0);
			IM_WriteRegE : in STD_LOGIC_VECTOR(4 downto 0);
			
			IM_memtoregM, IM_jalM : out STD_LOGIC;
			IM_regwriteM, IM_memWriteM: out STD_LOGIC;
			IM_ALUoutM, IM_WriteDataM, IM_PCPLUS4M : out STD_LOGIC_VECTOR(31 downto 0);
			IM_WriteRegM : out STD_LOGIC_VECTOR(4 downto 0)
	);
end IMreg;

architecture Behavioral of IMreg is
begin
		process(clk, reset) begin
					if reset = '1' 
						then 
						   IM_memtoregM  <= '0';
							IM_jalM <= '0';
						   IM_regwriteM  <= '0';
						   IM_memWriteM  <= '0';
			            IM_ALUoutM    <= (others => '0');
						   IM_WriteDataM <= (others => '0');
							IM_PCPLUS4M <= (others => '0');
			            IM_WriteRegM  <= (others => '0');
								elsif rising_edge(clk) then
								   IM_memtoregM  <= IM_memtoregE;
									IM_jalM <= IM_jalE;
									IM_regwriteM  <= IM_regwriteE;
									IM_memWriteM  <= IM_memWriteE;
									IM_ALUoutM    <= IM_ALUoutE;
									IM_WriteDataM <= IM_WriteDataE;
									IM_PCPLUS4M <= IM_PCPLUS4E;
									IM_WriteRegM  <= IM_WriteRegE;					
					end if;
	end process;
end Behavioral;

