/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : ALUPkg.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Contains the ALU control enum
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package AluPkg;

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
  } AluSrc_t;

endpackage
