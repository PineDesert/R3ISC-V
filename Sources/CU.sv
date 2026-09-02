/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R2ISC-V
 * File        : Cu.sv
 * Author      : JoeK
 * Created     : 2026/08/09
 *
 * Description : Simple CU for reduced implentation of RV32I
 *
 * License     : MIT
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import CtrlPkg::*;
import DecodePkg::*;

module Cu #(parameter WIDTH = 32) ( input logic [WIDTH - 1 : 0] instrBus
                                  , input logic zeroFlag
                                  , output AluOpCtrl_t aluOpCtrl
                                  , output AluSrcCtrl_t aluSrcCtrl
                                  , output ImmExtTypeCtrl_t immExtTypeCtrl
                                  , output PcSrcCtrl_t pcSrcCtrl
                                  , output logic regWriteEnable
                                  , output RegFileWriteSrcCtrl_t regWriteSrcCtrl
                                  , output logic dMemWriteEnable
                                  , output logic illegalInstrFlag
                                  );

  OpClass_t opClass;
  logic [2 : 0] func3;
  logic [6 : 0] func7;

  AluDecoderCtrl_t aluDecCtrl;

  Decoder decoder ( .instrBus(instrBus)
                  , .opClass(opClass)
                  , .func3(func3)
                  , .func7(func7)
                  );

  AluDecoder aluDec ( .aluDecCtrl(aluDecCtrl)
                    , .func3(func3)
                    , .func7(func7)
                    , .aluOpCtrl(aluOpCtrl)
                    );

  always_comb
  begin: CtrlFromInstruction
    unique case (opClass)
      LoadOp:
      begin
        aluDecCtrl =  AluDecLoadStore;
        aluSrcCtrl = ExtendImm;
        immExtTypeCtrl = ImmI;
        pcSrcCtrl = PcSrc_PcPlus4;
        regWriteEnable = 1;
        regWriteSrcCtrl = DataMem;
        dMemWriteEnable = 0;
      end
      StoreOp:
      begin
        aluDecCtrl = AluDecLoadStore;
        aluSrcCtrl = ExtendImm;
        immExtTypeCtrl = ImmS;
        pcSrcCtrl = PcSrc_PcPlus4;
        regWriteEnable = 0;
        regWriteSrcCtrl = AluResult;
        dMemWriteEnable = 1;
      end
      AluROp:
      begin
        aluDecCtrl = AluDecReg;
        aluSrcCtrl = RegB;
        immExtTypeCtrl = ImmI;
        pcSrcCtrl = PcSrc_PcPlus4;
        regWriteEnable = 1;
        regWriteSrcCtrl = AluResult;
        dMemWriteEnable = 0;
      end
      BranchOp: // beq
      begin
        aluDecCtrl = AluDecBranch;
        aluSrcCtrl = RegB;
        immExtTypeCtrl = ImmB;
        pcSrcCtrl = zeroFlag ? PcSrc_PcBranch : PcSrc_PcPlus4;
        regWriteEnable = 0;
        regWriteSrcCtrl = AluResult; 
        dMemWriteEnable = 0;
      end
      AluImmOp:
      begin
        aluDecCtrl = AluDecImm;
        aluSrcCtrl = ExtendImm;
        immExtTypeCtrl = ImmI;
        pcSrcCtrl = PcSrc_PcPlus4;
        regWriteEnable = 1;
        regWriteSrcCtrl = AluResult;
        dMemWriteEnable = 0;
      end
      LuiOp:
      begin
        aluDecCtrl = AluDecBypass; 
        aluSrcCtrl = RegB;
        immExtTypeCtrl = ImmU;
        pcSrcCtrl = PcSrc_PcPlus4;
        regWriteEnable = 1;
        regWriteSrcCtrl = ExtImm;
        dMemWriteEnable = 0;
      end
      default: // Covers IllegalOp case
      begin
        aluDecCtrl = AluDecBypass;
        aluSrcCtrl = RegB;
        immExtTypeCtrl = ImmI;
        pcSrcCtrl = PcSrc_Halt;
        regWriteEnable = 0;
        regWriteSrcCtrl = AluResult;
        dMemWriteEnable = 0;
      end
    endcase
  end

  always_comb
  begin: IllegalInstrFlag
    illegalInstrFlag = (opClass == IllegalOp) || aluOpCtrl == Illegal;
  end                
endmodule          
