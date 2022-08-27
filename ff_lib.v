// From Stanford's EE108 library; I might take this down.
// I used it for class and for this summer, but it's definitely not my work.
// It might be helpful to Greig (who I'm sure could write his own flip-flop.)

module dffr #(parameter WIDTH = 1) (
    input clk,
    input r,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);

    always @ (posedge clk) 
        if (r) 
            q <= {WIDTH{1'b0}};
        else
            q <= d;

endmodule
