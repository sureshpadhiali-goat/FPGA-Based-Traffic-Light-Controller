# FPGA-Based Traffic Light Controller

## Project Objective

Design a Traffic Light Controller using Verilog HDL and Finite State Machine (FSM) architecture.

The controller manages two roads:

* North-South (NS)
* East-West (EW)

At no time should both directions have GREEN signals simultaneously.

---

# Traffic Light Encoding

Each traffic light consists of 3 bits:

| Bit Pattern | Meaning |
| ----------- | ------- |
| 3'b100      | GREEN   |
| 3'b010      | YELLOW  |
| 3'b001      | RED     |

Example:

NS = 3'b100

means North-South road has GREEN signal.

---

# State Definition

## State S0

North-South : GREEN

East-West : RED

Duration : 5 clock cycles

---

## State S1

North-South : YELLOW

East-West : RED

Duration : 2 clock cycles

---

## State S2

North-South : RED

East-West : GREEN

Duration : 5 clock cycles

---

## State S3

North-South : RED

East-West : YELLOW

Duration : 2 clock cycles

---

# State Transition Sequence

S0 → S1 → S2 → S3 → S0

The sequence repeats continuously.

---

# State Encoding

| State | Binary |
| ----- | ------ |
| S0    | 00     |
| S1    | 01     |
| S2    | 10     |
| S3    | 11     |

---

# State Table

| Current State | NS Light | EW Light | Next State |
| ------------- | -------- | -------- | ---------- |
| S0            | GREEN    | RED      | S1         |
| S1            | YELLOW   | RED      | S2         |
| S2            | RED      | GREEN    | S3         |
| S3            | RED      | YELLOW   | S0         |

---

# FSM Type

Moore FSM

Reason:

Outputs depend only on the current state.

They do not depend directly on any input signal.

---

# Design Inputs

| Signal | Description       |
| ------ | ----------------- |
| clk    | System Clock      |
| rst    | Active High Reset |

---

# Design Outputs

| Signal        | Description        |
| ------------- | ------------------ |
| ns_light[2:0] | North-South Signal |
| ew_light[2:0] | East-West Signal   |

---

# Design Requirements

1. Only one direction can have GREEN at a time.
2. GREEN must always transition through YELLOW before RED.
3. FSM must continuously cycle through all states.
4. Reset should return FSM to S0.
5. Design must be synthesizable on FPGA.

---

# Future Enhancements

* Pedestrian Crossing Button
* Emergency Vehicle Priority
* Traffic Density Sensor
* Adaptive Signal Timing
* Seven Segment Countdown Display
