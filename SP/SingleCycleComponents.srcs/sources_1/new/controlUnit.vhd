------------------------
--cu
------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CU is
	port(
		op, funct : in std_logic_vector(5 downto 0);
		zero : in std_logic;
		memWrite, memtoReg : out std_logic;
		regWrite, regDst : out std_logic;
		alusrc, pcSrc : out std_logic;
		jump: out std_logic;
		alucontrol : out std_logic_vector(2 downto 0)
		);
end CU;

architecture Behavioral of CU is
	
	component mainDEC
		port(
			op : in std_logic_vector(5 downto 0);
			memWrite, memtoReg : out std_logic;
			regWrite, regDst : out std_logic;
			alusrc, branch : out std_logic;
			ALUOp : out std_logic_vector(1 downto 0);
			jump: out std_logic
		   );
	end component;
	
	component aluDEC
		port(
			funct : in std_logic_vector(5 downto 0);
			ALUOp : in std_logic_vector(1 downto 0);
			alucontrol : out std_logic_vector(2 downto 0)
			);
	end component;
   signal branchSig : std_logic;
	signal ALUopSig : std_logic_vector(1 downto 0);
begin
	md: mainDEC port map(
	                       op => op,
	                       memWrite => memWrite,
	                       memtoReg => memtoReg,
	                       regWrite => regWrite, 
	                       regDst => regDst, 
	                       alusrc => alusrc,
	                       branch => branchSig,
	                       ALUOp => ALUopSig, 
	                       jump => jump
	                    );
	
	ad: aluDEC port map(
	                       funct => funct, 
	                       ALUOp => ALUopSig, 
	                       alucontrol => alucontrol
	                    );
	pcSrc <= branchSig and zero;
end Behavioral;