/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : ExtendRV32I.sv
 * Author      : JoeK
 * Created     : 2026/08/07
 *
 * Description : An extend module for signed immediate values for a reduced RISC-V core
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

import CtrlPkg::*;

module ExtendRV32I ( input logic [31 : 0] instrBus
                   , input ImmExtTypeCtrl_t immTypeCtrl
                   , output logic [31 : 0] extendImm
                   );
  always_comb 
  begin: Extend
    case (immTypeCtrl)
      ImmI: extendImm = {{20{instrBus[31]}}, instrBus[31 : 20]};                                        // Sign extend the 12 bit immediate I
      ImmS: extendImm = {{20{instrBus[31]}}, instrBus[31 : 25], instrBus[11 : 7]};                      // Sign extend the 12 bit immediate S
      ImmB: extendImm = {{19{instrBus[31]}}, instrBus[31], instrBus[7], instrBus[30 : 25], instrBus[11 : 8], 1'b0};   // Sign extend the 13 bit immediate, bit 0 is 0 implicitly as even PC addresses are used B
      ImmJ: extendImm = {{11{instrBus[31]}}, instrBus[31], instrBus[19 : 12], instrBus[20], instrBus[30 : 21], 1'b0}; // Sign extend the 21 bit immediate, bit 0 is 0 implicitly as even PC addresses are used J
      default: extendImm = '0;
    endcase
  end
endmodule