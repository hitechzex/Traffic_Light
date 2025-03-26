`timescale 1ns/1ps

module tb_traffic_light;

    reg clk, rst;
    wire ns_red, ns_yellow, ns_green;
    wire ew_red, ew_yellow, ew_green;

	// Instantiate the DUT
    traffic_light DUT (
        .clk(clk),
        .rst(rst),
        .ns_red(ns_red),
        .ns_yellow(ns_yellow),
        .ns_green(ns_green),
        .ew_red(ew_red),
        .ew_yellow(ew_yellow),
        .ew_green(ew_green)
    );

    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light);
    end

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Starting dual-road traffic light simulation...");
        clk = 0;
        rst = 1;
        #20;
        rst = 0;
		
        // Run simulation for several FSM cycles
        repeat (40) begin
            #10;
            $display("Time: %0t | NS: R=%b Y=%b G=%b | EW: R=%b Y=%b G=%b",
                     $time, ns_red, ns_yellow, ns_green, ew_red, ew_yellow, ew_green);
        end

        $finish;
    end

endmodule