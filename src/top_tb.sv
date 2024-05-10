//============================================================================//
// LEGv8 Top Testbench
//----------------------------------------------------------------------------//
// Engineer: Kasey Hill
// Filename: top_tb.sv
//============================================================================//
`timescale 1ns / 1ns

module top_tb ();

  logic CLK;
  logic RST_N;

  parameter PERIOD = 10;

  top uut (
    .CLK   (CLK),
    .RST_N (RST_N)
  );

  initial begin
    CLK   = 0;
    RST_N = 0;
    #1 RST_N = 1;
  end

  always #(PERIOD/2) CLK = ~CLK;

endmodule
