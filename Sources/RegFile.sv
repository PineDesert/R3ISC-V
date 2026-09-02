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
 * License     : MIT
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

module RegFile #( parameter int WORD_WIDTH = 32
                , parameter int ADDR_WIDTH = 5 
                , parameter int DEPTH = 32
                ) ( input logic clk
                  , input logic [ADDR_WIDTH - 1 : 0] addr1R
                  , input logic [ADDR_WIDTH - 1 : 0] addr2R
                  , input logic [ADDR_WIDTH - 1 : 0] addr3W
                  , input logic writeEnable3
                  , input logic [WORD_WIDTH - 1 : 0] writeData3
                  , output logic [WORD_WIDTH - 1 : 0] readData1
                  , output logic [WORD_WIDTH - 1 : 0] readData2
                  );

  logic [WORD_WIDTH - 1 : 0] regFile [DEPTH - 1 : 0];

  always_comb
  begin
    readData1 = (addr1R != ADDR_WIDTH'(0))  ? regFile[addr1R] : WORD_WIDTH'(0);
    readData2 = (addr2R != ADDR_WIDTH'(0))  ? regFile[addr2R] : WORD_WIDTH'(0);
  end

  always_ff @(posedge clk)
  begin
    if (writeEnable3)
      if (addr3W != ADDR_WIDTH'(0))
        regFile[addr3W] <= writeData3;
end
endmodule