`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2020 17:56:21
// Design Name: 
// Module Name: eight_to_one_mux
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


module eight_to_one_mux(input logic [7:0]d,[2:0]s, output logic y);

    logic mux0;
    logic mux1;
    logic node0;
    logic node1;
    
    four_to_one_mux multiplexer0( d[3:0], s[1:0], mux0);
    four_to_one_mux multiplexer1( d[7:4], s[1:0], mux1);
    
    and( node0, ~s[2], mux0);
    and( node1, s[2], mux1);
    or( y, node0, node1);

endmodule
