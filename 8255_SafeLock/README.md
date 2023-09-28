# Safe Locking System with 8086 Microprocessor and 8255 PPI

## Project Overview:
This project involves the design and implementation of a safe locking system using an 8086 microprocessor and an 8255 Programmable Peripheral Interface (PPI). The system controls a 7-segment display and a 4x3 keypad for user interaction.

## Functionality:
The safe locking system operates as follows:
1. When the safe is in an unlocked state, the 7-segment display should read "U."

2. While the safe is unlocked, the user can input a 4-digit PIN using the 4x3 keypad and lock the safe by pressing a designated button.

3. When the safe is locked, the 7-segment display should read "L."

4. The locked safe can be accessed using either the PIN used during locking or a special 4-digit master unlock key. Entering either of these PINs will unlock the safe without the need to press a button.

5. After the safe is opened, the system returns to the initial state, allowing the user to lock it again with a different 4-digit PIN.

6. If more than 4 buttons are pressed during PIN entry, the system will reset. To set a new PIN, the '#' key must be pressed, and new numbers can be entered without pressing '#.' This allows for the acceptance of either a 2nd 4-digit PIN or a 3rd 4-digit PIN, depending on user input.

## Implementation Suggestions:
- To simplify the code, consider defining a function for key reading and scanning.
- Ensure that no operations are performed without releasing a button after it has been pressed.
- The 4x3 key scanning circuit and components other than the 8255 can be customized based on your preferences.

