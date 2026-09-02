/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R2ISC-V
 * File        : Test_R2ISCV.sv
 * Author      : JoeK
 * Created     : 2026/08/23
 *
 * Description : Simple testbench for CPU
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

module test_R2ISCV();

  logic nReset;
  logic clk;
  logic [31 : 0] pc;
  logic illegalInstrFlag;

  R2ISC_V #(.IS_SIMULATION(1)) dut (.clkIn(clk), .nReset(nReset), .debugPc(pc), .illegalInstrFlag(illegalInstrFlag));

  initial
  begin
    clk = '0;
    nReset = '1;
    #5 nReset = '0;
    #5 nReset = '1;
    #350 $stop;
  end

  initial
  begin
    forever
        #10 clk = ~clk;
  end
endmodule