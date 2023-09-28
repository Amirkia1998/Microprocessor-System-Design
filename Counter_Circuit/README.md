# 8086 Microprocessor Counter Circuit

## Problem Statement:
In this lab assignment, the goal is to design a counter circuit using an 8086 Microprocessor and a set of electronic components. The counter circuit should be capable of counting and displaying specific numbers and letters on a 7-segment display based on button inputs.

## Components Used:
- **8086 Microprocessor:** 1 unit
- **74273 Octal D-Type Flip-Flop:** 3 units
- **74154 Demultiplexer:** 1 unit
- **8255 Programmable Peripheral Interface (PPI):** 1 unit
- **Buttons:** 2 pieces
- **7-Segment Display with Common Anode:** 1 unit
- **OR Gate (OR):** 1 unit
- **NOR Gate (NOR):** 1 unit
- **NOT Gate (NOT):** 2 units
- **Pull-down Resistors:** 100 Ω

## Objectives:
1. Configure Port A of the 8255 as an input and Port B as an output.
2. Assign addresses to the ports (Port A at 0300H and other ports at even addresses).
3. Connect buttons to specific pins of Port A of the 8255 with pull-down resistors.
4. Implement button functionality to display numbers and letters on the 7-segment display according to the assigned groups.
5. Provide a reset mechanism triggered by another button press, displaying the number 0 on the display.

In this lab, you will work with these components to build a functional counter circuit. The primary objective is to understand the interfacing of electronic components with an 8086 Microprocessor and achieve the specified counting and display functionality.
