/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-v
 * File        : Pc.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Program counter, WIDTH bit register, control for next PC
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

module Pc #(parameter WIDTH = 32)
           ( input logic clk
           , input logic nReset
           , input logic [WIDTH - 1: 0] nextPc
           , output logic [WIDTH - 1 : 0] pc
           );

  always_ff @(posedge clk or negedge nReset)
  begin
    if (!nReset)
      pc <= WIDTH'(0);
    else // update PC
      pc <= nextPc;
  end

endmodule