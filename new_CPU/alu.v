`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/31 14:10:21
// Design Name: 
// Module Name: alu
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


module alu(
    input clk,
    input [24:0]control,
    input [15:0]BR_in,
    output  reg [31:0]showout,    
    output  reg [15:0]ACCout,
    output flag
);
reg[15:0] ACC_reg=0;
reg[15:0] BR_in_reg=0;
reg[15:0] MR_reg=0;
reg[15:0] DR_reg=0;
reg[31:0] result_buffer1=0;//乘法缓存器
//reg[15:0] result_buffer2;//其他缓存器
reg[31:0] show_reg;
//assign ACCout=ACC_reg;
//assign showout[15:0]=ACC_reg;
//assign showout[31:16]=MR_reg;
assign flag=result_buffer1[31];

initial 
    begin
    ACC_reg=16'b0;BR_in_reg=16'b0;MR_reg=0;result_buffer1=0;result_buffer1=0;DR_reg=0;
    end
    
    
always@(posedge clk)
begin
    ACCout=ACC_reg;
//    showout[15:0]=ACC_reg;
//    showout[31:16]=MR_reg;
    showout[31:0]=32'h000013ba;
end    



always@(posedge control[13]or posedge control[14] or posedge control[15]or posedge control[17]or posedge control[18]or posedge control[19]or posedge control[20]or posedge control[21]or posedge control[22]or posedge control[23]or posedge control[24])
begin
    BR_in_reg=BR_in;
    if(control[13]==1)begin MR_reg=0;ACC_reg=0;result_buffer1=0;end
    else if(control[14]==1)begin result_buffer1=0;result_buffer1=ACC_reg+BR_in_reg;ACC_reg=result_buffer1[15:0];MR_reg=result_buffer1[31:16];end
    else if(control[15]==1)begin result_buffer1=0;result_buffer1=ACC_reg-BR_in_reg;ACC_reg=result_buffer1[15:0];MR_reg=result_buffer1[31:16];end
//    else if(control[16]==1)begin 
//                        result_buffer1=0;
//                        result_buffer1=ACC_reg*BR_in_reg;
//                        ACC_reg=result_buffer1[15:0];
//                        MR_reg=result_buffer1[31:16];
//                      end
    else if(control[17]==1)begin result_buffer1=0;result_buffer1=ACC_reg&BR_in_reg;ACC_reg=result_buffer1[15:0];MR_reg=result_buffer1[31:16];end
    else if(control[18]==1)begin result_buffer1=0;result_buffer1=ACC_reg|BR_in_reg;ACC_reg=result_buffer1[15:0];MR_reg=result_buffer1[31:16];end
    else if(control[19]==1)begin result_buffer1=0;result_buffer1=~ACC_reg;ACC_reg=result_buffer1[15:0];MR_reg=result_buffer1[31:16];end
    else if(control[20]==1)begin result_buffer1=0;result_buffer1=ACC_reg>>1;ACC_reg=result_buffer1[15:0];MR_reg=result_buffer1[31:16];end
    else if(control[21]==1)begin result_buffer1=0;result_buffer1=ACC_reg<<1;ACC_reg=result_buffer1[15:0];MR_reg=result_buffer1[31:16];end
    else if(control[22]==1)begin result_buffer1=0;result_buffer1=ACC_reg>>>1;ACC_reg=result_buffer1[15:0];MR_reg=result_buffer1[31:16];end
    else if(control[23]==1)begin result_buffer1=0;result_buffer1=ACC_reg<<<1;ACC_reg=result_buffer1[15:0];MR_reg=result_buffer1[31:16];end
    else if(control[24]==1)
    begin
    result_buffer1=0;
    if((ACC_reg[15]==1&&BR_in_reg[15]==1)||(ACC_reg[15]==0&&BR_in_reg[15]==0))
        begin 
            result_buffer1=ACC_reg[14:0]*BR_in_reg[14:0];
//                    flag_reg=0;
            ACC_reg[15:0]=result_buffer1[15:0];
            MR_reg[14:0]=result_buffer1[30:16];
            MR_reg[15]=0;
        end
    else
        begin 
            result_buffer1=ACC_reg[14:0]*BR_in_reg[14:0];
//                    flag_reg=1;
            ACC_reg[15:0]=result_buffer1[15:0];
            MR_reg[14:0]=result_buffer1[30:16];
            MR_reg[15]=1;
        end
    end
//    ACCout=ACC_reg;
//    showout[15:0]=ACC_reg;
//    showout[31:16]=MR_reg;
        end
   // 将结果适配到显示模块
//        if(control[13:24]!=0)
//        begin
//        show_reg={1'b0,result_buffer[31:28],1'b0,result_buffer[27:24],1'b0,result_buffer[23:20],1'b0,result_buffer[19:16],1'b0,result_buffer[15:12],1'b0,result_buffer[11:8],1'b0,result_buffer[7:4],1'b0,result_buffer[3:0]};
//        if(40'b1111_1111_1111_1111_1111_1111_1111_1111-result_buffer>=40'b1111_0000_0000_0000_0000_0000_0000_0000)
//        show_reg[39:35]=5'b11111;
//        if(40'b1111_1111_1111_1111_1111_1111_1111_1111-result_buffer>=40'b1111_1111_0000_0000_0000_0000_0000_0000)
//        show_reg[34:30]=5'b11111;
//        if(40'b1111_1111_1111_1111_1111_1111_1111_1111-result_buffer>=40'b1111_1111_1111_0000_0000_0000_0000_0000)
//        show_reg[29:25]=5'b11111;
//        if(40'b1111_1111_1111_1111_1111_1111_1111_1111-result_buffer>=40'b1111_1111_1111_1111_0000_0000_0000_0000)
//        show_reg[24:20]=5'b11111;
//        if(40'b1111_1111_1111_1111_1111_1111_1111_1111-result_buffer>=40'b1111_1111_1111_1111_1111_0000_0000_0000)
//        show_reg[19:15]=5'b11111;
//        if(40'b1111_1111_1111_1111_1111_1111_1111_1111-result_buffer>=40'b1111_1111_1111_1111_1111_1111_0000_0000)
//        show_reg[14:10]=5'b11111;
//        if(40'b1111_1111_1111_1111_1111_1111_1111_1111-result_buffer>=40'b1111_1111_1111_1111_1111_1111_1111_0000)
//        show_reg[9:5]=5'b11111;
//        if(40'b1111_1111_1111_1111_1111_1111_1111_1111-result_buffer>=40'b1111_1111_1111_1111_1111_1111_1111_1111)
//        show_reg[4:0]=5'b11111;
//        end
endmodule
