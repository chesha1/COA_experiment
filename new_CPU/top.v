`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/03 23:09:45
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


module top(
//    input wire clk,
//    output wire [6:0]a_to_g,
//    output wire [7:0]AN,
    
////    //test
//    output wire LED
    

    );
    
    
    
    
    
    
    
    
//    reg [15:0]din=8'h12;
//    reg ena=1'b1;
//    reg enb=1'b1;
    reg wea=1'b1;
//    wire [15:0]dout;
    reg [7:0]addr=8'h12;
    
    
    
    wire [24:0] control;
    wire [7:0] IRout;
    wire [7:0]mem_addr;
    wire enb;wire ena;
    wire [15:0]dout;
    wire [15:0]din;
    
    wire [15:0]ACC_in;
    wire [15:0]MBRout;
    wire [7:0]PC_in;
    wire [7:0]MARout;
    wire [7:0]PCout;
    wire [15:0]BRout;
    wire [31:0]showout;
    wire [15:0]ACCout;
    wire flag;
    
    
    reg disp;
    
    


    reg clk;    
    wire [6:0] a_to_g;
    wire [7:0] AN;    
    initial 
    begin
    clk=0;
    forever #5 clk=~clk;
    end
    
    
    
    
    
//    initial
//    begin
//    #3000 wea=1;ena=1;enb=0;addr=8'h01;din=16'h0001;
//    #1000 wea=1;ena=1;enb=0;addr=8'h02;din=16'h0064;
//    #1000 ena=0;enb=1;addr=8'h00;
//    #1000 ena=0;enb=1;addr=8'h01;

    

    
    
    
    blk_mem_gen_0 ram1 (
      .clka(clk),    // input wire clka
      .ena(ena),      // input wire ena
      .wea(wea),      // input wire [0 : 0] wea
      .addra(mem_addr),  // input wire [7 : 0] addra
      .dina(din),    // input wire [15 : 0] dina
      .clkb(clk),    // input wire clkb
      .enb(enb),      // input wire enb
      .addrb(mem_addr),  // input wire [7 : 0] addrb
      .doutb(dout)  // output wire [15 : 0] doutb
    );
    
    control control1(
    .clk(clk),
    .control(control),
    .IRout(IRout),
    .mem_addr(mem_addr),
    .enb(enb),
    .ena(ena),
    .MARout(MARout),
    .PC(PCout),
    .flag(flag)
    
    
    );


    mbr mbr1(
    .clk(clk),
    .control(control),
    .memory_in(dout),
    .ACC_in(ACCout),
    .toMEMORY(din),
    .MBRout(MBRout)
    );

    mar mar1(
    .clk(clk),
    .control(control),
    .MBR_in(MBRout[7:0]),
    .PC_in(PCout),
    .MARout(MARout)
    );
    
    ir ir1(
    .clk(clk),
    .control(control),
    .MBR_in(MBRout[15:8]),
    .IRout(IRout)
        );
        
        
    pc pc1(
    .clk(clk),
    .control(control),
    .MBR_in(MBRout[7:0]),
    .PCout(PCout)
    );

    alu alu1(
    .clk(clk),
    .control(control),
    .BR_in(BRout),
    .showout(showout),    
    .ACCout(ACCout),
    .flag(flag)
);

    br br1(
    .clk(clk),
    .control(control),
    .MBR_in(MBRout),
    .BRout(BRout)
);
    
    
    
    display display1(
.x(showout),
.clk(clk),
.a_to_g(a_to_g),
.an(AN)

);

  reg [31:0]showout_reg=0;
    reg reg_LED=0;
    assign LED=reg_LED;
    //test
    always@(*)
    begin
    showout_reg=showout;
    if(dout==16'h08A1) reg_LED=1;
    //else if(showout!=32'h00000000) reg_LED=0;
    end  
    
    
    
    
endmodule


