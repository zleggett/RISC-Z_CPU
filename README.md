# RISC-Z_CPU
A CPU designed in Verilog to utilize the RISC-Z ISA

## RISC-Z ISA
RISC-Z is a custom ISA inspired by RISC-V.\
The RISC-Z ISA features:
* 21 instructions
* 7 instruction types
* 16-bit words
* 16-bit signed immediate values
* 16 registers

[RISC-Z Documentation](docs/RISC-Z_ISA.pdf)

## Verilog CPU Code
All Verilog source code for the CPU can be seen in the [sources directory](sources/).\
[top_CPU.v](/sources/top_CPU.v) is the top level file that drives the CPU using the [control and datapath](/sources/control_and_datapath.v), [data memory](/sources/data_mem.v), and [instruction memory](/sources/instr_mem.v).

The RISC-Z CPU features:
* Single-cycle datapath
* Seperate instruction and data memories
* One cycle per instruction

Testbenches used to verify the functionality of each Verilog component can be seen in the [simulations direcrtory](simulations/).

## Documentation
The entire design and implementation process is documented in a serires of reports that can be found in the [docs directory](docs/).
