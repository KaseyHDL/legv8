//============================================================================//
// LEGv8 CPU
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: top.sv
//============================================================================//
module top (
  // inputs
  input  logic CLK,
  input  logic RST_N,
  // outputs

);
  // wires
  logic [31:0] instruction;

  // program counter
  pc pc_u0 (
    // inputs
    .CLK       (CLK),
    .RST_N     (RST_N),
    .NEXT_ADDR (), 
    // outputs
    .INST_ADDR ()
  );

  // add 4
  alu alu_u0 (
    // inputs
    .A        (), 
    .B        (4'h4),
    .ALU_CTRL (4'h2),
    // outputs
    .ALU_OUT  (),
    .ZERO     (/*unused*/)
  );

  // instruction memory
  im im_u0 (
    // inputs
    .INST_ADDR   (), 
    // outputs
    .INSTRUCTION (instruction)
  );

  // register file
  reg_file reg_file_u0 (
    // inputs
    .CLK   (CLK),
    .RST_N (RST_N),
    input  logic        REG_WRITE_C,
    .RD_REG1 (instruction[9:5]),
    .RD_REG2 (),  
    .WR_REG (instruction[4:0]),     
    input  logic [63:0] WR_DATA,
    // outputs
    output logic [63:0] RD_DATA1,
    output logic [63:0] RD_DATA2  
  );  

endmodule
