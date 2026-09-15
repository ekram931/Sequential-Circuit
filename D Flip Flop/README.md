# Synchronous D Flip-Flop with Asynchronous Active-High Reset

A VHDL implementation of a standard synchronous D Flip-Flop featuring an asynchronous active-high reset. This project demonstrates basic hardware description language (HDL) modeling, functional waveform verification, and hardware resource implementation on a Xilinx FPGA using Vivado and ModelSim.

---

## 📌 Features

* **Synchronous Operation:** Output `Q` updates strictly on the rising edge of the clock signal (`clk`).
* **Asynchronous Reset:** Active-high `reset` signal instantly overrides all inputs and clears output `Q` to `0`, independent of the clock.
* **FPGA Verification:** Fully synthesized and routed on Xilinx FPGA showing internal Slice-level implementation (CLB/BEL).

---

## 🛠 Circuit Truth Table

| Reset (`rst`) | Clock (`clk`) | Data Input (`D`) | Output (`Q`) | Description |
| :---: | :---: | :---: | :---: | :--- |
| `1` | X | X | `0` | **Reset (Asynchronous Override)** |
| `0` | Rising Edge ($\uparrow$) | `0` | `0` | Synchronous Data Transfer (Clear) |
| `0` | Rising Edge ($\uparrow$) | `1` | `1` | Synchronous Data Transfer (Set) |
| `0` | Falling Edge ($\downarrow$) / No Edge | X | $Q_{previous}$ | No Change (State Maintained) |

---

## 💻 VHDL Code

### Entity & Architecture Definition

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Flip_Flop is
    Port ( 
        D     : in  STD_LOGIC;
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        Q     : out STD_LOGIC
    );
end D_Flip_Flop;

architecture Behavioral of D_Flip_Flop is
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            Q <= '0';
        elsif rising_edge(clk) then
            Q <= D;
        end if;
    end process;
end Behavioral;
