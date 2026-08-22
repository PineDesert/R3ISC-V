/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : Decoder.sv
 * Author      : JoeK
 * Created     : 2026/08/20
 *
 * Description : Produces opClass output from op input
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import DecodePkg::*;

module Decoder ( input logic [31 : 0] instrBus
               , output OpClass_t opClass
               , output logic [2 : 0] func3
               , output logic [6 : 0] func7
               );
  always_comb
  begin
    func3 = instrBus[14 : 12];
    func7 = instrBus[31 : 25];
    unique case (instrBus[6 : 0])
      7'b0000011: opClass = LoadOp;
      7'b0010011: opClass = AluImmOp;
      7'b0100011: opClass = StoreOp;
      7'b0110011: opClass = AluROp;
      7'b1100011: opClass = BranchOp;
      default: opClass = IllegalOp;
    endcase
  end
  
endmodule