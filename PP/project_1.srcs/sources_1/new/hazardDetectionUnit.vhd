----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:38:25 PM
-- Design Name: 
-- Module Name: hazardDetectionUnit - Behavioral
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


library IEEE; use IEEE.STD_LOGIC_1164.all;

entity HU is -- hazard unit
port(		
		rsD, rtD, rsE, rtE: in STD_LOGIC_VECTOR(4 downto 0);
		
		writeregE, writeregM, writeregW: in STD_LOGIC_VECTOR(4 downto 0);
		regwriteE, regwriteM, regwriteW: in STD_LOGIC;
		
		memtoregE, memtoregM, branchD, jumpD, jrD: in STD_LOGIC;
		
		forwardaD, forwardbD: out STD_LOGIC;
		forwardaE, forwardbE, newForwardAE: out STD_LOGIC_VECTOR(1 downto 0);
		
		stallF, flushE: out STD_LOGIC;
		stallD: inout STD_LOGIC
		);
end HU;

architecture behave of HU is
		signal lwstallD, branchstallD, jrstallD: STD_LOGIC;
begin
-- forwarding sources to D stage (branch equality)
		forwardaD <= '1' when ((rsD /= "00000") and (rsD = writeregM) and(regwriteM = '1'))
				else '0';
					forwardbD <= '1' when ((rtD /= "00000") and (rtD = writeregM) and (regwriteM = '1'))
						else '0';				
						
-- forwarding sources to E stage (ALU)
process(rsE, writeregM,rsD, writeregW, regwritem, regwritew, rte, jrD) begin
		forwardaE <= "00"; forwardbE <= "00"; newForwardAE <= "00";
				if (rsE /= "00000")
					then
						if ((rsE = writeregM) and (regwriteM = '1'))
							then
								forwardaE <= "10";
						elsif ((rsE = writeregW) and (regwriteW = '1')) 
							then
								forwardaE <= "01";
						end if;
				end if;
				
				if (rtE /= "00000") 
					then
						if ((rtE = writeregM) and (regwriteM = '1')) 
							then
								forwardbE <= "10";
						elsif ((rtE = writeregW) and (regwriteW = '1')) 
							then
								forwardbE <= "01";
						end if;
				end if;
				
				
				if ((rsD /= "00000") and (jrD ='1'))
					then
						if ((rsD = writeregM) and (regwriteM = '1'))
							then
								newForwardAE <= "10";
						elsif ((rsD = writeregW) and (regwriteW = '1')) 
							then
								newForwardAE <= "01";
						end if;
				end if;
				
				
				
end process;
-- stalls
lwstallD <= '1' when ((memtoregE = '1') and ((rtE = rsD) or (rtE = rtD)))
	else '0';
	
jrstallD <= '1' when ((jrD = '1') and (((regwriteE = '1') and (writeregE = rsD)) or 
((memtoregM = '1') and((writeregM = rsD)))))
else '0';


branchstallD <= '1' when ((branchD = '1') and (((regwriteE = '1') and ((writeregE = rsD) or 
(writeregE = rtD))) or ((memtoregM = '1') and((writeregM = rsD) or (writeregM = rtD)))))
else '0';
stallD <= (lwstallD or branchstallD  or jrstallD) after 1 ns;
stallF <= stallD after 1 ns; -- stalling D stalls all previous stages
flushE <= stallD or jumpD   after 1 ns;-- stalling D flushes next stage
-- not necessary to stall D stage on store if source comes from load;
-- instead, another bypass network could be added from W to M
end behave;
