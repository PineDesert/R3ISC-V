/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : PcDataPath.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Datapath for PC and next PC state logic
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import PcPkg::*;

module PcDataPath ( input PcSrc_t nextPcSrc
                  , input logic [31: 0] pc
                  , input logic [31 : 0] nextPcOffset
                  , output logic [31 : 0] nextPc
                  );
  always_comb 
  begin : NextPcLogic
    logic [31 : 0] pcIncr;

    unique case (nextPcSrc)
      PcPlus4:
        pcIncr = 32'b4;
      PcBranch:
        pcIncr = nextPcOffset;
    endcase

    nextPc = pc + pcIncr;
  end
endmodule
