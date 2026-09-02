/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R2ISC-V
 * File        : ALU.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Simple ALU for R2ISC-V implementation
 *
 * License     : MIT
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import CtrlPkg::*;

module Alu #(parameter int WIDTH = 32) ( input AluOpCtrl_t opCtrl
                                       , input logic [WIDTH - 1 : 0] srcA
                                       , input logic [WIDTH - 1 : 0] srcB
                                       , output logic [WIDTH - 1 : 0] result
                                       , output logic zeroFlag
                                       );

always_comb
begin
  unique case (opCtrl)
    Add:
      result = srcA + srcB; 
    Sub:
      result = srcA - srcB;
    And:
      result = srcA & srcB;
    Or:
      result = srcA | srcB;
    Bypass: 
      result = srcA;
    Illegal:
      result = srcA; 
    default:
      result = srcA;
  endcase
  zeroFlag = (result == '0) ? 1'b1 : 1'b0;
end



endmodule   