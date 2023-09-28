# 8253 or 8254 Music Track Playback Circuit

## Problem Statement:
In this lab assignment, the goal is to design a music track playback circuit using an 8086 Microprocessor and either an 8253 or 8254 Programmable Interval Timer (PIT). The circuit should play a musical piece based on the notes and durations provided in a designated file (music.xlsx). Students have the option to select a different musical piece to play by specifying it in the experiment.

## Components Used:
- **8086 Microprocessor (µI):** 1 unit
- **74273 Octal D-Type Flip-Flop:** 3 units
- **74154 Demultiplexer:** 1 unit
- **8253 or 8254 Programmable Interval Timer (PIT):** 1 unit
- **Speaker:** 1 unit

## Objectives:
1. Play a musical piece provided in the "music.xlsx" file using either an 8253 or 8254 integrated circuit. Students can choose a different piece of music for the experiment, but they should specify the chosen piece in the lab documentation.
2. Configure the 8253 or 8254 IC to be located at consecutive single addresses in the I/O space, starting from address 8253 A9H.
3. Connect a square signal generator with a frequency of 240 kHz to the CLK input of the 8253/8254 IC.
4. Implement the necessary logic to play the musical notes and durations as specified in the "music.xlsx" file.
5. Create a DELAY function using the LOOP command to control the note playing time.
6. Play the selected music track repeatedly in the main procedure using COUNTER 0.

Please note that counter latch and read-back commands for 8253/8254 may not work in the simulation, and the OUT output will be connected to the speaker for audio output.

For detailed information about the musical piece, notes, and durations, refer to the picture shared below.

*Note: The 8254 IC is an advanced version of the 8253 with the same pin configuration.*


