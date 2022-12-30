//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 02:06:25 AM
// Design Name: 
// Module Name: m_10
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


module m_10(clk, rst_n, en, dout, co);

    input clk,rst_n,en;
    output co;
    output[3:0] dout;
    reg [3:0] dout;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            dout <=4'b0000;
        else if(en)
            if(dout==4'b1001)
                dout <= 4'b0000;
            else
                dout <= dout + 1'b1;
        else
            dout <= dout;
    end
assign co = dout[0]&dout[3];
endmodule
