module fsm_controller(
    input wire clk,       // Clock signal
    input wire rst,       // Reset signal (active high)
    output reg [1:0] state  // Current state output
);

    // FSM state encoding
    localparam NS_GREEN  = 2'd0,  // North-South green, East-West red
               NS_YELLOW = 2'd1,  // North-South yellow, East-West red
               EW_GREEN  = 2'd2,  // North-South red, East-West green
               EW_YELLOW = 2'd3;  // North-South red, East-West yellow

    reg [3:0] counter;  // 4-bit counter to hold state duration
	
    always @(posedge clk or posedge rst) begin
        if (rst) begin
		    // On reset, go to initial state
            state <= NS_GREEN;
            counter <= 0;
        end else begin
            counter <= counter + 1;
			// When counter reaches max duration, go to next state
            if (counter == 4'd9) begin
                state <= (state == EW_YELLOW) ? NS_GREEN : state + 1;
                counter <= 0;
            end
        end
    end
endmodule