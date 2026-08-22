/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : DecodePkg.sv
 * Author      : JoeK
 * Created     : 2026/08/09
 *
 * Description : Contains enums used in decoding instructions to produce the 
 *               contol signals for the CPU
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package DecodePkg;

  typedef enum logic [2 : 0]
  {
    LoadOp,
    StoreOp,
    AluImmOp,
    AluROp,
    BranchOp,
    //LuiOp,
    //AuipcOP,
    //JalRegOp,
    //JalOp,
    IllegalOp
  } OpClass_t;

  
endpackage
