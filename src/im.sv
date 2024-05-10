//============================================================================//
// Instruction Memory (IM)
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: im.sv
//============================================================================//
module im (
  // inputs
  input  logic [63:0] INST_ADDR, 
  // outputs
  output logic [31:0] INSTRUCTION
);
  // load instruction memory
  logic [31:0] inst_mem [15:0];

  initial begin
    $readmemh("inst_mem.mem", inst_mem);
  end

  // instruction select
  assign INSTRUCTION = inst_mem[INST_ADDR/4]; // TODO: byte addressing

endmodule
