`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2020 21:06:42
// Design Name: 
// Module Name: combined_traffic_light
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


module combined_traffic_light(input logic clk,reset,sa,sb,output logic [2:0] La, Lb);

    logic new_clock;
    
    clock_counter newclock(clk,reset,new_clock);
    
    traffic_light_system improved_fsm(new_clock,reset,sa,sb,La,Lb);
    
endmodule
