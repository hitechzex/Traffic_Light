module decoder(
    input wire [1:0] state,         // FSM state input
    output reg ns_red, ns_yellow, ns_green, // NS light signals
    output reg ew_red, ew_yellow, ew_green  // EW light signals
);

    always @(*) begin
        // Clear all light outputs at the beginning
        ns_red = 0; ns_yellow = 0; ns_green = 0;
        ew_red = 0; ew_yellow = 0; ew_green = 0;

        // Decode state into proper light combinations
        case (state)
            2'd0: begin // NS_GREEN
                ns_green = 1;  // NS go
                ew_red = 1;    // EW stop
            end
            2'd1: begin // NS_YELLOW
                ns_yellow = 1; // NS prepare to stop
                ew_red = 1;    // EW still stop
            end
            2'd2: begin // EW_GREEN
                ns_red = 1;    // NS stop
                ew_green = 1;  // EW go
            end
            2'd3: begin // EW_YELLOW
                ns_red = 1;    // NS still stop
                ew_yellow = 1; // EW prepare to stop
            end
            default: begin
			    // Failsafe condition: both directions red - avoid collisions
                ns_red = 1;
                ew_red = 1;
            end
        endcase
    end
endmodule