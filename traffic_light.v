module traffic_light(
    input wire clk,     // System clock
    input wire rst,     // Active-high reset
    // NS direction outputs
    output wire ns_red,
    output wire ns_yellow,
    output wire ns_green,
    // EW direction outputs
    output wire ew_red,
    output wire ew_yellow,
    output wire ew_green
);

    wire [1:0] state; // FSM state signal

    fsm_controller ctrl (
        .clk(clk),
        .rst(rst),
        .state(state)
    );

    decoder dec (
        .state(state),
        .ns_red(ns_red),
        .ns_yellow(ns_yellow),
        .ns_green(ns_green),
        .ew_red(ew_red),
        .ew_yellow(ew_yellow),
        .ew_green(ew_green)
    );

endmodule