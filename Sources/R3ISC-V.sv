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

module R3ISC_V (input logic clk, input logic nReset, output logic [31 : 0] debugPc);


  localparam int _WORD_WIDTH = 32;
  localparam int _REG_ADDR_WIDTH = 5;
  localparam int _DMEM_DEPTH = 16; // No protection if DMEM address exceeds atm
  localparam int _IMEM_DEPTH = 16; // Same as above
  localparam int _REG_FILE_DEPTH = 32;
  localparam int _PC_INCREMENT = 4;

  AluOpCtrl_t aluOpCtrl;
  AluSrcCtrl_t aluSrcCtrl;
  ImmExtTypeCtrl_t immExtTypeCtrl;
  PcSrcCtrl_t pcSrcCtrl;
  logic regWriteEnable;
  RegFileWriteSrcCtrl_t regWriteSrcCtrl;
  logic dMemWriteEnable;

  logic [_WORD_WIDTH - 1 : 0] aluResult;
  logic aluZeroFlag;

  logic [_WORD_WIDTH - 1 : 0] aluSrcB;
  
  logic [_WORD_WIDTH - 1 : 0] extendImm;

  logic [_WORD_WIDTH - 1 : 0] programCount;

  logic [_WORD_WIDTH - 1 : 0] pcPlus4;
  logic [_WORD_WIDTH - 1 : 0] nextPc;

  logic [_WORD_WIDTH - 1 : 0] dmemRead;

  logic [_WORD_WIDTH - 1 : 0] instrBus;

  logic [_WORD_WIDTH - 1 : 0] regRead1;
  logic [_WORD_WIDTH - 1 : 0] regRead2;

  logic [_WORD_WIDTH - 1 : 0] regWrite3;

  Cu cu ( .instrBus(instrBus)
        , .zeroFlag(aluZeroFlag)
        , .aluOpCtrl(aluOpCtrl)
        , .aluSrcCtrl(aluSrcCtrl)
        , .immExtTypeCtrl(immExtTypeCtrl)
        , .pcSrcCtrl(pcSrcCtrl)
        , .regWriteEnable(regWriteEnable)
        , .regWriteSrcCtrl(regWriteSrcCtrl)
        , .dMemWriteEnable(dMemWriteEnable)
        );

  Alu #(.WIDTH(_WORD_WIDTH)) alu ( .opCtrl(aluOpCtrl)
                                 , .srcA(regRead1)
                                 , .srcB(aluSrcB)
                                 , .result(aluResult)
                                 , .zeroFlag(aluZeroFlag)
                                 );

  AluSrcBMux #(.WIDTH(_WORD_WIDTH)) aluSrcBMux ( .aluSrcSelect(aluSrcCtrl)
                                               , .regFileB(regRead2)
                                               , .extendImm(extendImm)
                                               , .aluSrcB(aluSrcB)
                                               );

  ExtendRV32I ext (.instrBus(instrBus)
                  , .immTypeCtrl(immExtTypeCtrl)
                  , .extendImm(extendImm)
                  );

  Pc #(.WIDTH(_WORD_WIDTH)) pc ( .clk(clk)
                               , .nReset(nReset)
                               , .nextPc(nextPc)
                               , .pc(programCount)
                               );

  NextPcUnit #( .WIDTH(_WORD_WIDTH)
              , .INCREMENT_AMOUNT(_PC_INCREMENT)
              ) nextPcUnit ( .nextPcSrc(pcSrcCtrl)
                           , .pc(programCount)
                           , .nextPcOffset(extendImm)
                           , .pcPlus4Out(pcPlus4)
                           , .nextPc(nextPc)
                           );

  DataMem #( .WORD_WIDTH(_WORD_WIDTH)
           , .ADDR_WIDTH(_WORD_WIDTH)
           , .DEPTH(_DMEM_DEPTH)
           ) dmem ( .clk(clk)
                  , .writeEnable(dMemWriteEnable)
                  , .addr(aluResult)
                  , .writeData(regRead2)
                  , .readData(dmemRead)
                  );

  InstrMem #( .WORD_WIDTH(_WORD_WIDTH)
           , .ADDR_WIDTH(_WORD_WIDTH)
           , .DEPTH(_IMEM_DEPTH)
           ) imem ( .addr(programCount)
                  , .readData(instrBus)
                  );

  RegFile # ( .WORD_WIDTH(_WORD_WIDTH) // MAKE REGFILE ADDRESS DECODER FROM INSTRBUS
            , .ADDR_WIDTH(_REG_ADDR_WIDTH)
            , .DEPTH(_REG_FILE_DEPTH)
            ) regFile ( .clk(clk)
                      , .addr1R(instrBus[19 : 15])
                      , .addr2R(instrBus[24 : 20])
                      , .addr3W(instrBus[11 : 7])
                      , .writeEnable3(regWriteEnable)
                      , .writeData3(regWrite3)
                      , .readData1(regRead1)
                      , .readData2(regRead2)
                      );

  RegFileWriteSrcMux #(.WIDTH(_WORD_WIDTH)) regSrcMux ( .writeSrc(regWriteSrcCtrl)
                                                      , .aluResult(aluResult)
                                                      , .dataMem(dmemRead)
                                                      , .pcPlus4(pcPlus4)
                                                      , .regWriteData(regWrite3)
                                                      );

    assign debugPc = programCount; // Make the program counter visible to the testbench                                                       
endmodule