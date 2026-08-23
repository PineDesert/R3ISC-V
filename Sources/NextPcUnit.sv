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
                   ( input logic nReset
                   , input logic clk
                   , input PcSrcCtrl_t nextPcSrc
                   , input logic [WIDTH - 1 : 0] pc
                   , input logic [WIDTH - 1 : 0] nextPcOffset
                   , output logic [WIDTH - 1 : 0] nextPc
                   );

  logic resetFlag;
  logic [WIDTH : 0] pcIncr;

  always_ff @(posedge clk or negedge nReset)
  begin
    if (!nReset)
      resetFlag = 1;
    else 
      resetFlag = 0;
  end

  always_comb 
  begin : NextPcLogic
 

    if (!resetFlag)
    begin
      unique case (nextPcSrc)
        PcSrc_PcPlus4:
          pcIncr = WIDTH'(INCREMENT_AMOUNT);
        PcSrc_PcBranch:
          pcIncr = nextPcOffset;
      endcase

      nextPc = pc + pcIncr;
    end
    else // Reset
      nextPc = '0;
  end
endmodule
