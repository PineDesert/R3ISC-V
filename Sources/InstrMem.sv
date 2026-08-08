/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : InstrMem.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Instruction memory, DEPTH deep
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

module InstrMem #(parameter DEPTH = 256)
                 ( input logic [4 : 0] addr
                 , output logic [31 : 0] readData
                 );

  logic [31 : 0] mem [DEPTH - 1 : 0];

  initial
  begin: PopulateInstrMem
    $readmemh("instrMem.hex", mem);
  end

  assign readData = mem[addr];

endmodule