/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : AluDecoder.sv
 * Author      : JoeK
 * Created     : 2026/08/20
 *
 * Description : Produces ALU operation control signal from opClass, func3, func7
 *
 * License     : MIT
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import DecodePkg::*;
import CtrlPkg::*;

module AluDecoder ( input AluDecoderCtrl_t aluDecCtrl
                  , input logic [2 : 0] func3
                  , input logic [6 : 0] func7
                  , output AluOpCtrl_t aluOpCtrl
                  );

always_comb 
begin
  unique case (aluDecCtrl)
    AluDecBypass: aluOpCtrl = Bypass;
    AluDecLoadStore: aluOpCtrl = Add; // lw sw
    AluDecBranch: aluOpCtrl = Sub; // beq
    AluDecImm:
    begin
      unique case (func3)
        3'b000: aluOpCtrl = Add; // addi
        default: aluOpCtrl = Illegal; 
      endcase
    end
    AluDecReg:
    begin
      unique case (func3)
        3'b000: aluOpCtrl = Add; // add
        3'b110: aluOpCtrl = Or; // or
        3'b111: aluOpCtrl = And; // and
        default: aluOpCtrl = Illegal;
      endcase
    end
    default: aluOpCtrl = Illegal;
  endcase  
end

endmodule
