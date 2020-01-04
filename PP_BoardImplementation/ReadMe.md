# PP (Pipeline Processor)
## General Info 
* Design of a 32-bit, 5 -stage pipeline MIPS processor based on a subset(15 instructions) of the MIPS instruction set
## Behavior
* The pipeline processor, has a microarchitecture that allows concurrent execution of instructions.
* It is a form of spatial parallelism, it is divided into n-stages(5 in this case) and allows at most n 
instructions to be in the processor at the same time.
* This implementation is a pipeline of the single cycle microarchitecture since it offers lesser complexity and better 
performance as compared to pipeline of other microarchitectures.
* To divide the processor's functionality into satges, n - 1 registers(called pipeline registers) are used to achieve 
this divsion.  
* Instructions come in from the fetch stage and make their way through succeeding stages as the clock rises. This allows 5 
instructions in the processor by the time the first iunstruction reaches the last stage (for this design).   
* The stages include; the Instruction Fetch, Instruction Decode, Execute, Memory and Writeback Stage.
* Ideally the CPI of a pipeline processor would be 1, however hazards may occur when overlapping instructions are dependent 
on each other. Such cases compel the microarchitecture to stall the pipeline by creating a bubble which effectively reduces 
the instructions completed at a given time(throughput).
* Another form of hazard would be a control hazard, in whose case, the processor flushes incorrectly fetched instructions 
as a result of a mispredicted branch.
* The CPI of a pipeline is effectively defined by the equation CPI = Ideal CPI + branch hazards + Control Hazards. 
* CPI is generally <= 1
* The design adopts a subset(15 instructions) of the MIPS ISA and an extra instruction to halkt the CPU(For debug on FPGA)
* It consists of 32 registers and utilizes all of the addressing modes featurd by the ISA

### Instructions 
#### R-Format
| Instructions | Meaning | Opcode | Rs | Rt | Rd | shamt | Funct|
|--------------|---------|--------|----|----|----|-------|------| 
| | | 6 bits| 5 bits | 5 bits | 5 bits | 5 bits | 6 bits|
| add rd, rs, rt| Rd = Rs + Rt | 000000| sssss| ttttt| ddddd| 00000| 100000| 
|sub rd, rs, rt| Rd = Rs -Rt|000000|sssss|ttttt|ddddd|00000| 100010|
|and rd, rs, rt|Rd = Rs and Rt |000000| sssss| ttttt | ddddd| 00000| 100100 |
|or rd, rs, rt|Rd = Rs or Rt |000000| sssss| ttttt | ddddd| 00000| 100101 |
|slt rd, rs,rt |rs == rt ? 1:0 |000000| sssss| ttttt | ddddd| 00000| 101010 |
|sll rd, rs, rx | rd =rs sll rx | 000000 | sssss | 00000 | 00000 | xxxxxx | 000000 |
| srl rd, rs, rx | rd = rs = srl rx | 000000 | sssss | 00000 | 00000 | xxxxxx | 000010 |  
| xor rd, rs, rt | rd = rs xor rt | 000000 | sssss | ttttt | ddddd | 00000 | 100110 |
|Jr rs  | Jump to Address in register(rs) : pc = $rs| 000000 | ssssss | 000000 | 000000 | 00000 | 001000 |  
#### I-Format
| Instructions | Meaning | Opcode | Rs | Rt | Address | 
|-|-|-|-|-|-|
|||6 bits| 5  bits | 5 bits | 16 bits |
|addi rs, rt, #**Imm**|rt = rs + Imm |001000| sssss | ttttt | Immediate(Imm)|
|lw rt, Offset(Address) | rt = MEM[Offset + Address] | 100011| sssss | ttttt | Address |
|sw rt, Offset(Address) | MEM[Offset + Address] = rt | 101011 | sssss| ttttt | Address |
|beq rs, rt, Address | rs == rt ? pc = Label + (pc + 4) : pc += 4 | 000100 | sssss | ttttt | Label | 

#### J-Format 
| Instructions | Meaning | Opccode | Jump Address |
|-|-|-|-|
|J Address | pc = Address | 000010 | Address |
| Jal Address | Jump and Link : $ra($31) = pc + 4 then pc = Address | 000011 | Address |  


#### Halt CPU
| Instructrion | Meaning | Opcode | Remaining bits |
|--------------|---------|--------|----------------|
| |  | 6 bits | 26 bits |
| halt         | halt the CPU | 11111 | (dont care) |
## Design Methodology
* Schematic for processor in directory
* Xilinx ISE used for design using VHDL
* The processor at top module is interfaced with seperate memories for data(Dmem) and Instruction(Imem) memories, thus at top level module implements the Havard architecture.
* The processor consists of a Datapath, control unit and Hazard unit.
* The hazard unit checks whether close overlapping instructions are capable of resulting into a hazards, if so, it generates 
signals which stall or flush the pipeline thereby resolving the hazard.
* The architectural state elements used in the design include the register file, the program counter, 4 pipeline registers and Memories.

## Testing 
 * At top Level the unbounded I/O include the data adress(dataadr) and write data(writedata) of the data Memory.
 * This was done to aid in testbench ; Simulation programs used in testbench, retire/complete by storing results in the data memory. For this reason, these signals are unbounded at top level to allow debugging
 * The configuration can easily be changed by editing the files representing level of abstractions above the Datapath.
 * The vhd files can be found in the src folder
 * The program in the instruction memory consists of the add-shift method to multiply 2 numbers, it multiplies 40 by 5 in this case and produces a result of 200. This can be edited out with your own program. However make sure to utilize only the instructions adopted. Any instructions which are not within this subset will render execution of that program incorrect or a failure.
 * You can also safely edit the testbench to verify results for your custom program.
 
## Synthesis and Implementation For FPGA
* Design synthesised correctly for the retired Xilinx Spartan 3 FPGA
* The spartan 3 can be used as reference when deciding an FPGA for synthesis/implementation of this project.
* More I/O can be brought through from the Datapath to the top Level by editing the vhd files as satated earlier for I/O planning
* For implementation on the FPGA I modified the Lower abstrations to bring more bounded I/O to the Top Module(Module at the top 
which i use for I/O planning ). These I/Os consist of signals from every stage. 
* The Xilinx Spartan 3 FPGA board has 4 seven segments on it, this immediately reduces the size of data that can be seen as output on it.
* In exception of the Instruction itself the other signals i bring to the top are only the lower half bits(15 downto 0)
* Using the selector switches on the FPGA i select a particular stage(which is indicated by an LED for each stage) as well as the signals from the stage to display.
* A selected signal-bus from a stage has each quarter of its signals multiplexed to produce an output which goes through a BCD converter to generate the various 
signals required to activate and represent a symbol on each segment
* With this I/O plan, signals from every stage can be witnessed on the FPGA.
* The following table shows the Inputs :

 |Stage Selector| Stage | F_LED | D_LED | E_LED | M_LED | W_LED | Signal Selector| Signal | Size | RegisterWriteEnable Signal  (Additional LED Output) | MemwriteEnable Signal  (Additional LED Output) |
 |--------------|-------|--|--|--|---|--|-----|------- |------|---|-----|
 | 000          |Fetch Stage|1 | 0| 0 | 0 | 0 | 000 | PC | (15 downto 0 ) |0| 0 |
 |000           |Fetch Stage|1 | 0| 0 | 0 | 0 | 001 | Instruction at Fetch| (31 downto 16)|0| 0 |
 |000|Fetch Stage| 1 | 0| 0 | 0 | 0 | 010 | Instruction at Fetch| (15 downto 0) |0| 0 |
 |001|Decode Stage | 0 | 1| 0 | 0 | 0 | 000 |Instruction at Decode | (31 downto 16) |0| 0 |
 |001|Decode Stage | 0 | 1| 0 | 0 | 0 | 001 | Instruction at Decode | (15 downto 0) |0| 0 |
 |001|Decode Stage | 0 | 1| 0 | 0 | 0 | 010 | RD1(Operand read from port 1) at Decode | (15 downto 0) |0| 0 |
 |001|Decode Stage | 0 | 1| 0 | 0 | 0 | 011 | RD2(Operand read from port 2) at Decode | (15 downto 0) |0| 0 |
 |010|Execute Stage | 0 | 0| 1 | 0 | 0 | 000 | Instruction at Execute | (31 downto 16) |0| 0 |
 |010|Execute Stage | 0 | 0| 1 | 0 | 0 | 001 | Instruction at Execute | (15 downto 0) |0| 0 |
 |010|Execute Stage | 0 | 0| 1 | 0 | 0 |010 | ALU Input 1(AT Execute) | (15 downto 0) |0| 0 |
 |010|Execute Stage | 0 | 0| 1 | 0 | 0 |011 | ALU Input 2(At Execute) | (15 downto 0) |0| 0 |
 |011|Execute Stage| 0 | 0| 1 | 0 | 0 | 100 | ALU Output(At Execute) | (15 downto 0) |0| 0 |
 |100|Memory Stage | 0 | 0| 0 | 1 | 0 | 000 | Instruction at Memory Stage | (31 downto 16) |0| 1 |
 |100|Memory Stage |0 | 0| 0 | 1 | 0 | 001 | Instruction at Memory Stage | (15 downto 0)  |0| 1|
 |100|Memory Stage | 0 | 0| 0 | 1 | 0 | 010 | Writedata port For Memory    |  (15 downto 0) |0| 1 |
 |100|Memory Stage | 0 | 0| 0 | 1 | 0 | 010 | Data address port for Memory Write/Read | 15 downto 0 |1| 0 |
 |101|Writeback Stage|0  | 0| 0 | 0 | 1 | 000  | Instruction at WriteBack Stage | (31 downto 16) |1| 0 |
 |101|Writeback Stage | 0 | 0| 0 | 0 | 1 | 001  | Instruction at Writeback Stage | (15 downto 0) |1| 0 |
 |101|Writeback Stage | 0 | 0| 0 | 0 | 1 | 010  | data to Write to Register | (15 downto 0) |1| 0 |
 |101| Writeback Stage |0 | 0| 0 | 0 | 1 | 011 | register Select/Address for Write| (4 downto 0)  left padded with Zeros| 1 | 0 |
 
 
 * Also the board has pll of frequency 50 MHZ, I squeezed out 40 MHZ out of it while being able to meet constraints.
 * Any modern FPGAs should achieve higher than this
 * The speed is further stepped down to enable debug on the FPGA
 * I achieve this stepdown by using a 40 million up counter and a clock enable which is controlled by a button to allow manual STEP THROUGH
 stepthrough of the execution of a program.
 * This settings can easily be changed from the top module.

Cheers
