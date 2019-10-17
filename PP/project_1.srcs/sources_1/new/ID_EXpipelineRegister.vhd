library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity IDreg is
	port
	(
		   clk, en, reset, asyncReset: in STD_LOGIC;
			
			ID_memtoregD : in STD_LOGIC;
			ID_alusrcD, ID_regdstD: in STD_LOGIC;
			ID_regwriteD, ID_memWriteD, ID_shiftsD, ID_jalD: in STD_LOGIC;
			ID_alucontrolD: in STD_LOGIC_VECTOR(3 downto 0);
			ID_RD1D,ID_RD2D, ID_PCPLUS4D : in STD_LOGIC_VECTOR(31 downto 0);
			ID_RsD,ID_RtD,ID_RdD : in STD_LOGIC_VECTOR(4 downto 0);
			ID_SignImmD : in STD_LOGIC_VECTOR(31 downto 0);
			
			ID_memtoregE : out STD_LOGIC;
			ID_alusrcE, ID_regdstE: out STD_LOGIC;
			ID_regwriteE, ID_memWriteE, ID_shiftsE, ID_jalE: out STD_LOGIC;
			ID_alucontrolE: out STD_LOGIC_VECTOR(3 downto 0);
			ID_RD1E,ID_RD2E, ID_PCPLUS4E : out STD_LOGIC_VECTOR(31 downto 0);
			ID_RsE,ID_RtE,ID_RdE : out STD_LOGIC_VECTOR(4 downto 0);
			ID_SignImmE : out STD_LOGIC_VECTOR(31 downto 0)
	);
end IDreg;

architecture Behavioral of IDreg is
begin
	process(clk, reset, asyncReset) begin
					if reset = '1'  --or asyncReset = '1' 
						then 
							ID_memtoregE <= '0';
							ID_alusrcE <= '0';
							ID_regdstE <= '0';
							ID_regwriteE <= '0';
							ID_memWriteE <= '0';
							ID_shiftsE <= '0';
							ID_jalE  <= '0';
							ID_alucontrolE <= (others => '0');
							ID_RD1E <= (others => '0');
							ID_RD2E <= (others => '0');
							ID_PCPLUS4E <= (others => '0');
							ID_RsE <= (others => '0');
							ID_RtE <= (others => '0');
							ID_RdE <= (others => '0');
							ID_SignImmE <= (others => '0');
					
					elsif  rising_edge(clk) then
					       if asyncReset = '1' then
                                        ID_memtoregE <= '0';
                                        ID_alusrcE <= '0';
                                        ID_regdstE <= '0';
                                        ID_regwriteE <= '0';
                                        ID_memWriteE <= '0';
                                        ID_shiftsE <= '0';
                                        ID_jalE  <= '0';
                                        ID_alucontrolE <= (others => '0');
                                        ID_RD1E <= (others => '0');
                                        ID_RD2E <= (others => '0');
                                        ID_PCPLUS4E <= (others => '0');
                                        ID_RsE <= (others => '0');
                                        ID_RtE <= (others => '0');
                                        ID_RdE <= (others => '0');
                                        ID_SignImmE <= (others => '0');
                             
                           
				  elsif asyncReset /= '1' then
				    if en = '0' then 
							ID_memtoregE <= ID_memtoregD;
							ID_alusrcE <= ID_alusrcD;
							ID_regdstE <= ID_regdstD;
							ID_regwriteE <= ID_regwriteD;
							ID_memWriteE <= ID_memWriteD;
							ID_shiftsE <= ID_shiftsD;
							ID_jalE  <= ID_jalD;
							ID_alucontrolE <= ID_alucontrolD;
							ID_RD1E <= ID_RD1D;
							ID_RD2E <= ID_RD2D;
							ID_PCPLUS4E <= ID_PCPLUS4D;
							ID_RsE <= ID_RsD;
							ID_RtE <= ID_RtD;
							ID_RdE <= ID_RdD;
							ID_SignImmE <= ID_SignImmD;
					end if;
					end if;		
					end if;			 
	end process;
end Behavioral;
