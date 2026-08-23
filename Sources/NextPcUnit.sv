/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : NextPcMux.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Datapath for PC and next PC state logic
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import CtrlPkg::*;

module NextPcUnit #( parameter int WIDTH = 32
                   , parameter int INCREMENT_AMOUNT = 4) 
                   ( input PcSrcCtrl_t nextPcSrc
                   , input logic [WIDTH : 0] pc
                   , input logic [WIDTH  : 0] nextPcOffset
                   , output logic [WIDTH : 0] nextPc
                   );

  always_comb 
  begin : NextPcLogic
    logic [WIDTH : 0] pcIncr;

    unique case (nextPcSrc)
      PcPlus4:
        pcIncr = WIDTH'(INCREMENT_AMOUNT);
      PcBranch:
        pcIncr = nextPcOffset;
    endcase

    nextPc = pc + pcIncr;
  end
endmodule
