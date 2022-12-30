//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 03:29:24 AM
// Design Name: 
// Module Name: m_6
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

module m_6(clk, rst_n, en, dout, co);

    input clk;
    input rst_n;
    input en;
    output co;
    output[3:0] dout;
    reg [3:0] dout;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            dout <=4'b0000;
        else if(en)
            if(dout==4'b0101)
                dout <= 4'b0000;
            else
                dout <= dout + 1'b1;
        else
            dout <= dout;
    end
assign co = dout[0]&dout[2];
endmodule

