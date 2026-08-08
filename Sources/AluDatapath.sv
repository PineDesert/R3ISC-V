/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : AluDatapath.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Description
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import AluPkg::*;

module AluDataPath ( input AluSrc_t aluSrc
                   , input logic [31 : 0] regFileA
                   , input logic [31 : 0] regFileB
                   , input logic [31 : 0] extendImm
                   , output logic [31 : 0] aluSrcA
                   , output logic [31: 0] aluSrcB
                   );
always_comb
begin: AluSrcControl
  aluSrcA = regFileA;

  unique case aluSrc
    RegB:
      aluSrcB = regFileB;
    ExtendImm:
      aluSrcB = extendImm;
  endcase
  
end

endmodule
                  