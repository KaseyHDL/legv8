//============================================================================//
// Data Memory
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: data_mem.sv
//============================================================================//
module data_mem (
  // inputs
  input  logic        CLK,        
  input  logic        RST_N,      
  input  logic        MEM_WRITE,
  input  logic        MEM_READ, 
  input  logic [63:0] ADDR,
  input  logic [63:0] WR_DATA,    
  // outputs
  output logic [63:0] RD_DATA
);
  // register file
  logic [63:0][31:0] data_memory; // TODO: make sure this is right

  // read logic
  always_comb begin
    if (MEM_READ) RD_DATA = data_memory[ADDR];
  end

  // write logic
  always_ff @(posedge CLK, negedge RST_N) begin
    if      (!RST_N)    data_memory       <= 0;
    else if (MEM_WRITE) data_memory[ADDR] <= WR_DATA; 
  end

endmodule
