/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : RegFileWriteSrcMux.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Contains the write data source mux for the reg file
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import CtrlPkg::*;

module RegFileWriteSrcMux #(parameter int WIDTH = 32) ( input RegFileWriteSrcCtrl_t writeSrc
                                                     , input logic [WIDTH - 1 : 0] aluResult
                                                     , input logic [WIDTH - 1 : 0] dataMem
                                                     , input logic [WIDTH - 1 : 0] pcPlus4
                                                     , output logic [WIDTH - 1 : 0] regWriteData
                                                     );

  always_comb 
  begin
    unique case (writeSrc)
      AluResult:
        regWriteData = aluResult;
      DataMem:
        regWriteData = dataMem;
      PcPlus4:
        regWriteData = PcPlus4;
    endcase
  end
endmodule