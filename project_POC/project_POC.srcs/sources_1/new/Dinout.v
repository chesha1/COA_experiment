`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 08:29:29
// Design Name: 
// Module Name: Dinout
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
// 
//////////////////////////////////////////////////////////////////////////////////
module Dinout(din,z,clk,dout,dinout);
    input [7:0] din;
	input z;
	input clk;
	output [7:0] dout;
	inout [7:0] dinout;
	
	reg [7:0] dout;
	reg [7:0] din_reg;
 
	assign dinout = (!z)?din_reg:8'bz;
	
	always @(posedge clk)
		begin
			if(!z)
			 din_reg=din;
			else
			 dout=dinout;
		end
endmodule
