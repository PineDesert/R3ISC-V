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

module InstrMem #(parameter int WORD_WIDTH = 32
                , parameter int ADDR_WIDTH = 5 
                , parameter int DEPTH = 256
                )  ( input logic [ADDR_WIDTH - 1 : 0] addr
                   , output logic [WORD_WIDTH - 1 : 0] readData
                   );
                

  logic [WORD_WIDTH - 1 : 0] mem [DEPTH - 1 : 0];

  initial
  begin: PopulateInstrMem
    $readmemh("instrMem.hex", mem);
  end

  assign readData = mem[addr];

endmodule