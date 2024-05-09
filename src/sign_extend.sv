//============================================================================//
// Sign Extention 
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: sign_extend.sv
//============================================================================//
module sign_extend (
  // inputs
  input  logic [31:0] INSTRUCTION, 
  // outputs
  output logic [63:0] SIGN_EXTEND_OUT
);
  // output select
  always_comb begin // TODO: this logic might be wrong
    SIGN_EXTEND_OUT = 64'b0;
    case (INSTRUCTION[31:21])
      LDUR, STUR : SIGN_EXTEND_OUT = {32{INSTRUCTION[31]}, INSTRUCTION};
      CBZ        : SIGN_EXTEND_OUT = {32{INSTRUCTION[31]}, INSTRUCTION};
      end
    endcase
  end

endmodule
