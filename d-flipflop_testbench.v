`timescale 1ns/1ps
// Testbench for a rising-edge D flip-flop with synchronous reset

module tb_DFF;

  // Testbench-driven signals (inputs to the DUT)
  reg  D;          // drives the D input
  reg  clk;        // drives the clock
  reg  reset;      // drives the synchronous reset

  // Observed signal (output from the DUT)
  wire Q;          // we observe Q

  // Device Under Test (DUT) instantiation
  // Use named connections to avoid order mistakes
  RisingEdgeDFlipFlopSyncReset dut (
    .D(D),
    .clk(clk),
    .sync_reset(reset),
    .Q(Q)
  );

  // Clock generation: 20 ns period (toggle every 10 ns)
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  // Stimulus: drive reset and D over time
  initial begin
    //This is so the EP wave can be generated
    $dumpfile("dump.vcd"); $dumpvars;
  
    // Optional: print changes to the console
    $monitor("t=%0t ns  clk=%b  reset=%b  D=%b  Q=%b", $time, 		clk, reset, D, Q);

    // Initialize
    reset = 1;   // assert reset
    D     = 0;

    // Keep reset high long enough to cover a rising edge
    // Synchronous reset only takes effect on a clock edge
    #25;         // after 25 ns, at least one posedge happened
    reset = 0;   // deassert reset

    // Now drive D through a few patterns
    #20  D = 1;
    #40  D = 0;
    #40  D = 1;
    #40  D = 0;

    // End simulation
    #40  $finish;
  end

endmodule
