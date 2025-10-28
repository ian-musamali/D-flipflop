// Verilog code for D Flip-Flop
// This version triggers on the rising edge of the clock
// and includes a synchronous reset (reset happens only on clock edge)

module RisingEdge_DFlipFlop_SyncReset(D, clk, sync_reset, Q);

    // Declare inputs
    input D;            // Data input — the value to be stored
    input clk;          // Clock signal — flip-flop updates on rising edge
    input sync_reset;   // Synchronous reset — only active on clock edge

    // Declare output
    output reg Q;       // Output Q must be a register because it changes inside an always block

    // Always block executes at every rising edge of the clock
    always @(posedge clk)
    begin
        // Check if reset is active
        if (sync_reset == 1'b1)
            Q <= 1'b0;   // Reset Q to 0 (synchronous, happens only when clock rises)
        else
            Q <= D;      // Otherwise, capture the input D into Q
    end

endmodule
