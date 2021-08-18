`timescale 1ns / 1ps
module pc(
    input clk,
    input [24:0]control,
    input [7:0] MBR_in,
    output [7:0] PCout
    );
    reg [7:0] data_buffer;
    initial
    begin
    data_buffer=0;
    end
    assign PCout = data_buffer;   
     
    always@(posedge control[4]or posedge control[5]or posedge control[6])
    begin
    if(control[5]==1) data_buffer = MBR_in;
    else if(control[6]==1) data_buffer = 0;
    else if(control[4]==1) data_buffer = data_buffer + 1;
    end
endmodule