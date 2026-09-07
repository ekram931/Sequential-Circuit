# FPGA Implementation of a D Latch Architecture using Xilinx Vivado

## Overview
This project demonstrates a complete **RTL-to-Physical Analysis** design flow for an asynchronous **D Latch** using VHDL and Xilinx Vivado. The project covers the full digital logic design lifecycle—from VHDL hardware description and behavioral simulation to logic synthesis, I/O planning, placement & routing (Implementation), and physical floorplan verification on a **28nm Xilinx Artix-7 FPGA** architecture.

---

## Key Technical Specifications
* **HDL Language:** VHDL
* **EDA Tool:** Xilinx Vivado Design Suite
* **Target Architecture:** Xilinx Artix-7 (28nm HKMG Technology)
* **Target Device:** `xc7a12ticsg325-1L` (or equivalent Artix-7 FPGA)
* **Hardware Primitive Inferred:** `LDCE` (Transparent Latch with Gate/Enable)
* **I/O Standard:** `LVCMOS33` (3.3V Logic Level)

---

## Design & Workflow Steps

### 1. VHDL RTL Description
The D Latch logic is described using process-based VHDL. Implicit memory inference is utilized by omitting the `else` condition, prompting the synthesis engine to generate a latch structure instead of pure combinational logic.

### 2. Behavioral Simulation & Functional Verification
* Tested both **Transparent State** ($EN = 1$, output $Q$ follows input $D$) and **Hold State** ($EN = 0$, output $Q$ retains its previous memory state).
* Verified functionality through timing waveform analysis using Vivado Simulator (XSIM).

### 3. RTL Synthesis
* Synthesized the high-level VHDL code into technology-specific gate-level primitives.
* Confirmed that Vivado mapped the latch process into an **`LDCE` primitive** cell within the Netlist.

### 4. I/O Planning & Constraints (.XDC)
* Assigned virtual/physical package pins for inputs ($D$, $EN$) and output ($Q$).
* Configured the **`LVCMOS33`** voltage standard across all I/O ports to satisfy hardware design rule checks (DRC).
* Generated and linked a dedicated Xilinx Constraint File (`.xdc`).

### 5. Implementation (Place & Route)
* Executed physical mapping, placement, and routing onto the target 28nm FPGA silicon layer.
* Mapped the `LDCE` cell to a physical **CLB (Configurable Logic Block) Slice**.

### 6. Physical Verification & Floorplanning
* Examined the physical Netlist using the **Device Layout / Floorplan View**.
* Located and verified the exact hardware primitive (`Q_reg`) placed inside the FPGA slice.
* Inspected the routing interconnects and internal primitive pins ($D$, $G/CK$, $CE$, $Q$).

### 7. Static Timing Analysis (STA)
* Generated the **Report Timing Summary** post-implementation.
* Analyzed data path propagation delays ($D \to Q$ and $EN \to Q$).
* Handled standard unconstrained timing warnings (`no_clock`) typical for purely asynchronous latch-based designs.

---

## File Structure

```text
├── src/
│   └── d_latch.vhd          # Top-level VHDL source code
├── sim/
│   └── tb_d_latch.vhd       # Testbench file for behavioral simulation
├── constraints/
│   └── constrs_1.xdc        # Xilinx Constraint File (I/O & Pin assignments)
└── README.md                # Project documentation
