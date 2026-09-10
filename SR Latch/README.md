# VHDL Implementation of SR Latch using NAND Gates

This repository contains the VHDL design, simulation setup, RTL synthesis, and timing analysis details for an **Active-Low SR Latch** implemented using NAND logic on a Xilinx Artix-7 FPGA (`xc7a12ticsg325-1L`) using Xilinx Vivado.

---

## 1. Project Overview

An **SR (Set-Reset) Latch** is a fundamental 1-bit asynchronous storage element (bistable multivibrator). This design utilizes two cross-coupled NAND gates to store state information without a clock signal.

---

## 2. Truth Table & Functionality

Since the latch is constructed using NAND gates, the inputs $S$ and $R$ are **Active-Low** (triggered on logic `'0'`).

| $S$ (Set) | $R$ (Reset) | $Q$ | $Q_{bar}$ | State / Mode |
| :---: | :---: | :---: | :---: | :---: |
| 0 | 0 | 1 | 1 | **Invalid / Forbidden** |
| 0 | 1 | 1 | 0 | **Set** ($Q = 1$) |
| 1 | 0 | 0 | 1 | **Reset** ($Q = 0$) |
| 1 | 1 | No Change | No Change | **Memory / Hold** |

* **Set State ($S=0, R=1$):** Sets output $Q$ to logic high (`1`).
* **Reset State ($S=1, R=0$):** Resets output $Q$ to logic low (`0`).
* **Memory State ($S=1, R=1$):** Retains the previously stored bit.
* **Forbidden State ($S=0, R=0$):** Both outputs go high simultaneously ($Q=1, Q_{bar}=1$), violating the complementary condition ($Q \neq Q_{bar}$).

---

## 3. VHDL Source Code

### Entity & Behavioral Architecture (`sr_latch.vhd`)

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_Latch is
    Port (
        S    : in  STD_LOGIC;
        R    : in  STD_LOGIC;
        Q    : out STD_LOGIC;
        Qbar : out STD_LOGIC
    );
end SR_Latch;

architecture Behavioral of SR_Latch is
    signal Q_int    : STD_LOGIC := '1';
    signal Qbar_int : STD_LOGIC := '0';
begin

    -- NAND Gate Logic Feedback Connections
    Q_int    <= S nand Qbar_int;
    Qbar_int <= R nand Q_int;

    -- Assigning internal signals to output ports
    Q    <= Q_int;
    Qbar <= Qbar_int;

end Behavioral;

## 5. Timing & Path Delay Analysis

To ensure the design meets speed and stability requirements, **Static Timing Analysis (STA)** was performed using Vivado's Timing Engine after the Implementation phase.

---

### Types of Timing Analysis Performed

1. **Static Timing Analysis (STA):** 
   Calculates the structural gate and wire delays across the synthesized design without requiring active simulation test vectors.

2. **Setup Time Analysis (Max Delay / Worst-Case Check):** 
   Measures the maximum time required for a logic transition at an input pin to settle stably at an output terminal.

3. **Hold Time Analysis (Min Delay / Best-Case Check):** 
   Measures the absolute minimum propagation time across the shortest physical path inside the FPGA.

---

### Timing Report Data Summary

Since this SR Latch is an asynchronous (clockless) feedback circuit, timing is evaluated across **Unconstrained Combinational Paths (NONE to NONE)**.

| Analysis Type | Path Source $\rightarrow$ Destination | Total Delay | Logic Delay (LUT) | Net Delay (Wires) | Description |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **Max Delay (Setup)** | $S \rightarrow Q_{bar}$ | **7.215 ns** | 3.848 ns | 3.366 ns | Critical Path (Worst-case delay) |
| **Max Delay (Setup)** | $S \rightarrow Q$ | **6.764 ns** | 3.694 ns | 3.070 ns | Secondary output path delay |
| **Min Delay (Hold)** | $R \rightarrow Q$ | **2.090 ns** | 1.380 ns | 0.710 ns | Best-case response time |
| **Min Delay (Hold)** | $R \rightarrow Q_{bar}$ | **2.194 ns** | 1.410 ns | 0.784 ns | Minimum path delay |

---

### Key Analytical Takeaways

* **Maximum Propagation Delay ($T_{pd, max}$):** **7.215 ns** (Worst-case delay from input $S$ to output $Q_{bar}$).
* **Minimum Propagation Delay ($T_{pd, min}$):** **2.090 ns** (Best-case delay from input $R$ to output $Q$).
* **Failing Endpoints:** **0** (No setup/hold timing violations detected).


