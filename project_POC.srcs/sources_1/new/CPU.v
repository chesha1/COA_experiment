`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 07:50:03
// Design Name: 
// Module Name: CPU
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


//�ִ����������õ�ʱ�ӷ����������Խ���clk������

module CPU(Addr, Din, Dout, RW, clk, IRQ, cont);
    
    
    output Addr;
    //inout Data;
    output Din;
    input Dout;
    output RW;
    input clk;
    input IRQ;
    input cont;//00����������01��ѯ��10�նˣ�11DMA
    
    wire [15:0] Addr;
    wire [7:0] Din;
    reg [7:0] din=8'h12;
    wire [7:0] Dout;
    wire [7:0] Data;
    wire clk;
    reg RW=0;
    wire [1:0] cont;
    wire IRQ;
    
    reg [15:0] Add=16'h0000;
    
    assign Din=din;
    
    
    always@(posedge clk)
    begin
    if(cont==2'b01) 
    begin
    RW=0;
    end
    end
    
    
    always@(posedge clk)
    begin
    if(IRQ==0)
    begin 
    Add=16'h0001;
    din=8'h34;
    end
    end
    
    
    
    
    
    
//    Dinout port1(
//    .din(din),
//    .dout(dout),
//    .clk(clk),
//    .z(RW),
//    .dinout(Data)
//    );
    
   
    
    
   assign  Addr=Add;
   
   
   
   

    
    
    
endmodule
