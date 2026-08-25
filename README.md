# RCubedISC-V

RCubedISC-V is a heavily cut down, single cycle core that implements part of the **RV32I** ISA.
It focuses on simplicity as a first CPU project. 

---

## Supported instructions

| Mnemonic | Type  | Description                          | Operation                   |
|----------|-------|--------------------------------------|-----------------------------|
| `LW`     | I-type| Load word from memory                | rd = mem[address]           |
| `SW`     | S-type| Store word to memory                 | mem[address] = rs2          |
| `ADD`    | R-type| Add two registers                    | rd = rs1 + rs2              |
| `AND`    | R-type| Bitwise AND between two registers    | rd = rs1 & rs2              |
| `OR`     | R-type| Bitwise OR between two registers     | rd = rs1 \| rs2             |
| `ADDI`   | I-type| Add register and immediate           | rd = rs1 + SE(imm)          |
| `BEQ`    | B-type| Branch if two registers are equal    | if (rs1 == rs2) PC = BTA    |

### Key

| Term         | Meaning                                 |
|--------------|-----------------------------------------|
| SE(imm)      | Sign‑extended immediate                 |
| mem[address] | Memory word at the address              |
| BTA          | Branch target address (PC + offset)     |
| PC           | Program counter                         |

---

## Structureal diagram

![CPU diagram](R3ISC_VDia.drawio.svg)

## Progression plan

- Implement more of **RV32I**
- Write a simple assembler
- Include MMIO to my seven segment display module 

---

## Acknowledgements

This project was designed using principles learned in Harris and Harris' *Digital Design and Computer Architecture - RISC-V Edition (2022)*. The structure of the core is based on the single cycle core from this textbook though its implementation is my own.