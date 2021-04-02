`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 08:15:41
// Design Name: 
// Module Name: Printer
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


module Printer(PD, TR, RDY);

input PD;
input TR;
output RDY;   


wire TR;
wire RDY;reg rdy=1;
reg [7:0] buffer=8'b00000000;
wire [7:0] PD;

assign RDY=rdy;

always@(*)
begin
if(TR==1) 
begin
rdy=0;
buffer=PD;
#500 rdy=1;
end
end


always@(*)
begin
if(buffer==8'h34)
begin

#100 rdy=1;
end
end
    
    
always@(*)
begin
if(buffer==8'h12)
begin

#100 rdy=1;
end
end    
    
    
    
    
    
endmodule
