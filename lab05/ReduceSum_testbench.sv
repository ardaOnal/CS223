`timescale 1ns / 1ps

module ReduceSum_testbench();
    logic clk, enable;
    logic [7:0] value;
    logic [11:0] sum; 
    logic [3:0] address;

    reducesum_Test dut( clk, enable, value, sum, address );

    always
        begin
            clk = 1; #20; clk = 0; #20;
        end

    initial begin
        enable = 1; sum = 0; address = 0;
        value = 8'b00000001;
    end
endmodule
