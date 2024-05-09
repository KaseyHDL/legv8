//============================================================================//
// Arithmetic Logic Unit (ALU) Control
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: alu_ctrl.sv
//============================================================================//
module alu_ctrl (
  // inputs
  input  logic [10:0] OPCODE, 
  input  logic [ 1:0] ALU_OP,
  // outputs
  output logic [ 3:0] CTRL
);
  // output select
  always_comb begin
    CTRL = 4'b0;
    case (ALU_OP)
      2'b00 : CTRL = 4'b0010;   // ADD
      2'b01 : CTRL = 4'b0111;   // PASS B
      2'b10 : begin
        case (OPCODE)
          ADD : CTRL = 4'b0010; // ADD
          SUB : CTRL = 4'b0110; // SUB
          AND : CTRL = 4'b0000; // AND
          ORR : CTRL = 4'b0001; // ORR                              
        endcase
      end
    endcase
  end

endmodule
