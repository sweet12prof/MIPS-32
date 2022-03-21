# SP (Single Cycle Processor)
## General Info 
* Design of a 32-bit Single Cycle MIPS processor based on a subset(10 instructions) of the MIPS instruction set
## Behavior
* The single Cycle processor, as it name suggest execute a single instruction in a single clock cycle.
* It runs at a cycle time equivalent to the time taken by the instruction that takes the longest time.
* It has a CPI of 1.
* This implementation adopts 10 instructions from the MIPS32 instruction set.
* It contains 32 registers
* Features all addressing modes of the MIPS core instruction set

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

## Design Methodology
* Schematic for single cycle processor in SP directory
* Xilinx ISE used for design using VHDL
* The processor at top module is interfaced with seperate memories for data(Dmem) and Instruction(Imem) memories, thus at top level module implements the Havard architecture.
* The processor consists of a Datapath and control unit 
* The architectural state elements used in the design include the register file, the program counter and Memories.

## Testing 
 * At top Level the unbounded I/O include the data adress(dataadr) and write data(writedata) of the data Memory.
 * This was done to aid in testbench ; Simulation programs used in testbench, retire/complete by storing results in the data memory. For this reason, these signals are unbounded at top level to allow debugging
 * The configuration can easily be changed by editing the files representing level of abstractions above the Datapath.
 * The vhd files can be found in the src folder
 * At the moment the program in the instruction memory is a random program that tests all the instruction, it doesn't implement any meaningful program. This can be easily changed by modifying the instruction memory. However, ensure your program utilizes only instructions that were adopted! otherwise won't produce the correct output.
 * You can safely edit the testbench to verify results for your custom program.
 
## Synthesis and Implementation For FPGA
* Design doesn't require a lot of resources, was easily synthesised for the retired Xilinx Spartan 3
* The spartan 3 can be used as reference when deciding an FPGA for synthesis/implementation of this project.
* More I/O can be brought through from the Datapath to the top Level by editing the vhd files as satated earlier for I/O planning
* Don't synthesise the testbench :/
