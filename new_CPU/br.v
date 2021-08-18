`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/17 15:03:49
// Design Name: 
// Module Name: br
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


module br(
    input clk,
    input [24:0]control,
    input [15:0] MBR_in,
    output [15:0] BRout
);
    reg [15:0] data_buffer;
    initial
    begin
    data_buffer=0;
    end
    assign BRout = data_buffer;
    always@(posedge clk)
    begin
    if(control[12]==1) data_buffer = MBR_in;
    end   
endmodule   
