/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R2ISC-V
 * File        : CtrlPkg.sv
 * Author      : JoeK
 * Created     : 2026/08/09
 *
 * Description : Package containing all of the control signal types for project
 *
 * License     : MIT
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package CtrlPkg;

  typedef enum logic [2 : 0]
  {
    AluDecReg,
    AluDecImm,
    AluDecLoadStore,
    AluDecBranch,
    AluDecBypass //  Used for instructions that ignore the ALU reusult
  } AluDecoderCtrl_t;

  typedef enum logic [2 : 0]
  {
    Add,
    Sub,
    And,
    Or,
    Bypass, // Forward SrcA in the case of an instruction that ignores the ALU result
    Illegal // Forward SrcA in the case of an illegal op 
  } AluOpCtrl_t;

  typedef enum logic
  {
    RegB,
    ExtendImm
  } AluSrcCtrl_t;

  typedef enum logic [2 : 0]
  {
    ImmI, 
    ImmS,
    ImmB,
    ImmJ,
    ImmU
  } ImmExtTypeCtrl_t;

  typedef enum logic [1 : 0]
  {
    PcSrc_PcPlus4,
    PcSrc_PcBranch,
    PcSrc_Halt
  } PcSrcCtrl_t;

  typedef enum logic [1 : 0] 
  { 
    AluResult,
    DataMem,
    PcPlus4,
    ExtImm
  } RegFileWriteSrcCtrl_t;

endpackage