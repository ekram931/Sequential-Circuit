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

---

## 📂 Source Code (`SR_Flip_Flop.vhd`)

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr_flip_flop is
    Port (
        S     : in  STD_LOGIC;
        R     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        RST   : in  STD_LOGIC;
        Q     : out STD_LOGIC;
        Qbar  : out STD_LOGIC
    );
end sr_flip_flop;

architecture Behavioral of sr_flip_flop is
    signal q_internal : STD_LOGIC := '0';
begin

    process(CLK, RST)
    begin
        if (RST = '1') then
            q_internal <= '0';
        elsif rising_edge(CLK) then
            if (S = '0' and R = '0') then
                q_internal <= q_internal;
            elsif (S = '0' and R = '1') then
                q_internal <= '0';
            elsif (S = '1' and R = '0') then
                q_internal <= '1';
            elsif (S = '1' and R = '1') then
                q_internal <= 'X';
            end if;
        end if;
    end process;

    Q    <= q_internal;
    Qbar <= not q_internal;

end Behavioral;
