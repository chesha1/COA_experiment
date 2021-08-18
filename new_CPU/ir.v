`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/17 14:45:11
// Design Name: 
// Module Name: IR
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


module ir(
    input clk,
    input [24:0]control,
    input [7:0] MBR_in,
    output [7:0] IRout
    );
    reg [7:0] data_buffer;
    initial
    begin
    data_buffer=0;
    end
    assign IRout = data_buffer;
    always@(posedge clk)
    begin
    if(control[11]==1) data_buffer = MBR_in;
    end   
endmodule
