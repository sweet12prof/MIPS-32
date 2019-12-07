----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2019 02:32:02 PM
-- Design Name: 
-- Module Name: Datapath - Behavioral
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


entity pDatapath is
	port 
	(
	   ------------------------------------
		--Within Datapath
		------------------------------------
		clk, reset: in STD_LOGIC;
		DP_pc: out STD_LOGIC_VECTOR(31 downto 0);
		DP_instr: in STD_LOGIC_VECTOR(31 downto 0);
		DP_aluout, DP_writedata: inout STD_LOGIC_VECTOR(31 downto 0);
		DP_readdata: in STD_LOGIC_VECTOR(31 downto 0);	
		DP_memWrite : out STD_logic;
		
		-------------------------------------
		--From Control Unit
		-------------------------------------
		CU_memtoregD : in STD_LOGIC;
		CU_pcsrcD: in STD_LOGIC_VECTOR(3 downto 0);
		CU_alusrcD, CU_regdstD: in STD_LOGIC;
		CU_regwriteD, CU_memWriteD: in STD_LOGIC;
		CU_BranchD, CU_JumpD, CU_shiftsD, CU_jalD, CU_jrD : in STD_LOGIC;
		CU_alucontrolD: in STD_LOGIC_VECTOR(3 downto 0);
		CU_instr, CU_funct : out STD_LOGIC_VECTOR(5 downto 0); 
		CU_EqualD : out STD_LOGIC;
		CU_haltCPU : in std_logic;
		------------------------------------
		--From And to Hazard Unit 
		------------------------------------
		HU_StallF, HU_StallD : in STD_LOGIC;
		HU_FlushE : in STD_LOGIC;
		HU_ForwardAD, HU_ForwardBD : in STD_LOGIC;
		HU_ForwardAE, HU_ForwardBE,HU_newForwardAE: in STD_LOGIC_VECTOR(1 downto 0);
		HU_BranchD, HU_JumpD, HU_jrD, HU_memtoregE, HU_memtoregM : out STD_LOGIC;
		HU_RegWriteE, HU_RegWriteM, HU_RegWriteW : out STD_LOGIC;
		HU_writeRegE, HU_writeRegM, HU_writeRegW  : out STD_LOGIC_VECTOR(4 downto 0); 
		HU_RsD, HU_RtD, HU_RsE, HU_RtE : out STD_LOGIC_VECTOR(4 downto 0) 
	);
end pDatapath;

architecture Behavioral of pDatapath is
	component mux3
		port
		(
			mux4input1,mux4input2,mux4input3 : in STD_LOGIC_VECTOR(31 downto 0);
			mux4Control : in STD_LOGIC_VECTOR( 1 downto 0);
			mux4output : out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;
	
	component flopr
		port
		(
			clk, reset, en: in STD_LOGIC;
			d: in STD_LOGIC_VECTOR(31 downto 0);
			q: out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;
	
	component adder32
		port
		(
			Add32i1, Add32i2 : in std_logic_vector(31 downto 0);
			Cin32 : in std_logic;
			Add32Sum : out std_logic_vector(31 downto 0);
			Cout32 : out std_logic
		);
	end component;
	
	component IFreg
		port
		(
			clk, reset, asyncReset, en: in STD_LOGIC;	
			IF_InstrF : in STD_LOGIC_VECTOR( 31 downto 0);
			IF_PCPlus4F : in STD_LOGIC_VECTOR( 31 downto 0);
			
			IF_InstrD : out STD_LOGIC_VECTOR( 31 downto 0);
			IF_PCPlus4D : out STD_LOGIC_VECTOR( 31 downto 0)
			
		);
	end component;
	
	component signExt
		port
		(
			a : in std_logic_vector(15 downto 0);
			y : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component sl2
		port
		(
			a : in std_logic_vector(31 downto 0);
			b : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component regFile
		port
		(
			clk: in STD_LOGIC;
			we3: in STD_LOGIC;
			ra1, ra2, wa3: in STD_LOGIC_VECTOR(4 downto 0);
			wd3: in STD_LOGIC_VECTOR(31 downto 0);
			rd1, rd2: out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;
	
	component mux2
		port
		(
			mux2input1,mux2input2 : in STD_LOGIC_VECTOR(31 downto 0);
			mux2Control : in STD_LOGIC;
			mux2output : out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;
	
	component PCMUX 
		port 
		(
			mux4input1,mux4input2,mux4input3,mux4input4, mux4input5: in STD_LOGIC_VECTOR(31 downto 0);
			mux4Control : in STD_LOGIC_VECTOR( 3 downto 0);
			mux4output : out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;
	
	component mux3_5
		port
		(
			mux2input5_1,mux2input5_2, mux2input5_3 : in STD_LOGIC_VECTOR(4 downto 0);
			mux2Control5 : in STD_LOGIC_VECTOR(1 downto 0);
			mux2output5 : out STD_LOGIC_VECTOR(4 downto 0)
		);
	end component;
	
--	component resultMUX  is 
--		port(	
--			mux2input5_1,mux2input5_2 : in STD_LOGIC_VECTOR(31 downto 0);
--			mux2Control5 : in STD_LOGIC;
--			mux2output5 : out STD_LOGIC_VECTOR(31 downto 0)		
--			);
--	end component;
	
	component comparator
		port
		(
			com_i1, com_i2 : in STD_LOGIC_VECTOR(31 downto 0);
			com_o1 : out STD_LOGIC
		);
	end component;
	
	component IDreg
		port
		(
			clk, en,reset, asyncReset: in STD_LOGIC;
			
			ID_memtoregD : in STD_LOGIC;
			ID_alusrcD, ID_regdstD: in STD_LOGIC;
			ID_regwriteD, ID_memWriteD, ID_shiftsD, ID_jalD: in STD_LOGIC;
			ID_alucontrolD: in STD_LOGIC_VECTOR(3 downto 0);
			ID_RD1D,ID_RD2D, ID_PCPLUS4D  : in STD_LOGIC_VECTOR(31 downto 0);
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
	end component;
	
	component ALU 
		port
		(
			ALUinput1,ALUinput2 : in STD_LOGIC_VECTOR(31 downto 0);
			ALUctrl :  in STD_LOGIC_VECTOR(3 downto 0);
			output  : out STD_LOGIC_VECTOR(31 downto 0);
			zero : out std_logic;
			carryOut: out STD_LOGIC
		);
	end component;
	
	component IMreg
		port
		(
			clk, reset: in STD_LOGIC;
			
			IM_memtoregE, IM_jalE : in STD_LOGIC;
			IM_regwriteE, IM_memWriteE: in STD_LOGIC;
			IM_ALUoutE, IM_WriteDataE, IM_PCPLUS4E : in STD_LOGIC_VECTOR(31 downto 0);
			IM_WriteRegE : in STD_LOGIC_VECTOR(4 downto 0);
			
			IM_memtoregM, IM_jalM : out STD_LOGIC;
			IM_regwriteM, IM_memWriteM: out STD_LOGIC;
			IM_ALUoutM, IM_WriteDataM, IM_PCPLUS4M: out STD_LOGIC_VECTOR(31 downto 0);
			IM_WriteRegM : out STD_LOGIC_VECTOR(4 downto 0)
		);
	end component;
	
	component IWreg
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
	end component; 
	
	--------Fetch Stage Signals
	signal IFRegClr : STD_LOGIC;
	signal instrD, pcF, pcMUXres, PCplus4F, PCplus4D, PCplus4E, PCplus4M, PCplus4W, PCjrAddressD  : STD_LOGIC_VECTOR(31 downto 0);
	signal PCJumpD, PCBranchD : STD_LOGIC_VECTOR(31 downto 0);
	
	---- For sign extention and shift left in Decode Stage
	signal signImmD, sl2D :  STD_LOGIC_VECTOR(31 downto 0);

	-----------Decode Stage signls
	signal regWriteW :  STD_LOGIC; -- register enable signal comes from writeBack Stage
	signal writeRegW : STD_LOGIC_VECTOR(4 downto 0); ----write address from WriteBack
	signal resultW: STD_LOGIC_VECTOR(31 downto 0); -----writeData from WriteBack
   signal RD1, RD2: STD_LOGIC_VECTOR(31 downto 0);
	signal ALUoutM : STD_LOGIC_VECTOR(31 downto 0); ----- ALU result from memory stage
	signal compi1, compi2 : STD_LOGIC_VECTOR(31 downto 0);
	signal EqualD : STD_LOGIC;
	
	signal memtoregE : STD_LOGIC;
	signal alusrcE, regdstE, shiftsE, jalE : STD_LOGIC;
	signal regwriteE, memWriteE : STD_LOGIC;
	signal alucontrolE : STD_LOGIC_VECTOR(3 downto 0);  
	signal RD1E, RD2E : STD_LOGIC_VECTOR(31 downto 0);
	signal RsE, RtE, RdE : STD_LOGIC_VECTOR(4 downto 0);	
	signal signImmE : STD_LOGIC_VECTOR(31 downto 0);
	
	------------Execution Stage Signals
	signal  presrcAE,srcAE, writeDataE, srcBE, ALUoutE, preALUoutM  : STD_LOGIC_VECTOR(31 downto 0);
	signal writeRegE : STD_LOGIC_VECTOR(4 downto 0);
	
	signal memtoregM, jalM :  STD_LOGIC;
	signal regwriteM, memWriteM: STD_LOGIC;
	signal WriteDataM : STD_LOGIC_VECTOR(31 downto 0);
	signal WriteRegM: STD_LOGIC_VECTOR(4 downto 0);
	signal regDstNew,  prehaltPC: STD_LOGIC_VECTOR(1 downto 0);
	---------Memory Stage Signals
	signal memtoregW, jalW,haltPC, nextHalt :  STD_LOGIC;
	signal readdataW, ALUoutW : STD_LOGIC_VECTOR(31 downto 0);
	
begin

	-------------------------------------
	--Fetch Stage
	------------------------------------
		
		prehaltPC <= CU_haltCPU & HU_StallF;
		
		with prehaltPC select haltPC <=
		         '1' when "01" | "10" | "11",
		         '0' when others;
		         
		nextHalt <= haltPC or HU_StallD;
		-----IFregClr signal
		IFRegClr <=  CU_pcsrcD(1) or CU_pcsrcD(2) or CU_pcsrcD(3) when HU_StallD = '1' else  
		CU_pcsrcD(0) or CU_pcsrcD(1) or CU_pcsrcD(2) or CU_pcsrcD(3);
		----PCplus4F
		pcPlus4 : Adder32 port map
		(
			pcF, "00000000000000000000000000000100",
			'0', PCplus4F
		);
		
		----IfRegIni
		IFReg1 : IFreg port map
		(
			clk, reset, IFRegClr, nextHalt, DP_instr, 
			PCplus4F,instrD, PCplus4D
		);
		
		----PCJump
		PCJumpD  <= PCplus4D(31 downto 28) & instrD(25 downto 0) & "00";
		
		----ImmExt
		immSign : signExt port map
		(
			instrD(15 downto 0), signImmD
		);
		
		---------- sl2
		pcBranchsl2 : sl2 port map
		(
			signImmD, sl2D
		);
		
		----------BranchAddressCalculation
		pcBranchAdder : Adder32 port map
		(
			sl2D, PCplus4D, '0', PCBranchD 
		);
		
		-------------PCAddressMUX
		PCMUX1 : PCMUX port map
		(
			PCplus4F, PCBranchD, PCJumpD, PCJumpD, PCjrAddressD,
			CU_pcsrcD, pcMUXres
		);
		
		----pcflopr ini
		PCREG : flopr port map
		(
			clk, reset, haltPC, pcMUXres, pcF
		);
		
		-------pc Out
		DP_pc <= pcF;
	
	-------------------------------------
	--Decode Stage
	------------------------------------
	 
	 -----funct and instr for CU 
	 CU_instr <=  instrD(31 downto 26);
	 CU_funct <=  instrD(5 downto 0);
	 
	
	 
	 ------regFileIni
	 rf : regFile port map
	 (
		clk, regWriteW, instrD(25 downto 21), instrD( 20 downto 16),
		writeRegW, resultW, RD1, RD2
	  );
	 
	 -----COMPARATOR Mux's
	 RDmux1 : mux2 port map
	 (
		 RD1, ALUoutM, HU_ForwardAD, compi1 
	 );
	 RDmux2 : mux2 port map 
	 (
	    RD2, ALUoutM, HU_ForwardBD, compi2
	 );
	 
	 jrMUX2 : mux3 port map(RD1, resultW, ALUoutM, HU_newForwardAE, PCjrAddressD);
	 
	 ----COMAPARAtor ini
	compare : comparator port map
	(
		compi1, compi2, EqualD  
	);
	
	------sending EqualD to CU
	CU_EqualD  <= EqualD;
	 
	 ----sending decode stage hu signals 
    HU_RsD  <=  instrD(25 downto 21);
	 HU_RtD  <=  instrD(20 downto 16);
	 HU_BranchD <= CU_BranchD;
	 HU_JumpD 	<= CU_JumpD;
	 HU_jrD <= CU_jrD;
	 ---------ID register ini 
		IDreg1 : IDreg port map
		(
			clk,CU_haltCPU, reset, HU_FlushE, 
			
			CU_memtoregD,
	      CU_alusrcD, CU_regdstD,
		   CU_regwriteD, CU_memWriteD, CU_shiftsD, CU_jalD,
		   CU_alucontrolD, RD1 , RD2, PCplus4D,
			instrD(25 downto 21), instrD(20 downto 16), instrD(15 downto 11),
			signImmD,
			
			memtoregE,
			alusrcE, regdstE,
		   regwriteE, memWriteE, shiftsE, jalE,
			alucontrolE, 
			RD1E, RD2E, PCplus4E,
			RsE, RtE, RdE,	
			signImmE
		);
	
	-------------------------------------
	--Execution Stage
	------------------------------------
	   
		regDstNew <= jalE & regdstE;
		------sending HU, rsE and rtE
			HU_RsE <= RsE; 
			HU_RtE <= RtE;
		
		-------Pre ALU mux's
		  mux32_1 : mux3 port map
		  (
				RD1E, resultW, ALUoutM, HU_ForwardAE, presrcAE
		  );
		  
		  srcAEmux : mux2 port map 
		  (
				presrcAE, signImmE, shiftsE, srcAE  
		  );
		  
		  
		  mux32_2 : mux3 port map
		  (
		      RD2E, resultW, ALUoutM, HU_ForwardBE, writeDataE
		  );
		  
		  srcBEmux : mux2 port map 
		  (
				writeDataE, signImmE, alusrcE, srcBE  
		  );
		  
		  ALU11 : ALU port map
		  (
				srcAE, srcBE, alucontrolE, ALUoutE,
				zero  => open, 
				carryOut => open 
		  );
		  
		  -----------WriteRegE 
		  WriteRegEMUX : mux3_5 port map 
		  (
				RtE, RdE, "11111", regDstNew , writeRegE	
		  );
		  
		  ------sending writeRegE to HU
		  HU_RegWriteE <= regwriteE;
		  HU_writeRegE <= writeRegE;
        HU_memtoregE <= memtoregE;
		  
		  ---------IM register ini
		  
		  IMreg1 : IMreg port map
		  (
			   clk, reset, 
				
				memtoregE, jalE,
				regwriteE, memWriteE,
				ALUoutE, writeDataE,PCplus4E,
				writeRegE,
				
				memtoregM, jalM,
			   regwriteM, memWriteM,
			   preALUoutM, WriteDataM,PCplus4M,
			   WriteRegM
			);
-------------------------------------
	--Memory Stage
------------------------------------	
	ALUoutMMux : mux2 port map(preALUoutM, PCplus4M, jalM, ALUoutM);
	---memWrite Out, ALUout out, WriteDataM out
		DP_memWrite <= memWriteM;
		DP_aluout <= ALUoutM;
		DP_writedata <= WriteDataM;
		
	---sending writeRegM and regWriteM to HU
		HU_RegWriteM <= regwriteM;
		HU_writeRegM <= WriteRegM;
		HU_memtoregM <= memtoregM;
		
	-----IW reg ini 
		IWreg1 : IWreg port map 
		(
			clk, reset,
			
			regwriteM, memtoregM, jalM,
			DP_readdata, ALUoutM,PCplus4M,
			WriteRegM,
			
			regwriteW, memtoregW, jalW,
	      readdataW, ALUoutW, PCplus4W,
	      WriteRegW 			
		);
		
-------------------------------------
	--WriteBack Stage
------------------------------------	
	-----sending writeRegW and regWriteW to 
--		newMemtoReg <= jalW & memtoregW; 
		HU_RegWriteW <= regwriteW;
		HU_writeRegW <= WriteRegW;
		
   --------resultW mux 
		ResMUx : mux2 port map
		(
			 ALUoutW, readdataW, memtoregW, resultW 
		);
end Behavioral;

