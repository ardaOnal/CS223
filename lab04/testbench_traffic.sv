`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2020 18:12:02
// Design Name: 
// Module Name: testbench_traffic
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


module testbench_traffic();
    logic clk,reset,sa,sb;
    logic [2:0] La, Lb;
    
    // instantiate device under test
    traffic_light_system dut(clk,reset,sa,sb,La,Lb);
    
    // clock
    always
        begin
        clk = 1; #5;
        clk = 0; #5;
        end
     
    // apply inputs one at a time
    initial begin
        reset = 1; sa= 1; sb = 0; #10;
        reset = 0; #100; 
        sb = 1; #100;
        sa = 0; #100;
        sa = 0; sb = 0; #100;
    end      
endmodule
