/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : AluSrcBMux.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : 2:1 mux to control ALU source, uses an enum control signal
 *
 * License     : MIT
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import CtrlPkg::*;

module AluSrcBMux #(parameter int WIDTH = 32) ( input AluSrcCtrl_t aluSrcSelect
                                               , input logic [WIDTH : 0] regFileB
                                               , input logic [WIDTH : 0] extendImm
                                               , output logic [WIDTH: 0] aluSrcB
                                               );
                   
always_comb
begin: AluSrcBMux
  unique case (aluSrcSelect)
    RegB:
      aluSrcB = regFileB;
    ExtendImm:
      aluSrcB = extendImm;
  endcase
  
end
endmodule
                  