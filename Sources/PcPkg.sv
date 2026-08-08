/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : PcPkg.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Includes enum for pc control signals
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package PcPkg;
  
  typedef enum logic
  {
    PcPlus4,
    PcBranch
  } PcSrc_t;

endpackage