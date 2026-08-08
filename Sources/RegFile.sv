/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : RegFile.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Register file, WIDTH bit wide, DEPTH deep, 2 async read
 * 1 sync write, writeEnable
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

module RegFile ( input logic clk
               , input logic [4 : 0] addr1R
               , input logic [4 : 0] addr2R
               , input logic [4 : 0] addr3W
               , input logic writeEnable3
               , input logic [31 : 0] writeData3
               , output logic [31 : 0] readData1
               , output logic [31 : 0] readData2
               );

  logic [31 : 0] regFile [31 : 0];

  always_comb
  begin
    readData1 = (addr1R != 5'b0)  ? regFile[addr1R] : 32'b0;
    readData2 = (addr2R != 5'b0)  ? regFile[addr2R] : 32'b0;
  end

  always_ff @(posedge clk)
  begin
    if (writeEnable3)
      if (addr3W != 5'b0)
        regFile[addr3W] <= writeData3;
  end
endmodule