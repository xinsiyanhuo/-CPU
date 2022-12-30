//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 03:38:50 AM
// Design Name: 
// Module Name: m_60
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


module m_60(clk, rst_n, en, dout, co);

    input clk;
    input rst_n;
    input en;
    output co;
    output[7:0] dout;
    wire co10_1,co10,co6;
    m_10 U1(.clk(clk), .rst_n(rst_n),.en(en),.dout(dout10), .co(co10_1));
    m_6 U2(.clk(clk), .rst_n(rst_n),.en(co10),.dout(dout6), .co(co6));
    and U3(co10,en,co10_1);
    and U4(co,co10,co6);
    assign dout = {dout6,dout10};
endmodule

module m_10(clk, rst_n, en, dout, co);

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
        else if(en == 1'b1)
            if(dout==4'b1001)
                dout <= 4'b0000;
            else
                dout <= dout + 1'b1;
        else
            dout <= dout;
    end
assign co = dout[0]&dout[3];
endmodule

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
        else if(en == 1'b1)
            if(dout==4'b0101)
                dout <= 4'b0000;
            else
                dout <= dout + 1'b1;
        else
            dout <= dout;
    end
assign co = dout[0]&dout[2];
endmodule