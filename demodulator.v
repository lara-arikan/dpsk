module demodulator (
	input inbit, clk, rst, result_out,
	output xor_bit);

// Reverse operation of xor_word to decode DPSK'd input
// Output at 10 MHz with 120 MHz PLL clock in the rest of the project
	
	wire curr_bit;
	
	dffr delay_ff(.clk(clk), .r(rst), .d(inbit), .q(curr_bit));
	
	// If result not out yet, simply pass 0
	assign xor_bit = result_out ? curr_bit ^ inbit : 1'b0;
	
endmodule
