/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : CtrlPkg.sv
 * Author      : JoeK
 * Created     : 2026/08/09
 *
 * Description : Package containing all of the control signal types for project
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package CtrlPkg;

  typedef enum logic [1 : 0]
  {
    AluDecReg,
    AluDecImm,
    AluDecLoadStore,
    AluDecBranch
  } AluDecoderCtrl_t;

  typedef enum logic [1 : 0]
  {
    Add,
    Sub,
    And,
    Or
  } AluOpCtrl_t;

  typedef enum logic
  {
    RegB,
    ExtendImm
  } AluSrcCtrl_t;

  typedef enum logic [1 : 0]
  {
    ImmI = 2'b00, // Not sure why these are explicitly written
    ImmS = 2'b01,
    ImmB = 2'b10,
    ImmJ = 2'b11
  } ImmExtTypeCtrl_t;

  typedef enum logic
  {
    PcSrc_PcPlus4,
    PcSrc_PcBranch
  } PcSrcCtrl_t;

  typedef enum logic [1 : 0] 
  { 
    AluResult,
    DataMem,
    PcPlus4
  } RegFileWriteSrcCtrl_t;

endpackage