--------------------------------------------------------------------------------------Done B/n the Periods of January - May 2019
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


Instrunction Memory 2 codes 
	1. Hard coded Decoder serving as ROM  ------dorminant one used for fpga configuration
	2. memory written in VHDL, loads txt file containing instructions but not synthesisable for fpga-------COMMENTED PORTION IN THE Instruction memory code
	-Memfile is added, u can use option 2 by highlighting 1. but point memfile.txt directory on your machine.
	-Memfile contains a program which multiply 2 numbers by the naive algorithm approach; seperate registers for multiplicand and multiplier
	- Testbench reports if program in 1 executes successfully 
	- Program in 1 tests instructions at random, not a meaningful program 
	- it stores 84 in address location 7 at end (this condition is checked in testbench)\
	- Don't use option 2 for Single Cycle processor, it does not have all the instruction 	


Yet to Update Extra modules used for fpga configuration
ENJOY, CHEERS



--------------------------------------------------17-10-2019

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



Next Steps(Long Term): Superscalar Architecture and also Compiler Construction 
Next Steps(Short Term): Use SRAM on spartan 3 board as Instruction Memory. Atm, i've defined my own in vhdl. 

Enjoy, CHeERS   