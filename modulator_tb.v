`timescale 1ns / 1ps

module modulator_tb ();

reg clk, rst, load;
wire xor_result, result_out;
	
modulator dut(clk, rst, load, result_out, xor_result);


// Drive clock
initial forever begin
	clk = 0;
   #5;
   clk = 1;
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