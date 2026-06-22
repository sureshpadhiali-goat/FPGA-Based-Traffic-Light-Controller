# FPGA Implementation Guide

## Target FPGA Boards

This project can be implemented on:

* Xilinx Artix-7
* Xilinx Spartan-6
* Xilinx Spartan-7
* Intel Cyclone Series
* Intel MAX Series

---

## Design Flow

Specification
↓
FSM Design
↓
RTL Coding
↓
Simulation
↓
Synthesis
↓
RTL Schematic
↓
Implementation
↓
Bitstream Generation
↓
FPGA Programming

---

## Inputs

clk
rst

---

## Outputs

ns_light[2:0]
ew_light[2:0]

---

## LED Mapping Example

North-South Road

ns_light[2] → Green LED
ns_light[1] → Yellow LED
ns_light[0] → Red LED

East-West Road

ew_light[2] → Green LED
ew_light[1] → Yellow LED
ew_light[0] → Red LED

---

## Hardware Behavior

State S0

NS = GREEN
EW = RED

State S1

NS = YELLOW
EW = RED

State S2

NS = RED
EW = GREEN

State S3

NS = RED
EW = YELLOW

---

## Verification Checklist

✓ Reset works

✓ FSM transitions correctly

✓ No conflicting GREEN signals

✓ Timer operates correctly

✓ Waveform verified in GTKWave

✓ Synthesizable RTL
