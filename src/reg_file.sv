//============================================================================//
// Registers File // TODO: add file here
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: reg_file.sv
//============================================================================//
module reg_file (
  // inputs
  input  logic        CLK,
  input  logic        RST_N,
  input  logic        REG_WRITE,
  input  logic [ 4:0] RD_REG1,
  input  logic [ 4:0] RD_REG2,  
  input  logic [ 4:0] WR_REG,    
  input  logic [63:0] WR_DATA,
  // outputs
  output logic [63:0] RD_DATA1,
  output logic [63:0] RD_DATA2  
);
  // register file
  logic [63:0] registers [0:31];

  initial begin
    $readmemh("registers.mem", registers);
  end

  // read logic
  always_comb begin
    RD_DATA1 = registers[RD_REG1];
    RD_DATA2 = registers[RD_REG2];    
  end

  // write logic
  always_ff @(posedge CLK) begin
    if (REG_WRITE) registers[WR_REG] <= WR_DATA; 
  end

endmodule
