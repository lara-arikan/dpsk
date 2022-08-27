`timescale 1ns / 1ps

module top_tb ();

reg clk1, rst, load;
wire demodulated, neg_demodulated, new_word;
	
top dut(clk1, rst, load, demodulated, neg_demodulated, new_word);


// Drive clock
initial forever begin
	clk1 = 0;
   #5;
   clk1 = 1;
   #5;
 end

initial begin
rst = 0;

// Apply reset pulse
#10 rst = 1;
#10 rst = 0;
// Initialize
#10 load = 1;
#10 load = 0;
// Observe behavior for a long time
#1000

$stop;

end

endmodule