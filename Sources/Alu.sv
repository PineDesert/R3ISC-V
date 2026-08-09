/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : ALU.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Simple ALU for R3ISC-V implementation
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import CtrlPkg::*;

module Alu ( input AluOpCtrl_t opCtrl
           , input logic [31 : 0] srcA
           , input logic [31 : 0] srcB
           , output logic [31 : 0] result
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
    default:
      result = '0;
  endcase
end

zeroFlag = (result == '0;);
endmodule   