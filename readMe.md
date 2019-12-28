# MIPS-32
  ## Description
  * This repo consists of 2 designs; the design of 32-bits single cycle and pipelined processors
  * These microarchitectures are realizations of a subset of the MIPS 32 core instructions
  * They can be found in the following directories; SP(Single Cycle Processor) and PP(Pipelined Processor) respectively.
  * The repo contains an fpga based implentation of the pipeline microarchitecture
  
  ## Behavior 
  ### SP(Single Cycle Processor)
  * The single cycle processor executes any instruction in a single clock cycle 
  * This is made possible by setting the clock time to time taken by the slowest instruction(lw in this case)
  * The design implements 10 instructions out of the MIPS-32 core instruction set
  * The instructions are listed in the table below
  
  | Instructions | Meaning | Format | Opcode | Rs | Rt | Rd | shamt | Funct|
  |--------------|---------|--------|--------|----|----|----|-------|------| 
  | Add Rd, Rs, Rt| Rd = Rs + Rt | R | OOOOO| sssss| ttttt| ddddd| xxxxx| 000001|
  
