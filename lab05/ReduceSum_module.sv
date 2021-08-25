`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2020 17:17:56
// Design Name: 
// Module Name: ReduceSum_module
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
module ReduceSum_module(input logic clock, enable, input logic [7:0] value, output logic [11:0] outputSum, output logic [3:0] address );
        logic [4:0] counter = 5'b00000; // Initializing
        logic [11:0] Sum = 12'b0; // Initializing, sum is 12 bits because if every 16 8 bit value is maximum we get a 12 bit value.
        
        typedef enum logic [1:0] {S0, S1, S2, S3} statetype;         
        statetype [1:0] state, nextState;

        // register 
        always_ff @(posedge clock)
        begin 
             state <= nextState; 
        end 

        // state transition conditions
        always_ff @ (posedge clock)
        case(state) 
            S0: // If enable is 1 it transitions to state1, otherwise remains in state0
            begin 
                if (enable)
                    nextState <= S1;
                else
                    nextState <= S0; 
            end 
            S1: // Initialization state
            begin 
                counter <=  5'b0;
                Sum <= 12'b0;
                nextState <= S2;
            end 
            S2: // Counts until it is 15 and adds the value to the sum 15 times
            begin
                counter = counter + 1;
                Sum = Sum + value;
                if (counter != 5'b01111)// value of maximum count, remains its state until it gets to 15
                    nextState <= S2;
                else 
                    nextState <= S3; // changes state when count is 15
            end 
            S3: 
            begin 
                Sum = Sum + value; // We added our value 15 times but we actually want to add it 16 times
                outputSum = Sum; // Producing the output sum
                nextState <= S0; // Going back to state0
            end 
            default:
                nextState<= S0;
         endcase
         
         assign address = counter; // Assigning output address
endmodule
