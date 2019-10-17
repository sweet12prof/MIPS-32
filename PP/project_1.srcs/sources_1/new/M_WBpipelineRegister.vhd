library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity IWreg is
	port
	(
		clk, reset: in STD_LOGIC;
			
	   IW_RegWriteM, IW_memtoregM, IW_jalM : in STD_LOGIC;
		IW_ReadDataM, IW_ALUoutM, IW_PCPLUS4M : in STD_LOGIC_VECTOR(31 downto 0);
		IW_WriteRegM : in STD_LOGIC_VECTOR(4 downto 0);
			
		IW_RegWriteW, IW_memtoregW, IW_jalW : out STD_LOGIC;
		IW_ReadDataW, IW_ALUoutW, IW_PCPLUS4W : out STD_LOGIC_VECTOR(31 downto 0);
		IW_WriteRegW : out STD_LOGIC_VECTOR(4 downto 0)
	);
end IWreg;

architecture synchronous of IWreg is

begin
	process(clk, reset) begin
					if reset = '1' 
						then 
							IW_RegWriteW <= '0';
							IW_memtoregW <= '0';
							IW_jalW <= '0';
		               IW_ReadDataW <= (others => '0');
							IW_ALUoutW <= (others => '0');
							IW_PCPLUS4W <= (others => '0');
		               IW_WriteRegW <= (others => '0');
								elsif rising_edge(clk) then
									
							IW_RegWriteW <=  IW_RegWriteM;
							IW_memtoregW <=  IW_memtoregM;
							IW_jalW <= IW_jalM;
		               IW_ReadDataW <=  IW_ReadDataM;
							IW_ALUoutW <=    IW_ALUoutM;
							IW_PCPLUS4W <= IW_PCPLUS4M;
		               IW_WriteRegW <=  IW_WriteRegM;
					end if;
	end process;

end synchronous;