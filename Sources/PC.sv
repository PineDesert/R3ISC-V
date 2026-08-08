/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-v
 * File        : PC.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Program counter, WIDTH bit register, control for next PC
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

module PC #(parameter WIDTH = 32)
           ( input logic clk
           , input logic nReset
           , input logic [WIDTH - 1: 0] nextPC
           , output logic [WIDTH - 1 : 0] PC
           );

  always_ff @(posedge clk or negedge nReset)
  begin
    if (!nReset)
      PC <= '0;
    else
      PC <= nextPC;
  end
endmodule