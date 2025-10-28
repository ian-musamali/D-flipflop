# Rising Edge D Flip-Flop with Synchronous Reset (Verilog)

## Overview
This project implements a **rising-edge triggered D flip-flop** with a **synchronous reset** in Verilog.  
The circuit stores a single-bit input (`D`) on every rising edge of the clock (`clk`).  
If the synchronous reset (`sync_reset`) is active (logic 1) at that clock edge, the output (`Q`) is cleared to 0 instead of capturing `D`.

A testbench is included to simulate and verify the flip-flop’s behavior.

---

## File Structure
| File | Description |
|------|--------------|
| `RisingEdge_DFlipFlop_SyncReset.v` | Verilog module implementing the D flip-flop |
| `DFlipFlop_Testbench.v` | Testbench for generating clock, reset, and input signals |
| `waveform.png` | Screenshot of the simulation waveform (EPWave) |

---

## How It Works
### **Main Module (`RisingEdge_DFlipFlop_SyncReset.v`)**
- **`@(posedge clk)`**: The block runs only on the rising edge of the clock.  
- **Synchronous Reset**:  
  If `sync_reset == 1`, the flip-flop clears `Q` to 0 on that clock edge.  
  Otherwise, it stores the current `D` value into `Q`.

What I Learned
- @(posedge clk) runs only on clock rising edges.
- Synchronous reset waits for a clock edge; asynchronous doesn’t.
-	<= (non-blocking) is for sequential logic; = is for combinational.
-	forever #10 clk = ~clk; makes a 20 ns clock period.
-	“DUT” just means the circuit being tested.
-	Always take a screenshot of the waveform (waveform.png) instead of trying to upload EPWave files.
