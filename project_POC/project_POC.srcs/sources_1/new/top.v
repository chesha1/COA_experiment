`timescale 1ns / 1ps
//5ns->100MHz
//RW=1->IN
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 00:18:25
// Design Name: 
// Module Name: top
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

module top;


reg clk;
wire clk_CPU;
wire clk_POC;

wire [15:0] Addr;
wire[7:0] Din,Dout;
wire RW;
wire IRQ;
reg [1:0] cont;

wire RDY;
wire TR;
wire [7:0] PD;


    

initial
begin
clk=0;cont=2'b00;

forever #5 clk=~clk;
end

initial
begin
#4000 cont=2'b01;
#20000 cont=2'b10;

end




clk_wiz_0 clk123
 (
  // Clock out ports
.clk_out1(clk_CPU),
.clk_out2(clk_POC),
 // Clock in ports
.clk_in1(clk)
 );
 
 CPU CPU1
 (
 .Addr(Addr),
 .Din(Din),
 .Dout(Dout),
 .RW(RW),
 .clk(clk_CPU),
 .IRQ(IRQ),
 .cont(cont)
 );
 
 POC POC1
 (
 .Addr(Addr),
 .Din(Din),
 .Dout(Dout),
 .RW(RW),
 .clk(clk_POC),
 .IRQ(IRQ),
 .cont(cont),
 .RDY(RDY),
 .TR(TR),
 .PD(PD)
 );
 
Printer Printer1
(
.RDY(RDY),
.TR(TR),
.PD(PD)
);
endmodule











