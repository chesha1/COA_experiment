`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/01 20:25:52
// Design Name: 
// Module Name: control
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


module control(
    input clk,
    output [24:0] control,
    input [7:0] IRout,
    output [7:0] mem_addr,
    output enb,
    output ena,
    input [7:0] MARout,
    input [7:0] PC,
    input flag
    );
    
    wire [24:0] control;
    reg [24:0] reg_control=25'b00000_00000_00000_00000_00000;
    assign control=reg_control;
    
    wire [7:0] IRout;
    wire [7:0] PC;
    
    wire [7:0] mem_addr;
    reg [7:0] reg_mem_addr=8'h00;
    assign mem_addr=reg_mem_addr;
    
    wire enb;
    reg reg_enb;
    assign enb=reg_enb;
    
    wire ena;
    reg reg_ena;
    assign ena=reg_ena;
    
    
    wire flag;
    
    wire clk;
    
    reg [6:0] car_sig=7'b000_0000;
    reg [7:0]counter=8'h00;
    
    
    
    always@(posedge clk)
    case(car_sig)
    7'd0:begin
    reg_control=25'b00000_00000_00000_00100_00001;//07
    
    reg_mem_addr=8'h05+PC;
    reg_enb=1;reg_ena=0;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    
    7'd1:begin
    reg_control=25'b00000_00000_00011_00000_10001;
    
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=car_sig+1;
        end
    end
    
    7'd2:begin
    reg_control=25'b00000_00000_00000_00100_00010;
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        
        case(IRout)//opcode : control unit address
            8'b0000_0001:car_sig=7'd8;
            8'b0000_0010:car_sig=7'd3;
            8'b0000_0011:car_sig=7'd20;
            8'b0000_0100:car_sig=7'd25;
            8'b0000_0101:car_sig=7'd12;
            8'b0000_0110:car_sig=7'd16;
            8'b0000_0111:car_sig=7'd19;
            8'b0000_1000:car_sig=7'd60;
            
            //DIV8'b0000_1001:car_sig=7'd30;
            8'b0000_1010:car_sig=7'd35;
            8'b0000_1011:car_sig=7'd40;
            8'b0000_1100:car_sig=7'd45;
            8'b0000_1101:car_sig=7'd48;
            8'b0000_1110:car_sig=7'd51;
            
            endcase
        
        
        end

    
    end
    
    
    
    7'd3:begin
    reg_mem_addr=MARout;reg_enb=1;reg_ena=0;
    reg_control=25'b00000_00000_00000_00100_00001;
    
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    
    end
    
    
    
    7'd4:
    begin
    reg_control=25'b00000_00000_01100_00000_00001;
    
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    
    7'd5:
    begin
    reg_control=25'b00000_00000_10000_00000_00001;
    
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    
    7'd6:
        begin
        reg_control=25'b00000_00000_00000_00000_01001;
        
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=car_sig+1;
        end
        end
    
    
        7'd7:
            begin
            reg_control=25'b00000_00000_00000_00000_00100;
            
    counter=counter+1;
            if(counter==8'd20)
            begin
            counter=0;
            car_sig=0;
            end
            end
            
            
    7'd8:
    begin
    reg_control=25'b00000_00000_00000_10000_00001;
    
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd9:
    begin
    reg_control=25'b00000_00000_00000_01000_00001;
    reg_mem_addr=MARout;reg_ena=1;reg_enb=0;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd10:
    begin
    reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd11:
    begin
    reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=0;
    end
    end
    
    7'd12:
    begin
    if(flag==0) reg_control=25'b00000_00000_00000_00001_00001;
    if(flag==1) reg_control=25'b00000_00000_00000_00000_00001;//_10001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    
    end
    
    
    7'd13:
    begin
        reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=0;
        end
        end
    
    
    //14 15 vacant
    
    
    
    7'd16:
    begin
    reg_control=25'b00000_00000_00000_00001_00001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
        end
    
    
    7'd17:
    begin
    reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=0;
    end
    end
    
7'd19:
        begin
        reg_control=25'b00000_00010_00000_00000_00000;
        counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=7'd65;
        end
        end
    
    
    
    7'd20:
    begin
    reg_control=25'b00000_00000_00000_00100_00001;
    reg_mem_addr=MARout;reg_ena=0;reg_enb=1;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd21:
    begin
    reg_control=25'b00000_00000_00100_00000_00001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd22:
    begin
    reg_control=25'b00000_00000_10000_00000_00001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd23:
    begin
    reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd24:
    begin
    reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=0;
    end
        end
    
    7'd25:
    begin
    reg_control=25'b00000_00000_00000_00100_00001;
        reg_mem_addr=MARout;reg_ena=0;reg_enb=1;
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=car_sig+1;
        end
    end
    
    7'd26:
    begin
    reg_control=25'b00000_00000_00100_00000_00001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd27:
    begin
    reg_control=25'b00000_00001_00000_00000_00001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd28:
    begin
    reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd29:
    begin
        reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=0;
        end
            end



    //30 31 32 33 34

    7'd35:
    begin
        reg_control=25'b00000_00000_00000_00100_00001;
        reg_mem_addr=MARout;reg_ena=0;reg_enb=1;
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=car_sig+1;
        end
        end
        
        
        

    7'd36:
    begin
        reg_control=25'b00000_00000_00100_00000_00001;
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=car_sig+1;
        end
        end
        
        
    7'd37:
    begin
        reg_control=25'b00000_00100_00000_00000_00001;
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=car_sig+1;
        end
        end
        
        7'd38:
        begin
        reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=car_sig+1;
        end
        end
        
        
        
            7'd39:
        begin
        reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
        if(counter==8'd20)
        begin
        counter=0;
        car_sig=0;
        end
        end
        
        
        
            7'd40:
        begin
            reg_control=25'b00000_00000_00000_00100_00001;
            reg_mem_addr=MARout;reg_ena=0;reg_enb=1;
    counter=counter+1;
            if(counter==8'd20)
            begin
            counter=0;
            car_sig=car_sig+1;
            end
            end
            
            
            
    
        7'd41:
        begin
            reg_control=25'b00000_00000_00100_00000_00001;
    counter=counter+1;
            if(counter==8'd20)
            begin
            counter=0;
            car_sig=car_sig+1;
            end
            end
            
            
        7'd42:
        begin
            reg_control=25'b00000_01000_00000_00000_00001;
    counter=counter+1;
            if(counter==8'd20)
            begin
            counter=0;
            car_sig=car_sig+1;
            end
            end
            
            7'd43:
            begin
            reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
            if(counter==8'd20)
            begin
            counter=0;
            car_sig=car_sig+1;
            end
            end
            
            
            
                7'd44:
            begin
            reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
            if(counter==8'd20)
            begin
            counter=0;
            car_sig=0;
            end
            end
            
            
            
            
            7'd45:
            begin
            reg_control=25'b00000_10000_00000_00000_00001;
    counter=counter+1;
            if(counter==8'd20)
            begin
            counter=0;
            car_sig=car_sig+1;
            end
            end
    
7'd46:
                        begin
                        reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
                        if(counter==8'd20)
                        begin
                        counter=0;
                        car_sig=car_sig+1;
                        end
                        end
                        
                        
    7'd47:
                                    begin
                                    reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
                                    if(counter==8'd20)
                                    begin
                                    counter=0;
                                    car_sig=0;
                                    end
                                    end
                                    
7'd48:
                                                begin
                                                reg_control=25'b00001_00000_00000_00000_00001;
    counter=counter+1;
                                                if(counter==8'd20)
                                                begin
                                                counter=0;
                                                car_sig=car_sig+1;
                                                end
                                                end
                                                
7'd49:
                                                                        begin
                                                                        reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
                                                                        if(counter==8'd20)
                                                                        begin
                                                                        counter=0;
                                                                        car_sig=car_sig+1;
                                                                        end
                                                                        end

    7'd50:
                                    begin
                                    reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
                                    if(counter==8'd20)
                                    begin
                                    counter=0;
                                    car_sig=0;
                                    end
                                    end
                                                                        
                        
7'd51:
                                                                                    begin
                                                                                    reg_control=25'b00010_00000_00000_00000_00001;
    counter=counter+1;
                                                                                    if(counter==8'd20)
                                                                                    begin
                                                                                    counter=0;
                                                                                    car_sig=car_sig+1;
                                                                                    end
                                                                                    end                        
                        
                            
    
    7'd52:
                                                                                    begin
                                                                                    reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
                                                                                    if(counter==8'd20)
                                                                                    begin
                                                                                    counter=0;
                                                                                    car_sig=car_sig+1;
                                                                                    end
                                                                                    end  
                                                                                    
    7'd53:
    begin
    reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=0;
    end
    end
    
    7'd54:
    begin
    reg_control=25'b00100_00000_00000_00000_00001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end            
    
    7'd55:
    begin
    reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end      
    
    
    7'd56:
    begin
    reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=0;
    end
    end        
    
    
    7'd57:
    begin
    reg_control=25'b01000_00000_00000_00000_00001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end               
    
    
    7'd58:
    begin
    reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end    
    
    
    7'd59:
    begin
    reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=0;
    end
    end     
    
    
    
    7'd60:
    begin
    reg_control=25'b00000_00000_00000_00100_00001;
    reg_mem_addr=MARout;reg_enb=1;reg_ena=0;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    
    7'd61:
    begin
    reg_control=25'b00000_00000_00100_00000_00001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    
    7'd62:
    begin
    reg_control=25'b10000_00000_00000_00000_00001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end
    
    7'd63:
    begin
    reg_control=25'b00000_00000_00000_00000_01001;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=car_sig+1;
    end
    end    
    
    
    7'd64:
    begin
    reg_control=25'b00000_00000_00000_00000_00100;
    counter=counter+1;
    if(counter==8'd20)
    begin
    counter=0;
    car_sig=0;
    end
    end
  
  
  
  
  
  
  
  
      7'd65:
    begin
    reg_control=25'b00000_00000_00000_00000_00000;
    end
    endcase
    
    
    
//    always@(posedge clk)
//    begin
//    if(PC==8'd13) 
//    begin
//    reg_mem_addr=8'h04;
//    reg_ena=0;reg_enb=1;
//    end
    
//    end
    
    
    
    
endmodule
