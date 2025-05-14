# MIPS Processor (Verilog)

This project implements a MIPS processor using Verilog HDL. The design follows the classic MIPS architecture, supporting a subset of the instruction set and providing a foundation for understanding computer architecture concepts.

## Features

- Single-cycle MIPS processor
- Supports R-type, I-type, and J-type instructions
- ALU operations: add, sub, and, or, slt, etc.
- Data memory and instruction memory modules
- Register file with read/write capabilities
- Control unit for instruction decoding

## Directory Structure

```
.
├── src/            # Verilog source files
├── testbench/      # Testbenches for simulation
├── README.md       # Project documentation
```

## Getting Started

1. **Clone the repository:**
    ```bash
    git clone https://github.com/AhmedSaid3617/MIPS-processor-verilog.git
    cd MIPS-processor-verilog
    ```

2. **Open the source files** in your preferred Verilog simulator (e.g., ModelSim, Icarus Verilog).

3. **Run simulations** using the provided testbenches to verify functionality.

## Usage

- Modify or extend the instruction set as needed.
- Use the testbenches to validate new instructions or modules.

## Requirements

- Verilog simulator (ModelSim, Icarus Verilog, etc.)
- Basic knowledge of MIPS architecture

## References

- [MIPS Architecture Overview](https://en.wikipedia.org/wiki/MIPS_architecture)
- [Verilog HDL Documentation](https://www.verilog.com/)

## License

This project is licensed under the MIT License.
