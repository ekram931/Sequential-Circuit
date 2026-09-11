# Design and Simulation of a T-Latch with Asynchronous Reset in VHDL

## Overview
This repository contains the VHDL implementation and simulation of a **T-Latch (Toggle Latch)** featuring an **Asynchronous Reset** and an **Enable Gate**. The project was developed, synthesized, and verified using **AMD Xilinx Vivado Design Suite**.

The design demonstrates high-level Behavioral VHDL modeling and illustrates how Vivado translates behavioral logic into optimized hardware structures (RTL Schematics and Technology Primitive SLICEs).

---

## Key Features
* **Behavioral Design Methodology:** Modeled using VHDL process blocks and internal registers (`Q_int`).
* **Asynchronous Reset (`RST`):** Highest priority reset mechanism to ensure deterministic initialization (`Q = '0'`).
* **Enable Control (`EN`):** Acts as a gating signal to prevent unintended toggling when low.
* **Toggle Operation (`T`):** Toggles the output state ($Q \rightarrow \bar{Q}$) when both $EN=1$ and $T=1$.
* **Complementary Output (`Qbar`):** Directly provides the inverted state of $Q$.

---

## Truth Table

| RST | EN | T | $Q_{next}$ | $Q_{next}'$ ($\bar{Q}$) | Mode / State |
| :-: | :-: | :-: | :-: | :-: | :--- |
| **1** | X | X | **0** | **1** | **Asynchronous Reset** (Highest Priority) |
| **0** | **0** | X | $Q$ | $\bar{Q}$ | **Hold / Disabled** |
| **0** | **1** | **0** | $Q$ | $\bar{Q}$ | **Hold / No Change** |
| **0** | **1** | **1** | $\bar{Q}$ | $Q$ | **Toggle** |

*(Note: `X` represents a Don't Care condition)*

---

