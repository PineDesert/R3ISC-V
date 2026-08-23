/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : Test_R3ISCV.sv
 * Author      : JoeK
 * Created     : 2026/08/23
 *
 * Description : Simple testbench for CPU
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

module test_R3ISCV();

  logic nReset;
  logic clk;
  logic [31 : 0] pc;

  R3ISC_V dut (.clk(clk), .nReset(nReset), .debugPc(pc));

  initial
  begin
    clk = '0;
    nReset = '1;
    #5 nReset = '0;
    #5 nReset = '1;
    #200 $stop;
  end

  initial
  begin
    forever
        #10 clk = ~clk;
  end
endmodule