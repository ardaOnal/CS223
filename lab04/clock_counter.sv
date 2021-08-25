`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2020 17:37:38
// Design Name: 
// Module Name: clock_counter
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


module clock_counter(input clock, input reset, output logic new_clock);
    
    localparam risingEdgeNumber = 150000000;
    
    logic [31:0] count;
 
    always @ (posedge(clock), posedge(reset))
    begin
        if (reset == 1'b1)
            count <= 32'b0;
        else if (count == risingEdgeNumber - 1)
            count <= 32'b0;
        else
            count <= count + 1;
    end

    always @ (posedge(clock), posedge(reset))
    begin
        if (reset == 1'b1)
            new_clock <= 1'b0;
        else if (count == risingEdgeNumber - 1)
            new_clock <= ~new_clock;
        else
            new_clock <= new_clock;
    end
endmodule
