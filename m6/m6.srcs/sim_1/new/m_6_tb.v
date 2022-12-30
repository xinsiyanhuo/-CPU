`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 03:33:47 AM
// Design Name: 
// Module Name: m_6_tb
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

module m_6_tb;
    reg clk;
    reg rst_n;
    reg en;
    wire[3:0] dout;
    wire co;
    
    always
    begin
        #1 clk = ~clk;
    end
    initial
        begin
            clk = 1'b0;
            rst_n = 1'b1;
            en = 1'b0;
            #2 rst_n = 1'b0;
            #2 rst_n = 1'b1;
            en = 1'b1;
        end
    m_6 U1(.clk(clk), .rst_n(rst_n),.en(en),.dout(dout), .co(co));
endmodule
