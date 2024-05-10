//============================================================================//
// Arithmetic Logic Unit (ALU)
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: alu.sv
//============================================================================//
module alu (
  // inputs
  input  logic [63:0] A, 
  input  logic [63:0] B,
  input  logic [ 3:0] ALU_CTRL,
  // outputs
  output logic [63:0] ALU_OUT,
  output logic        ZERO
);
  // output select
  always_comb begin
    ALU_OUT = 0;
    case (ALU_CTRL)
      4'd0  : ALU_OUT =   A & B;  // AND
      4'd1  : ALU_OUT =   A | B;  // ORR
      4'd2  : ALU_OUT =   A + B;  // ADD
      4'd6  : ALU_OUT =   A - B;  // SUB     
      4'd7  : ALU_OUT =       B;  // PASS B
      4'd12 : ALU_OUT = ~(A | B); // NOR      
    endcase
  end

  // zero flag
  assign ZERO = (ALU_OUT == 0);   

endmodule
