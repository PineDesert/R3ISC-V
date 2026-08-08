/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : RegFilePkg.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Contains control enum for reg file write datapath
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

package RegFilePkg();

  typedef enum logic [1 : 0] 
  { 
    AluResult,
    DataMem,
    PcPlus4
  } RegFileWriteSrc;
endpackage