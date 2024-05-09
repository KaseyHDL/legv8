//============================================================================//
// LEGv8 Datapath
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: datapath.sv
//============================================================================//
module datapath (
  // inputs
  input  logic        CLK,
  input  logic        RST_N,
  // outputs
	output logic [10:0] OPCODE,
  input  logic        REG_2_LOC,
  input  logic        ALU_SRC,
  input  logic        MEM_TO_REG,
  input  logic        REG_WRITE,
  input  logic        MEM_READ,
  input  logic        MEM_WRITE,
  input  logic        BRANCH,
  input  logic        UNCOND_BRANCH,
  input  logic [ 1:0] ALU_OP
);
  // wires
  logic        pc_src;
  logic        branch_and;
  logic        zero_flag;
  logic [63:0] next_pc;
  logic [63:0] alu_result;
  logic [63:0] rd_data_mem;
  logic [63:0] pc;
  logic [63:0] add_alu_result;
  logic [63:0] add_4;  
  logic [31:0] instruction;
  logic [ 4:0] rd_reg2;
  logic [63:0] reg_wr_data;
  logic [63:0] rd_data1;
  logic [63:0] rd_data2;  
  logic [63:0] alu_src_out;
  logic [ 3:0] ctrl;
  logic [63:0] sign_extend_out;
  logic [63:0] shift_left_out;

  // program counter
  pc pc_u0 (
    .CLK       (CLK),
    .RST_N     (RST_N),
    .NEXT_ADDR (next_pc), 
    .INST_ADDR (pc)
  );

  // add 4
  alu alu_add_u0 (
    .A        (pc), 
    .B        (4),
    .ALU_CTRL (4'h2),
    .ALU_OUT  (add_4),
    .ZERO     (/*open*/)
  );

  // instruction memory
  im im_u0 (
    .INST_ADDR   (pc), 
    .INSTRUCTION (instruction)
  );

  assign OPCODE = instruction[31:21];

  // Reg2Loc mux
  mux #(.WIDTH(5)) mux_reg_2_loc (
    .a (instruction[20:16]),
    .b (instruction[4:0]),
    .s (REG_2_LOC),
    .z (rd_reg2)
  );

  // registers
  reg_file reg_file_u0 (
    .CLK       (CLK),
    .RST_N     (RST_N),
    .REG_WRITE (REG_WRITE),
    .RD_REG1   (instruction[9:5]),
    .RD_REG2   (rd_reg2),  
    .WR_REG    (instruction[4:0]),    
    .WR_DATA   (reg_wr_data),
    .RD_DATA1  (rd_data1),
    .RD_DATA2  (rd_data2)  
  );

  // sign-extend
  sign_extend sign_extend_u0 (
    .INSTRUCTION     (instruction), 
    .SIGN_EXTEND_OUT (sign_extend_out)
  );

  // ALUSrc mux
  mux #(.WIDTH(64)) mux_alu_src (
    .a (rd_data2),
    .b (sign_extend_out),
    .s (ALU_SRC),
    .z (alu_src_out)
  );

  // ALU control
  alu_ctrl alu_ctrl_u0 (
    .OPCODE (OPCODE), 
    .ALU_OP (ALU_OP),
    .CTRL   (ctrl)
  );

  // ALU
  alu alu_u0 (
    .A        (rd_data1), 
    .B        (alu_src_out),
    .ALU_CTRL (ctrl),
    .ALU_OUT  (alu_result),
    .ZERO     (zero_flag)
  );

  // shift left 2
  shift_left2 shift_left2_u0 (
    .SIGN_EXTEND (sign_extend_out), 
    .SHIFT_OUT   (shift_left_out)
  );  

  // add ALU
  alu alu_add_u1 (
    .A        (pc), 
    .B        (shift_left_out),
    .ALU_CTRL (4'h2),
    .ALU_OUT  (add_alu_result),
    .ZERO     (/*open*/)
  );

  // data memory
  data_mem data_mem_u0 (
    .CLK       (CLK),
    .RST_N     (RST_N),
    .MEM_WRITE (MEM_WRITE),
    .MEM_READ  (MEM_READ),
    .ADDR      (alu_result),
    .WR_DATA   (rd_data2),
    .RD_DATA   (rd_data_mem)
  );

  // MemtoReg mux
  mux #(.WIDTH(64)) mux_mem_to_reg (
    .a (alu_result),
    .b (rd_data_mem),
    .s (MEM_TO_REG),
    .z (reg_wr_data)
  );

  // and
  and and_u0 (branch_and, BRANCH, zero_flag);

  // or
  or or_u0 (pc_src, UNCOND_BRANCH, branch_and);

  // PCSrc mux
  mux #(.WIDTH(64)) mux_pc_src (
    .a (add_4),
    .b (add_alu_result),
    .s (pc_src),
    .z (next_pc)
  );

endmodule
