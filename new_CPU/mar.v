`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/17 14:29:06
// Design Name: 
// Module Name: mar
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


module mar(
    input clk,
    input [24:0]control,
    input [7:0] MBR_in,
    input [7:0] PC_in,
    output [7:0] MARout
    );
    reg [7:0] data_buffer;
    initial
    begin
    data_buffer=0;
    end
    assign MARout=data_buffer;
    always@(posedge clk)
    begin
    if(control[3]==1) data_buffer = PC_in;
    if(control[10]==1)data_buffer = MBR_in;  
    end
endmodule
