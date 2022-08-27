module xor_word(
	input [11:0] word,
	input clk, rst, receive_word,
	output reg xor_result, result_out);
	
	parameter MAXIMUM_INDEX = 4'd11;
	parameter MINIMUM_INDEX = 4'd0;
	
	wire [3:0] curr_index, next_index;
	reg [3:0] proto_next_index;
	wire curr_xor;
	wire [11:0] curr_word, next_word;
	
	dffr #(12) word_ff(.clk(clk), .r(rst), .d(next_word), .q(curr_word));
	dffr #(4) index_ff(.clk(clk), .r(rst), .d(next_index), .q(curr_index));
	dffr xor_ff(.clk(clk), .r(rst), .d(xor_result), .q(curr_xor));
	
	always @(*) begin
		if (receive_word) begin
			proto_next_index = MAXIMUM_INDEX - 4'd1;
			result_out = 1'b1;
			xor_result = word[MAXIMUM_INDEX] ^ curr_xor;
		end else if (curr_index == MAXIMUM_INDEX) begin
			proto_next_index = curr_index;
			result_out = 1'b0;
			xor_result = 1'b0;
		end else if (MINIMUM_INDEX < curr_index) begin
			proto_next_index = curr_index - 4'b1;
			result_out = 1'b1;
			xor_result = curr_word[curr_index] ^ curr_xor;
		end else if (MINIMUM_INDEX == curr_index) begin
			proto_next_index = MAXIMUM_INDEX;
			xor_result = curr_word[curr_index] ^ curr_xor;
			result_out = 1'b1;
		end else begin
			proto_next_index = MAXIMUM_INDEX;
			result_out = 1'b0;
			xor_result = 1'b0;
		end
			
	end
	
	// Default the index
	assign next_index = rst ? MAXIMUM_INDEX : proto_next_index;
	// Store word when it comes
	assign next_word = receive_word ? word : curr_word;
	
	endmodule
	

			
					