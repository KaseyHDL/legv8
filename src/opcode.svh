//============================================================================//
// OPCODE Header File
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: opcode.sv
//============================================================================//
// R-format
localparam ADD  = 11'h458;
localparam SUB  = 11'h658;
localparam AND  = 11'h450;
localparam ORR  = 11'h550;

// D-format
localparam LDUR = 11'h7C2;
localparam STUR = 11'h7C0;

// Branch-format
localparam B    = 11'h0A0;
localparam CBZ  = 11'h0B4;
