# FPGA Implementation of a D Latch Architecture using Xilinx Vivado

## Overview
This project presents a complete **RTL-to-Physical Analysis** design flow for an asynchronous **D Latch** using VHDL and Xilinx Vivado. The design covers the full digital logic lifecycle—from high-level hardware description and behavioral simulation to logic synthesis, I/O pin constraints, placement & routing (Implementation), and physical floorplan verification on a **28nm Xilinx Artix-7 FPGA** architecture.

---

## Technical Specifications

| Parameter | Specification |
| :--- | :--- |
| **HDL Language** | VHDL |
| **EDA Tool** | Xilinx Vivado Design Suite |
| **Target FPGA Family** | Xilinx Artix-7 |
| **Process Node** | 28nm HKMG Technology |
| **Target Device** | `xc7a12ticsg325-1L` |
| **Inferred Hardware Primitive** | `LDCE` (Transparent Latch with Gate/Enable) |
| **I/O Logic Standard** | `LVCMOS33` (3.3V Logic Level) |

---

## Visual Verification & Results

### 1. Behavioral Simulation Waveform
Functional verification confirming the transparent state ($EN = 1$, $Q$ follows $D$) and memory retention state ($EN = 0$, $Q$ holds previous state).

![D Latch Waveform](./D_Latch_Wave_Form.png)

---

### 2. Physical Layout & Floorplanning
Visualization of the synthesized `LDCE` primitive (`Q_reg`) physically mapped inside a CLB Slice within the 28nm silicon matrix.

![Floorplanning Layout](./FloorPlanning_of_D_Latch.png)

---

## Complete Design & Verification Methodology

### Step 1: RTL Description (VHDL)
The D Latch logic is described using process-based VHDL. Implicit memory inference is achieved by omitting the `else` condition, prompting Vivado to infer a physical memory element (`LDCE`) rather than pure combinational logic.

### Step 2: Behavioral Simulation
* Verified functional correctness across all input combinations using Vivado Simulator (XSIM).
* Checked output stability during signal transitions and confirmed transparent vs. latched states.

### Step 3: Logic Synthesis
* Synthesized the high-level VHDL code into technology-specific gate-level primitives.
* Verified that Vivado correctly mapped the conditional process into an **`LDCE` primitive** cell.

### Step 4: I/O Planning & Constraints (.XDC)
* Assigned physical/package pins for inputs ($D$, $EN$) and output ($Q$).
* Applied the **`LVCMOS33`** voltage standard across all I/O ports to satisfy hardware Design Rule Checks (DRC).

### Step 5: Implementation (Place & Route)
* Executed placement and routing onto the target Artix-7 FPGA silicon layer.
* Mapped the `LDCE` cell to a physical **CLB (Configurable Logic Block) Slice**.

### Step 6: Physical Floorplanning Analysis
* Examined the physical Netlist using the **Device Layout / Floorplan View**.
* Identified the exact hardware primitive (`Q_reg`) placed inside the FPGA slice.
* Inspected internal routing interconnects and cell pins ($D$, $G/CK$, $CE$, $Q$).

### Step 7: Static Timing Analysis (STA)
* Generated the **Report Timing Summary** post-implementation.
* Evaluated data path propagation delays ($D \to Q$ and $EN \to Q$).
* Confirmed expected asynchronous timing behaviors (`no_clock` warnings handled as standard for latches).

