// Example 13a: Hex to 7-segment decoder; a-g active low.
// this order changed for for DE10-lite

// Belongs to Greig Scott

module hex7segA (
input wire [3:0] x,
output reg [6:0] a_to_g
);

always @(*)
	case(x)
	0: a_to_g = 7'b1000000;
	1: a_to_g = 7'b1111001; 
	2: a_to_g = 7'b0100100; 
	3: a_to_g = 7'b0110000; 
	4: a_to_g = 7'b0011001; 
	5: a_to_g = 7'b0010010; 
	6: a_to_g = 7'b0000010; 
	7: a_to_g = 7'b1111000; 
	8: a_to_g = 7'b0000000;
	9: a_to_g = 7'b0010000; 
	'hA: a_to_g = 7'b0001000; 
	'hB: a_to_g = 7'b0000011; 
	'hC: a_to_g = 7'b1000110; 
	'hD: a_to_g = 7'b0100001; 
	'hE: a_to_g = 7'b0000110; 
	'hF: a_to_g = 7'b0001110; 
	default: a_to_g = 7'b1000000;  // 0
endcase
endmodule

	