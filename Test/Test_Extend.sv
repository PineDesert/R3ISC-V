/*
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Project     : R3ISC-V
 * File        : Test_Extend.sv
 * Author      : JoeK
 * Created     : 2026/08/08
 *
 * Description : Testbench for extend module
 *
 * License     : None
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 */

module test_Extend();
  import ExtendPkg::*;
  
  logic [31 : 0] instrBus;
  ImmediateType_t immType;
  logic [31 : 0] immExtend;
  logic [31 : 0] immExtendExpected;

  Extend dut ( .instrBus(instrBus)
             , .immType(immType)
             , .immExtend(immExtend)
             );

  logic clk;
  logic [65 : 0] testVecs [255: 0];
  int i;
  int errorCount;

  initial
  begin: ReadVectorFile
    $display("Extend module testbench:");
    $readmemb("TestExtendVecs.txt", testVecs);
    i = 0;
    errorCount = 0;
  end

  initial
  begin: TestClock
    clk = 1;
    forever #5 clk = ~clk;
  end

  always @(posedge clk)
  begin: ApplyVectors
    {instrBus, immType, immExtendExpected} = testVecs[i];
  end

  always @(negedge clk)
  begin: CheckVecs
    if (i >= $size(testVecs))
    begin
      $fatal("Test vector index exceeded text vector array size. Test failed.");
    end
    if (testVecs[i] === 66'bx)
    begin
      $display("Test complete. %0d vectors tested. %0d errors found.", i, errorCount);
      $stop;
    end
    if (immExtend !== immExtendExpected)
    begin
      $display("Error: VecIndex %0d", i);
      $display("Input: instrBus = %b, immType = %s", instrBus, immType.name());
      $display("Output: immExtend = %b, Expected: immExtendExpected = %b", immExtend, immExtendExpected);
      errorCount++;
    end
    i++;
  end
endmodule