--------------------------------------------------------------------------------------Done B/n the Periods of September 2018 - May 2019
pp -- Pipelined processor, Up to 15 instructions 
	add
	sub 
	and 
	or 
	beq
	j
	jal
	jr 
	sll
	srl
	slt
	addi
	lw 
	sw
	xor 
	
SP  -- Single Cycle Processor, Up to 10

	add
	sub
	and 
	or 
	slt
	beq
	j	
	lw 
	sw


Yet to implement ====WFI to halt 


Wrote 2 codes for instrunction Memory 
	1. Simple Decoder serving as imem ROM  ------this is used for fpga synthesis
	2. memory written in VHDL, loads txt file containing instructions but not synthesisable for fpga-------COMMENTED PORTION IN THE Instruction memory file.
	-A hex file can be loaded into option 2, but directory must be pointed to that file in the imem Code 
	-A hex file is included within the repo, it contains a sample program which multiplies 2 numbers                                           (Add-shift multicycle approach) 
	- Testbench reports if program in 1 executes successfully 
	- Program in 1 tests instructions at random, not a meaningful program 
	- it stores 84 in address location 7 at end (this condition is checked in testbench)\
	- Don't use hexfile included in the PP repo for SP as instructions in the hexfile go beyond SPs ISA.	


Yet to Update Extra modules used for fpga configuration
ENJOY, CHEERS



-------------------------------------------------------------------------------------------------------------------------17-10-2019

- Implemented haltCPU instruction(Partially to stop CPU on last instruction in the IMEM)-----haltCPU => FFFFFFFF
- Added Seven Segment Module for spartan 3 FPGA XCS200, in Seven Segment Folder
- Created a 4 million Up Counter + ClkEnable to stepthrough results
- For Normal Operation Of Processor Remove clock Fix Module and feed output of the DCM's FX, directly to the Processor
- From the Left of the Seven Segment on the FPGA, the First 2 Segments represent the DataAdrESS[7 downto 0 of 32 bits] of Data Memory
- The last 2 segments represent the ALUoutput/WriteData[7 downto 0 of 32 bits] Normally written to a registeR/Memory
- The code Downloaded to the fpga is an add-shift algorithm to multiply 40 by 5 and store the result in adress location 100
- On completion Of program red LED on p11 of FPGA will light up.
- The bit file is in PP_Implementation Folder.
- Xilinx Impact is used to download bit file to FPGA

NB: Spartan 3 FPGA used to verify design, this forced the use of Xilinx ISE for Implementation
PP_Implementation consists of ISE files, All other folders are for Vivado

Next Steps(Long Term): Superscalar Architecture and also Compiler Construction 
Next Steps(Short Term): Use SRAM on spartan 3 board as Instruction Memory. Atm, i've defined my own in vhdl. 

Enjoy, CHeERS   
