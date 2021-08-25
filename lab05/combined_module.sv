`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2020 13:32:16
// Design Name: 
// Module Name: combined_module
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


module combined_module( input logic clk, input logic [3:0] buttons, input logic [7:0] data, input logic [3:0] address,
    output logic [11:0] sum, output logic [6:0] seg, output logic dp, output logic [3:0] an);
    
    logic [3:0] count1; // Counter for address 1
    logic [3:0] count2; // Counter for address 2
    
    logic Prev, Next, Enter, Sum; // Logics for four buttons
    
    logic [11:0] tmpSum;
    logic [7:0] readData1;
    logic [7:0] readData2;
    logic [11:0] summation;
    
    // Calling the debouncer methods for the buttons
    debounce prev(clk, buttons[3], Previous);
    debounce next(clk, buttons[2], Next);
    debounce enter(clk, buttons[1], Enter);
    debounce summ(clk, buttons[0], Sum);
    
    always_ff@ (posedge clk)
    begin
        if (Previous)
        begin
            if ( count1 != 0)
                count1 <= count1 - 1; // Decrementing the index of address by one.
            else
                count1 <= 4'b1111; // This is case for address = 0, It goes back to address = 15.
        end
        else if (Next)
        begin
            if ( count1 == 4'b1111)
                count1 <= 4'b0000; // This is case for address = 15, It goes to address = 0.
            else
                count1 <= count1 + 1; // Incrementing the index of address by one.
        end  
        else if (Sum)
        begin
            tmpSum <= summation; // If the sum button is clicked, it assigns the new summation to our inner variable.
        end 
    end  
    // Calling the methods.
    memory_module memory(clk, Enter,data,address,count1,count2,readData1,readData2);
    SevSeg_4digit displayer(clk,count1,0,readData1[7:4],readData1[3:0],seg,dp,an);
    ReduceSum_module sumModule(clk, Enter, readData2, summation, count2);
    assign sum = tmpSum; // Assigning the inner summation to the output
endmodule
