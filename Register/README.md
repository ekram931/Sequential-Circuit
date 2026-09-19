# 8-Bit Register using VHDL

## 📌 Project Overview

This project implements an 8-bit Register using VHDL in Xilinx Vivado.

An 8-bit Register is a sequential digital circuit that stores 8-bit data on the rising edge of a clock signal.

## 🛠️ Tools Used

- VHDL
- Xilinx Vivado
- RTL Design
- Simulation

## 🔌 Inputs and Outputs

| Signal | Direction | Description |
|---|---|---|
| CLK | Input | Clock signal |
| RST | Input | Reset signal |
| D | Input | 8-bit data input |
| Q | Output | 8-bit registered data |

## ⚙️ Working Principle

1. When `RST = '1'`, the output Q becomes `00000000`.
2. When `RST = '0'` and a rising edge of CLK occurs, the input data D is stored in Q.
3. When there is no rising clock edge, the register retains its previous value.

## 📊 Example

### Input

```text
RST = 0
D   = 10101010
