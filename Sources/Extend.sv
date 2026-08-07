/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : Extend.sv
 * Author      : JoeK
 * Created     : 2026/08/07
 *
 * Description : An extend module for signed immediate values for a reduced RISC-V core
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import ExtendPkg::*;

module Extend ( input logic [31 : 0] instrBus
              , input ImmediateType_t immType
              , output logic [31 : 0] immExtend
              );
  always_comb
  begin: Extend
    case (immType)
      ImmI: immExtend = {{20{instrBus[31]}}, instrBus[31 : 20]};                                        // Sign extend the 12 bit immediate 
      ImmS: immExtend = {{20{instrBus[31]}}, instrBus{31 : 25}, instrBus{11 : 7}};                      // Sign extend the 12 bit immediate
      ImmB: immExtend = {{20{instrBus[31]}}, instrBus[7], instrBus[30 : 25], instrBus[11 : 8], 1'b0};   // Sign extend the 13 bit immediate, bit 0 is 0 implicitly as even PC addresses are used
      ImmJ: immExtend = {{12{instrBus[31]}}, instrBus[19 : 12], instrBus[20], instrBus[30 : 21], 1'b0}; // Sign extend the 21 bit immediate, bit 0 is 0 implicitly as even PC addresses are used
      default: immExtend = '0;
    endcase
  end
endmodule