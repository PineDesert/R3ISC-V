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
           , input logic [WIDTH - 1: 0] nextPC
           , output logic [WIDTH - 1 : 0] pc
           );

  always_ff @(posedge clk)
    pc <= nextPC;

endmodule