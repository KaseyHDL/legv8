//============================================================================//
// Program Counter (PC)
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: pc.sv
//============================================================================//
module pc (
  // inputs
  input  logic        CLK,
  input  logic        RST_N,
  input  logic [63:0] NEXT_ADDR, 
  // outputs
  output logic [63:0] INST_ADDR
);
  // update instruction memory address
  always_ff @(posedge CLK, negedge RST_N) begin
    if (!RST_N) INST_ADDR <= 0;
    else        INST_ADDR <= NEXT_ADDR;
  end

endmodule