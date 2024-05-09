//============================================================================//
// LEGv8 Control
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: control.sv
//============================================================================//
module control (
  // inputs
	input  logic [10:0] OPCODE,
  // outputs
  output logic        REG_2_LOC,
  output logic        ALU_SRC,
  output logic        MEM_TO_REG,
  output logic        REG_WRITE,
  output logic        MEM_READ,
  output logic        MEM_WRITE,
  output logic        BRANCH,
  output logic        UNCOND_BRANCH,
  output logic [1:0]  ALU_OP
);

	always_comb begin
		case (OPCODE)
      ADD, SUB, AND, ORR : begin // R-format
        REG_2_LOC     = 1'b0;
        ALU_SRC       = 1'b0;
        MEM_TO_REG    = 1'b0;
        REG_WRITE     = 1'b1; 
        MEM_READ      = 1'b0;
        MEM_WRITE     = 1'b0;
        BRANCH        = 1'b0;
        UNCOND_BRANCH = 1'b0;      
        ALU_OP        = 2'b10;
      end

      LDUR : begin // LDUR
        REG_2_LOC     = 1'b?;
        ALU_SRC       = 1'b1;
        MEM_TO_REG    = 1'b1;
        REG_WRITE     = 1'b1;
        MEM_READ      = 1'b1;
        MEM_WRITE     = 1'b0;
        BRANCH        = 1'b0;
        UNCOND_BRANCH = 1'b0;        
        ALU_OP        = 2'b00;
      end

      STUR : begin // STUR
        REG_2_LOC     = 1'b1;
        ALU_SRC       = 1'b1;
        MEM_TO_REG    = 1'b?;
        REG_WRITE     = 1'b0;
        MEM_READ      = 1'b0;
        MEM_WRITE     = 1'b1;
        BRANCH        = 1'b0;
        UNCOND_BRANCH = 1'b0;        
        ALU_OP        = 2'b00;
      end

      CBZ : begin // CBZ
        REG_2_LOC     = 1'b1;
        ALU_SRC       = 1'b0;
        MEM_TO_REG    = 1'b?;
        REG_WRITE     = 1'b0;
        MEM_READ      = 1'b0;
        MEM_WRITE     = 1'b0;
        BRANCH        = 1'b1;
        UNCOND_BRANCH = 1'b0;    
        ALU_OP        = 2'b01;
      end

      B : begin // B
        REG_2_LOC     = 1'b1;
        ALU_SRC       = 1'b0;
        MEM_TO_REG    = 1'b?;
        REG_WRITE     = 1'b0;
        MEM_READ      = 1'b0;
        MEM_WRITE     = 1'b0;
        BRANCH        = 1'b1;
        UNCOND_BRANCH = 1'b1;        
        ALU_OP        = 2'b01;
      end      

      default : begin
        REG_2_LOC     = 1'b?;
        ALU_SRC       = 1'b?;
        MEM_TO_REG    = 1'b?;
        REG_WRITE     = 1'b?;
        MEM_READ      = 1'b?;
        MEM_WRITE     = 1'b?;
        BRANCH        = 1'b?;
        UNCOND_BRANCH = 1'b?;        
        ALU_OP        = 2'b??;   
      end
		endcase
	end

endmodule
