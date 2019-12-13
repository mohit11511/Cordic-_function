`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2019 14:45:40
// Design Name: 
// Module Name: cordic_tb
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

module cordic_tb;
    wire [31:0] cos_out;
    wire [31:0] sin_out;
    wire [31:0] angle;
    reg clock = 0;
    reg reset = 0;
    reg start = 0;
    
cordic cordic1(.clock(clock),.reset(reset),.start(start),.angle_in(32'hc0000000),.cos_out(cos_out),.sin_out(sin_out));
    
    always #10 clock = ~clock;
    
    initial begin
        $display("clock reset start cos_out      sin_out");
        $display("- - - -------- --------");
        $monitor("%b %b %b %h %h %h", clock, reset, start, cos_out, sin_out, angle);
        
        #12 reset = 1;
        #15 reset = 0;
        #20 start = 1;
        #10 start = 0;
        
        #330 $finish;
    end
endmodule
