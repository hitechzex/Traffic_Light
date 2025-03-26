# Traffic_Light

Overview
--------
This project implements a dual-direction traffic light controller in Verilog using a finite state machine to safely manage traffic between North-South and East-West roads, ensuring only one direction has a green light at a time, with yellow-light transitions before switching.

Modules
-------

1. fsm_controller.v
   - Implements the finite state machine (FSM) that cycles through four states:
     - NS Green, EW Red
     - NS Yellow, EW Red
     - NS Red, EW Green
     - NS Red, EW Yellow
   - Each state persists for a fixed number of clock cycles.
   - Counter tracks when to transition to the next state.
   - Outputs a 2-bit `state` signal to represent the current traffic mode.

2. decoder.v
   - Converts the 2-bit FSM state into individual traffic light signals.
   - Provides 6 outputs:
     - NS: ns_red, ns_yellow, ns_green
     - EW: ew_red, ew_yellow, ew_green
   - Ensures safe combinations, e.g., when NS is green, EW is red.

3. traffic_light.v
   - Top-level module that connects the FSM controller and decoder.
   - Takes clock and reset as inputs.
   - Outputs all NS and EW traffic light signals.

4. tb_traffic_light.v
   - Testbench that simulates the clock and reset signals.
   - Observes and prints the traffic light signals for both directions at regular intervals.
   - Displays light transitions in a format that helps verify correct FSM behavior.

Simulation Screenshot
---------------------

[Simulation Waveform](https://github.com/hitechzex/Traffic_Light/blob/main/simulation_screenshot.png?raw=true)
