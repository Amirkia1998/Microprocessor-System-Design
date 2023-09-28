# Memory Address Resolution with 8086 Microprocessor

## Project Overview:
This project involves designing a memory address resolution circuit for an 8086 microprocessor. The system includes a ROM block and a RAM block, and it ensures proper address separation and resolution for accessing these memory units.

## Memory Organization:
- **ROM Block:** Four 27C128 EPROMs, each with a capacity of 16KB, are used to create the ROM block. The ROM block is divided into two sections:
  - **ROM0x:** ICs placed at low addresses of the ROM block.
  - **ROM1x:** ICs placed at higher addresses of the ROM block.
  
- **RAM Block:** Two 62256 SRAMs, each with a capacity of 32KB, are used to create the RAM block.
  
## Memory Device Names:
- **RxMx0:** ICs placed at dual addresses.
- **RxMx1:** ICs placed at single addresses.

## Circuit Design:
1. Ensure that the microprocessor's address (on the ADR[0-19] path), data (on the AD[0-15] path), and control signals (BHE, WR, RD, M/IO) are properly separated and maintained.

2. Utilize isolated I/O mapping and separate address decoding for even and odd banks.

3. Design the address parsing circuit to integrate address resolution with memory units.

4. Make all necessary connections between the circuit and the microprocessor.

## Content Generation:
- Create binary content files named "00.bin," "01.bin," "10.bin," and "11.bin" for the ROMs.

## Testing:
- Use the binary content files to program the ROMs.
- Develop assembly code that calls subroutines located at specific segment:offset pairs within the ROM block.
- These subroutines should write values to low addresses of the RAM block.
- Test the accuracy of your address resolution circuit by using these subroutines.


