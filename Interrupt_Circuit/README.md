# Interrupt Circuit Design for Serial Communication with 8086 Microprocessor

## Problem Statement:
In this lab, you will design an interrupt-driven circuit for serial communication using various components and simulate it in the Proteus environment. The lab is worth 100 points.

## Components Used:
- Utilize the following circuit components, and you have the flexibility to add new components as needed:
  1. 8086 Microprocessor x 1
  2. 74273 Octal D-Type Flip-Flop x 3
  3. 74154 Demultiplexer x 1
  4. 8251 Programmable Peripheral Interface (PPI) x 1
  5. 8259A Programmable Interrupt Controller (PIC) x 1
  6. Virtual Terminal x 1

## Requirements:
1. Create an interrupt-driven circuit that interfaces with the 8251 PPI and 8259A PIC for serial communication. The program should handle both receiving and sending serial data.
2. Implement interrupt subroutines for serial data reception and transmission. Place the receiving interrupt subroutine in compartment number 78H of the interrupt vector table and the transmitting interrupt subroutine in compartment number 79H.
3. Configure the 8259A and 8251 for interrupt use, ensuring that the interrupts are edge-triggered.
4. The serial data receiving interrupt subroutine should store the ASCII characters received in an array and send back all elements of the array when 5 characters have been received. For example, if the characters 'a', 'b', 'c', 'd', 'e' are printed sequentially on the virtual terminal, the 8086 should respond with 'bcdef' when the 'e' character arrives.
5. Set the virtual terminal to the following parameters: 9600 baud, 8 data bits, and no parity.
6. When reading data from the 8251, run the `SHR GET,1` command after the `IN AL,DATA_ADDR` command. This step is essential to avoid potential simulation environment model errors.

## Circuit Structure:
- Refer to the provided image for the circuit structure, including some missing connections, in the lab folder.

For detailed instructions and assembly code, please refer to the respective directories within this repository.
