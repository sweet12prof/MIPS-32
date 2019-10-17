library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity pipeLinedProcessor is
	port 
	(
		clk, reset: in STD_LOGIC;
		pc: out STD_LOGIC_VECTOR(31 downto 0);
		instr: in STD_LOGIC_VECTOR(31 downto 0);
		memwrite: out STD_LOGIC;
		aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0);
		readdata: in STD_LOGIC_VECTOR(31 downto 0)
	);
end pipeLinedProcessor;

architecture Behavioral of pipeLinedProcessor is

component pDatapath 
	port 
	(
	   ------------------------------------
		--Within Datapath
		------------------------------------
		clk               : in STD_LOGIC;
		reset             : in STD_LOGIC;
		DP_pc             : out STD_LOGIC_VECTOR(31 downto 0);
		DP_instr          : in STD_LOGIC_VECTOR(31 downto 0);
		DP_aluout         : inout STD_LOGIC_VECTOR(31 downto 0);
		DP_writedata      : inout STD_LOGIC_VECTOR(31 downto 0);
		DP_readdata       : in STD_LOGIC_VECTOR(31 downto 0);	
		DP_memWrite       : out STD_logic;
		
		-------------------------------------
		--From Control Unit
		-------------------------------------
		CU_memtoregD      : in STD_LOGIC;
		CU_pcsrcD         : in STD_LOGIC_VECTOR(3 downto 0);
		CU_alusrcD        : in STD_LOGIC;
		CU_regdstD        : in STD_LOGIC;
		CU_regwriteD      : in STD_LOGIC;
		CU_memWriteD      : in STD_LOGIC;
		CU_BranchD        : in STD_LOGIC; 
		CU_JumpD          : in STD_LOGIC;
		CU_shiftsD        : in STD_LOGIC;
		CU_jalD           : in STD_LOGIC; 
		CU_jrD            : in STD_LOGIC;
		CU_alucontrolD    : in STD_LOGIC_VECTOR(3 downto 0);
		CU_instr          : out STD_LOGIC_VECTOR(5 downto 0); 
		CU_funct          : out STD_LOGIC_VECTOR(5 downto 0); 
		CU_EqualD         : out STD_LOGIC;
		CU_haltCPU         : in std_logic;
		
		------------------------------------
		--From And to Hazard Unit 
		------------------------------------
		HU_StallF         : in STD_LOGIC; 
		HU_StallD         : in STD_LOGIC;
		HU_FlushE         : in STD_LOGIC;
		HU_ForwardAD      : in STD_LOGIC; 
		HU_ForwardBD      : in STD_LOGIC;
		HU_ForwardAE      : in STD_LOGIC_VECTOR(1 downto 0);
		HU_ForwardBE      : in STD_LOGIC_VECTOR(1 downto 0);
		HU_newForwardAE   : in STD_LOGIC_VECTOR(1 downto 0);
		HU_BranchD        : out STD_LOGIC; 
		HU_JumpD          : out STD_LOGIC; 
		HU_jrD            : out STD_LOGIC;
		HU_memtoregE      : out STD_LOGIC; 
		HU_memtoregM      : out STD_LOGIC;
		HU_RegWriteE      : out STD_LOGIC; 
		HU_RegWriteM      : out STD_LOGIC; 
		HU_RegWriteW      : out STD_LOGIC;
		HU_writeRegE      : out STD_LOGIC_VECTOR(4 downto 0);  
		HU_writeRegM      : out STD_LOGIC_VECTOR(4 downto 0);  
		HU_writeRegW      : out STD_LOGIC_VECTOR(4 downto 0); 
		HU_RsD            : out STD_LOGIC_VECTOR(4 downto 0);  
		HU_RtD            : out STD_LOGIC_VECTOR(4 downto 0); 
		HU_RsE            : out STD_LOGIC_VECTOR(4 downto 0);  
		HU_RtE            : out STD_LOGIC_VECTOR(4 downto 0)
	);
end component;

component CU
	port 
	(
		op            : in std_logic_vector(5 downto 0);
		funct         : in std_logic_vector(5 downto 0);
		equal         : in std_logic;
		memWrite      : out std_logic; 
		memtoReg      : out std_logic;
		regWrite      : out std_logic;
		regDst        : out std_logic;
		alusrc        : out std_logic;
		jump          : out std_logic; 
		branch        : out std_logic;
		shifts        : out std_logic;
		jal           : out std_logic; 
		jr            : out std_logic;
		pcSrc         : out std_logic_vector(3 downto 0);
		alucontrol    : out std_logic_vector(3 downto 0);
		haltCPU       : out std_logic
	);
end component;

component HU
	port 
	(
		rsD        : in STD_LOGIC_VECTOR(4 downto 0);
		rtD        : in STD_LOGIC_VECTOR(4 downto 0); 
		rsE        : in STD_LOGIC_VECTOR(4 downto 0); 
		rtE        : in STD_LOGIC_VECTOR(4 downto 0);	
		writeregE     : in STD_LOGIC_VECTOR(4 downto 0);
		writeregM     : in STD_LOGIC_VECTOR(4 downto 0); 
		writeregW     : in STD_LOGIC_VECTOR(4 downto 0);
		regwriteE     : in STD_LOGIC;
		regwriteM     : in STD_LOGIC;
		regwriteW     : in STD_LOGIC;		
		memtoregE     : in STD_LOGIC;
		memtoregM     : in STD_LOGIC; 
		branchD       : in STD_LOGIC; 
		jumpD         : in STD_LOGIC; 
		jrD           : in STD_LOGIC;		
		forwardaD          : out STD_LOGIC;
		forwardbD         : out STD_LOGIC;
		forwardaE         : out STD_LOGIC_VECTOR(1 downto 0);
		forwardbE         : out STD_LOGIC_VECTOR(1 downto 0);
		newForwardAE      : out STD_LOGIC_VECTOR(1 downto 0);		
		stallF            : out STD_LOGIC;
		flushE            : out STD_LOGIC;
		stallD            : inout STD_LOGIC
	);
end component;

signal CU_memtoregD :  STD_LOGIC;
signal CU_pcsrcD: STD_LOGIC_VECTOR(3 downto 0);
signal CU_alusrcD, CU_regdstD:  STD_LOGIC;
signal CU_regwriteD, CU_memWriteD:  STD_LOGIC;
signal CU_BranchD, CU_JumpD, CU_shiftsD, CU_jalD, CU_jrD :  STD_LOGIC;
signal CU_alucontrolD:  STD_LOGIC_VECTOR(3 downto 0);
signal CU_instr, CU_funct :  STD_LOGIC_VECTOR(5 downto 0); 
signal CU_EqualD, CU_haltCPU :  STD_LOGIC;

signal HU_StallF, HU_StallD :  STD_LOGIC;
signal HU_FlushE :  STD_LOGIC;
signal HU_ForwardAD, HU_ForwardBD :  STD_LOGIC;
signal HU_ForwardAE, HU_ForwardBE, HU_newForwardAE : STD_LOGIC_VECTOR(1 downto 0);
signal HU_BranchD, HU_JumpD,HU_jrD, HU_memtoregE, HU_memtoregM :  STD_LOGIC;
signal HU_RegWriteE, HU_RegWriteM, HU_RegWriteW :  STD_LOGIC;
signal HU_writeRegE, HU_writeRegM, HU_writeRegW  :  STD_LOGIC_VECTOR(4 downto 0); 
signal HU_RsD, HU_RtD, HU_RsE, HU_RtE :  STD_LOGIC_VECTOR(4 downto 0); 
signal aluoutSignal, writedataSignal : std_logic_vector(31 downto 0);
begin
	pdatapath1 : pDatapath port map 
	(
		clk          => clk, 
		reset        => reset,
		DP_pc        => pc, 
		DP_instr     => instr, 
		DP_aluout    => aluoutSignal, 
		DP_writedata => writeDataSignal, 
		DP_readdata  => readData,
		DP_memWrite  => memWrite,
		
		CU_memtoregD   => CU_memtoregD, 
		CU_pcsrcD      => CU_pcsrcD,
		CU_alusrcD     => CU_alusrcD, 
		CU_regdstD     => CU_regdstD,
		CU_regwriteD   => CU_regwriteD, 
		CU_memWriteD   => CU_memWriteD,
		CU_BranchD     => CU_BranchD,
		CU_JumpD       => CU_JumpD, 
		CU_shiftsD     => CU_shiftsD,
		CU_jalD        => CU_jalD,
		CU_jrD         => CU_jrD,
		CU_alucontrolD => CU_alucontrolD,
		CU_instr       => CU_instr, 
		CU_funct       => CU_funct, 
		CU_EqualD      => CU_EqualD,
		CU_haltCPU      => CU_haltCPU,
		
		HU_StallF      => HU_StallF, 
		HU_StallD      => HU_StallD,
		HU_FlushE      => HU_FlushE,
		HU_ForwardAD   => HU_ForwardAD, 
		HU_ForwardBD   => HU_ForwardBD,
		HU_ForwardAE   => HU_ForwardAE, 
		HU_ForwardBE   => HU_ForwardBE,
		HU_newForwardAE=> HU_newForwardAE,
		HU_BranchD     => HU_BranchD, 
		HU_JumpD       => HU_JumpD,
		HU_jrD         => HU_jrD, 
		HU_memtoregE   => HU_memtoregE, 
		HU_memtoregM   => HU_memtoregM,
		HU_RegWriteE   => HU_RegWriteE, 
		HU_RegWriteM   => HU_RegWriteM, 
		HU_RegWriteW   => HU_RegWriteW, 
		HU_writeRegE   => HU_writeRegE, 
		HU_writeRegM   => HU_writeRegM, 
		HU_writeRegW   => HU_writeRegW,
		HU_RsD         => HU_RsD, 
		HU_RtD         => HU_RtD, 
		HU_RsE         => HU_RsE, 
		HU_RtE         => HU_RtE 
		
		
	);
	
	Control : CU port map
	(
		op         => CU_instr, 
		funct      => CU_funct,
		equal      => CU_EqualD,
		memWrite   => CU_memWriteD, 
		memtoReg   => CU_memtoregD,
		regWrite   => CU_regwriteD, 
		regDst     => CU_regdstD,
		alusrc     => CU_alusrcD, 
		jump       => CU_JumpD, 
		branch     => CU_BranchD,
		shifts     => CU_shiftsD,
		jal        => CU_jalD,
		jr         => CU_jrD,
		pcSrc      => CU_pcsrcD, 
		alucontrol => CU_alucontrolD,
		haltCPU     => CU_haltCPU
	); 

	Hazard : HU port map
	(
		rsD        => HU_RsD, 
		rtD        => HU_RtD, 
		rsE        => HU_RsE, 
		rtE        => HU_RtE,
		writeregE   => HU_writeRegE, 
		writeregM   => HU_writeRegM, 
		writeregW   => HU_writeRegW,
		regwriteE   => HU_RegWriteE, 
		regwriteM   => HU_RegWriteM, 
		regwriteW   => HU_RegWriteW, 
		memtoregE   => HU_memtoregE, 
		memtoregM   => HU_memtoregM, 
		branchD     => HU_BranchD, 
		jumpD       => HU_JumpD,
		jrD         => HU_jrD,
		forwardaD   => HU_ForwardAD, 
		forwardbD   => HU_ForwardBD, 
		forwardaE   => HU_ForwardAE, 
		forwardbE   => HU_ForwardBE,
		newForwardAE=> HU_newForwardAE,
		stallF      => HU_StallF, 
		flushE      => HU_FlushE, 
		stallD      => HU_StallD
	);
	
	
	
	
	aluout <= aluoutSignal; 
	writedata <= writedataSignal;
end Behavioral;
