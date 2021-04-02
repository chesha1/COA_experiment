`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 08:13:14
// Design Name: 
// Module Name: POC
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


module POC(Addr, Din, Dout, RW, clk, IRQ, cont, RDY, TR, PD);

input [15:0]Addr;
//inout Data;
input Din;
output Dout;
input RW;
input clk;
output IRQ;
input cont;
input RDY;
output TR;
output PD;

wire [7:0] Din;
wire [7:0] Dout;
//wire [7:0] Data;
wire clk;
wire RW;
wire [1:0] cont;

wire[2:0] Add=Addr[2:0];
reg [7:0] SR=8'b10000000;
reg [7:0] BR=8'b00000000;

wire RDY;
wire TR;reg tr=0;
wire [7:0] PD=BR;

wire IRQ;reg irq=1;
assign IRQ=irq;


always@(posedge clk)
begin
if(RDY==1&&BR==8'h12&&SR[7]==0&&SR[0]==0) 
begin
tr=1;
#20 tr=0;
end
end


always@(posedge clk)
begin
if(RDY==1&&BR==8'h34&&SR[7]==0&&SR[0]==1) 
begin
tr=1;
#20 tr=0;
end
end

//always@(posedge clk)
//begin
//if(RDY==1&&SR[0]==1&&SR[7]==0) 
//begin
//tr=1;
//#200 tr=0;
//end
//end




always@(posedge clk)
begin
    if(cont==2'b01)
    begin
        if(SR[7]==1&&BR==8'h00) 
        begin
        BR=Din;
        SR[7]=0;
        end
        if(SR[7]==0&&cont==2'b01)
        begin
        //Œ’ ÷
        //#1000 SR[7]=1;
        end
    end
end


always@(posedge clk)
begin
if(SR[0]==1&&SR[7]==1)
begin
irq=0;
end
end

always@(posedge clk)
begin
if(SR[0]==1&&SR[7]==0)
begin
//Œ’ ÷
end
end


always@(posedge clk)
begin
if(Add==3'b001) 
begin
BR=Din;
SR[7]=0;
end
end

    
always@(posedge clk)
begin
if(cont==2'b01) SR[0]=0;
if(cont==2'b10&&BR==8'h12)
begin
SR[0]=1;
SR[7]=1;
end
end

always@(posedge clk)
begin
if(IRQ==0) SR[7]=0;
end

always@(posedge clk)
begin
if(Din==8'h34&&RDY==1)
begin
irq=1;
end
end

always@(posedge clk)
begin
if(cont==2'b01&&TR==1)
begin
#1000 SR[7]=1;
end
end


always@(posedge clk)
begin
if(BR==8'h12)
begin
#600 SR[7]=1;
end

end



//always@(posedge clk)
//begin
//if(cont==2'b10&&RDY==1)
//begin
//tr=0;
//end
//end





assign TR=tr;
//    Dinout port2(
//    .din(din),
//    .dout(dout),
//    .clk(clk),
//    .z(RW),
//    .dinout(Data)
//    );

endmodule
