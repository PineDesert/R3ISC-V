/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : ExtendPkg.sv
 * Author      : JoeK
 * Created     : 2026/08/07
 *
 * Description : Package containing control type for extend module
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package ExtendPkg;

  typedef enum logic [1 : 0]
  {
    ImmI = 2'b00,
    ImmS = 2'b01,
    ImmB = 2'b10,
    ImmJ = 2'b11
  } ImmediateType_t;

endpackage