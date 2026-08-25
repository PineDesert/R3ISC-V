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
                   , input logic [WIDTH - 1 : 0] pc
                   , input logic [WIDTH - 1 : 0] nextPcOffset
                   , output logic [WIDTH - 1 : 0] pcPlus4Out
                   , output logic [WIDTH - 1 : 0] nextPc
                   );

  logic [WIDTH - 1 : 0] pcPlus4;
  logic [WIDTH - 1 : 0] pcBranch;

  always_comb
  begin
    pcPlus4 = pc + WIDTH'(INCREMENT_AMOUNT);
    pcBranch = pc + nextPcOffset;

    pcPlus4Out = pcPlus4;
    unique case (nextPcSrc)
      PcSrc_PcPlus4:  nextPc = pcPlus4;
      PcSrc_PcBranch: nextPc = pcBranch;
    endcase
  end
endmodule
