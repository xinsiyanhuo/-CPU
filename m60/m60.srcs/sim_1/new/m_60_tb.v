`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 03:39:19 AM
// Design Name: 
// Module Name: m_60_tb
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

module m_60_tb;
    reg clk;
    reg rst_n;
    reg en;
    wire[7:0] dout;
    wire co;
    
    always
        begin
          //clk = 1'b0;
          //forever
          #10 clk = ~clk;
        end
    
    initial
        begin
            clk = 1'b0;
            rst_n = 1'b1;
            en = 1'b0;
            #10 rst_n = 1'b0;
            #10 rst_n = 1'b1;     
            en = 1'b1;       
        end
    m_60 U1(.clk(clk), .rst_n(rst_n),.en(en),.dout(dout),.co(co));
endmodule
