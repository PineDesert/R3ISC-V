/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : DataMem.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Data memory to store stack for RISC-V project, async read,
 * sync write
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

module DataMem #( parameter int WORD_WIDTH = 32
                , parameter int ADDR_WIDTH = 5 
                , parameter int DEPTH = 256
                ) ( input logic clk
                  , input logic writeEnable
                  , input logic [ADDR_WIDTH - 1 : 0] addr
                  , input logic [WORD_WIDTH - 1 : 0] writeData
                  , output logic [WORD_WIDTH - 1 : 0] readData
                  );
              
  logic [WORD_WIDTH - 1 : 0] mem [DEPTH - 1 : 0];

  assign readData = mem[addr];

  always_ff @(posedge clk)
  begin
    if (writeEnable)
      mem[addr] <= writeData;
  end
endmodule