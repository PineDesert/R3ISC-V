/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : InstrMem.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Instruction memory, DEPTH deep
 *
 * License     : MIT
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

module InstrMem #(parameter int WORD_WIDTH = 32
                , parameter int ADDR_WIDTH = 32 
                , parameter int DEPTH = 256
                )  ( input logic [ADDR_WIDTH - 1 : 0] addr
                   , output logic [WORD_WIDTH - 1 : 0] readData
                   );
                

  logic [WORD_WIDTH - 1 : 0] mem [DEPTH - 1 : 0];

  initial
  begin: PopulateInstrMem // Handwritten test program woo
    $readmemh("Sources/instrMem.hex", mem);
    $display("InstrMem contents: ");
    for (int i = 0; i < DEPTH; i++)
    begin
      $display("imem[%03d] = 0x%08h", i, mem[i]);
    end
  end

  assign readData = mem[addr[31 : 2]]; //word alligned

endmodule