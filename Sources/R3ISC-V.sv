/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : R3ISC-V.sv
 * Author      : JoeK
 * Created     : 2026/08/20
 *
 * Description : Top level file for the R3ISC-V project
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import CtrlPkg::*;

module R3ISC_V ();

  logic [31 : 0] instrBus;
  logic zeroFlag;
  AluOpCtrl_t aluOpCtrl;
  AluSrcCtrl_t aluSrcCtrl;
  ImmExtTypeCtrl_t immExtTypeCtrl;
  PcSrcCtrl_t pcSrcCtrl;
  logic regWriteEnable;
  RegFileWriteSrcCtrl_t regWriteSrcCtrl;
  logic dMemWriteEnable;

  CU cu ( .instrBus(instrBus)
        , .zeroFlag(zeroFlag)
        , .aluOpCtrl(aluOpCtrl)
        , .aluSrcCtrl(aluSrcCtrl)
        , .immExtTypeCtrl(immExtTypeCtrl)
  )
endmodule