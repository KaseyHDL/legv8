//============================================================================//
// Shift Left 2
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: shift_left2.sv
//============================================================================//
module shift_left2 (
  // inputs
  input  logic [63:0] SIGN_EXTEND, 
  // outputs
  output logic [63:0] SHIFT_OUT
);

  assign SHIFT_OUT = SIGN_EXTEND << 2;

endmodule
