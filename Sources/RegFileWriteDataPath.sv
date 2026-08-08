/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : RegFileWriteDataPath.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Contains the write data source logic for the reg file
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import RegFilePackage::*;

module RegFileWriteDataPath ( input RegFileWriteSrc writeSrc
                            , input logic [31 : 0] aluResult
                            , input logic [31 : 0] dataMem
                            , input logic [31 : 0] PcPlus4
                            , output logic [31 : 0] regWriteData
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