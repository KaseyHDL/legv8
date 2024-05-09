//============================================================================//
// LEGv8 Top
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: top.sv
//============================================================================//
module top (
  input logic CLK,
  input logic RST_N
);
  // wires
  logic [10:0] opcode;       
  logic        reg_2_loc;    
  logic        alu_src;      
  logic        mem_to_reg;   
  logic        reg_write;    
  logic        mem_read;     
  logic        mem_write;    
  logic        branch;       
  logic        uncond_branch;
  logic [1:0]  alu_op;       

  control control_u0 (
  	.OPCODE        (opcode),
    .REG_2_LOC     (reg_2_loc),
    .ALU_SRC       (alu_src),
    .MEM_TO_REG    (mem_to_reg),
    .REG_WRITE     (reg_write),
    .MEM_READ      (mem_read),
    .MEM_WRITE     (mem_write),
    .BRANCH        (branch),
    .UNCOND_BRANCH (uncond_branch),
    .ALU_OP        (alu_op)
  );

  datapath datapath_u0 (
    .CLK           (CLK),
    .RST_N         (RST_N),
  	.OPCODE        (opcode),
    .REG_2_LOC     (reg_2_loc),
    .ALU_SRC       (alu_src),
    .MEM_TO_REG    (mem_to_reg),
    .REG_WRITE     (reg_write),
    .MEM_READ      (mem_read),
    .MEM_WRITE     (mem_write),
    .BRANCH        (branch),
    .UNCOND_BRANCH (uncond_branch),
    .ALU_OP        (alu_op)
  );  

endmodule
