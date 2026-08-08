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

module DataMem #(parameter DEPTH = 256)
                ( input logic clk
                , input logic writeEnable
                , input logic [4 : 0] addr
                , input logic [31 : 0] writeData
                , output logic [31 : 0] readData
                );
              
  logic [31 : 0] mem [DEPTH - 1 : 0];

  assign readData = mem[addr];

  always_ff @(posedge clk)
  begin
    if (writeEnable)
      mem[addr] <= writeData;
  end
endmodule