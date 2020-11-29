`timescale 1 ns / 1 ns
module register_8bit(in, clk, clr, load, out);
    input [7:0] in;
    input clk, clr, load;
    output [7:0] out;

    genvar i;
    generate for (i = 0; i < 8; i = i + 1)
        loadable_dff dff_i(in[i], clk, clr, load, out[i]);
    endgenerate
endmodule

module test_register_8bit();
    reg [7:0] in;
    reg clk, clr, load;
    wire [7:0] out;

    register_8bit reg_8(in, clk, clr, load, out);

    initial clk = 1'b0;
    always #(5) clk = ~clk;

    initial begin
        {load, clr} = 2'b11;
        in = 8'b0101_0101;
        #50 clr = 1'b0;
        #50 in = 8'b0011_0011;
        #50 load = 1'b0;
        #50 in = 8'b1100_1100;
        #50 load = 1'b1;
        #50 $stop;
    end 
endmodule
