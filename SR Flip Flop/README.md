# SR Flip-Flop Design and Verification in VHDL

This repository contains the VHDL implementation and functional simulation of a Synchronous SR (Set-Reset) Flip-Flop with an Asynchronous Reset. The project was developed and verified using Xilinx Vivado.

---

## 📌 Features
- **Architecture:** Behavioral Description
- **Clock Edge:** Rising-edge triggered (`clk`)
- **Reset:** Asynchronous Reset (`reset`)
- **Outputs:** True Output (`Q`) and Inverted Output (`Qbar`)

---

## 🛠️ Logic & Truth Table

| Reset | Clock Event | S | R | Q (Next State) | Qbar | Mode / Description |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- |
|   1   |   X   | X | X |       0       |   1   | Asynchronous Reset |
|   0   |  ↑    | 0 | 0 |     Q_prev    | Qbar_prev | Hold (No Change)   |
|   0   |  ↑    | 0 | 1 |       0       |   1   | Reset State        |
|   0   |  ↑    | 1 | 0 |       1       |   0   | Set State          |
|   0   |  ↑    | 1 | 1 |       X       |   X   | Forbidden / Invalid|



| Pin Name | Direction | Description |
| :--- | :---: | :--- |
| **S** | Input | Set input (Forces output `Q` to High) |
| **R** | Input | Reset input (Forces output `Q` to Low) |
| **CLK** | Input | Master Clock input (Rising-edge triggered) |
| **RST** | Input | Asynchronous Reset (Active High) |
| **Q** | Output | Primary Output |
| **Qbar** | Output | Inverted Primary Output |

---

## 📈 Waveform Analysis

During the behavioral simulation in Vivado, the circuit was tested against the following timeline:

1. **`0 ns - 10 ns` (Reset Phase):** `RST` is set to `1`. Output `Q` initializes to `0` and `Qbar` to `1` regardless of clock edges.
2. **`10 ns - 30 ns` (Set Phase):** `S = 1`, `R = 0`, and `RST = 0`. At the clock rising edge (`20 ns`), `Q` transitions to `1`.
3. **`30 ns - 40 ns` (Hold Phase):** `S = 0`, `R = 0`. Output `Q` maintains its previous state (`1`).
4. **`40 ns+` (Reset Phase):** `S = 0`, `R = 1`. At the clock rising edge (`40 ns`), `Q` transitions back to `0`.

---

## 💡 Real-World Applications
Although modern high-speed synchronous systems prefer D Flip-Flops or JK Flip-Flops, SR Flip-Flops are fundamental in digital logic for:
- **Switch Debouncing Circuits:** Removing mechanical contact bounce in push buttons.
- **Control Latching:** Holding alarm states or control bits until explicitly cleared.
- **Data Storage Units:** Basic memory cell structure in Static RAM (SRAM).
