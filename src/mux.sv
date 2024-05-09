//============================================================================//
// Multiplexor
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: mux.sv
//============================================================================//
module mux #(parameter WIDTH = 64)(
	input  logic [WIDTH-1:0] a, // in a
	input  logic [WIDTH-1:0] b, // in b
	input  logic             s, // select
	output logic [WIDTH-1:0] z  // out
);
  // output select
	always_comb begin
		unique case (s)
			1'b0 : z = a;
			1'b1 : z = b;
		endcase
	end

endmodule
