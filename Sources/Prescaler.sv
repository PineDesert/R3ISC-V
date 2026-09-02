`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joe Kelly
// 
// Create Date: 18.06.2026 17:55:42
// Design Name: 
// Module Name: Prescaler
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// f_out = f_in / (2 * CLK_DIV)
//////////////////////////////////////////////////////////////////////////////////

module Prescaler #(parameter int CLK_DIV = 1) 
                  ( input logic nReset
                  , input logic clkIn
                  , output logic clkOut
                  );
						
	initial
	begin: ParamChecks
		assert (CLK_DIV > 0)
			else $fatal("Clock divisor (CLK_DIV) must be >0");
	end
	
	// Local params ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	localparam int _COUNTER_WIDTH = CLK_DIV > 1 ? $clog2(CLK_DIV) : 1;
	
	// Logic ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	logic [_COUNTER_WIDTH - 1 : 0] counter;
	
	always_ff @(posedge clkIn, negedge nReset)
	begin: Prescaler 
		if (!nReset)
		begin: Reset
			counter <= '0;
			clkOut <= 1'b0;
		end
		else
		begin: PreSclCounter
			if (counter >= CLK_DIV - 1)
			begin
				counter <= '0;
				clkOut <= ~clkOut;
			end
			else
			begin
				counter <= counter + 1;
			end
		end
	end
endmodule
