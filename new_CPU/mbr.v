`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/17 14:03:14
// Design Name: 
// Module Name: mbr
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


module mbr(
    input clk,
    input [24:0]control,
    input [15:0] memory_in,
    input [15:0] ACC_in,
    output reg [15:0] toMEMORY,
    output reg [15:0] MBRout
    );
    reg [15:0] data_buffer;
    initial
    begin
    data_buffer=0;
    MBRout=0;
    end
     always@(posedge clk)
     begin
     if(control[5]==1|control[10]==1|control[11]==1|control[12]==1) MBRout = data_buffer;
     if(control[7]==1) data_buffer = memory_in;
     if(control[8]==1) toMEMORY  = data_buffer;
     if(control[9]==1) data_buffer = ACC_in;
//     if(control[10]==1) MBRout = data_buffer;
//     if(control[11]==1) MBRout = data_buffer;
//     if(control[12]==1) MBRout = data_buffer;
     end
endmodule
