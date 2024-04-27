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
  logic [7:0] inst_mem [0:31];

  initial begin
    $readmemh("inst_mem.mem", inst_mem);
  end

  // instruction select
  assign INSTRUCTION = inst_mem[INST_ADDR];

endmodule
