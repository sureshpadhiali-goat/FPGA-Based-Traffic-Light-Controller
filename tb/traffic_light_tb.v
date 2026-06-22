`timescale 1ns/1ps

module traffic_light_tb;

    //-----------------------------------------
    // Testbench Signals
    //-----------------------------------------

    reg clk;
    reg rst;

    wire [2:0] ns_light;
    wire [2:0] ew_light;

    //-----------------------------------------
    // DUT Instantiation
    //-----------------------------------------

    traffic_light_controller dut (
        .clk(clk),
        .rst(rst),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

    //-----------------------------------------
    // Clock Generation
    //-----------------------------------------

    always #5 clk = ~clk;

    //-----------------------------------------
    // Test Sequence
    //-----------------------------------------

    initial
    begin

        clk = 0;
        rst = 1;

        // Hold reset
        #20;

        rst = 0;

        // Run simulation
        #300;

        $finish;

    end

    //-----------------------------------------
    // Monitor Outputs
    //-----------------------------------------

    initial
    begin
        $monitor(
            "Time=%0t | Reset=%b | NS=%b | EW=%b",
            $time,
            rst,
            ns_light,
            ew_light
        );
    end
//-----------------------------------------
// VCD Dump
//-----------------------------------------

initial
begin
    $dumpfile("sim/traffic.vcd");
    $dumpvars(0, traffic_light_tb);
end
endmodule
