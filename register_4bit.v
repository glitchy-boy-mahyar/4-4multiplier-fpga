`timescale 1 ns / 1 ns
module register_4bit(in, clk, clr, load, out);
    input [3:0] in;
    input clk, clr, load;
    output [3:0] out;

    genvar i;
    generate for (i = 0; i < 4; i = i + 1)
        loadable_dff dff_i(in[i], clk, clr, load, out[i]);
    endgenerate
endmodule

module test_register_4bit();
    reg [3:0] in;
    reg clk, clr, load;
    wire [3:0] out;

    register_4bit reg_4(in, clk, clr, load, out);

    initial clk = 1'b0;
    always #(5) clk = ~clk;

    initial begin
        {load, clr} = 2'b11;
        in = 4'b0101;
        #50 clr = 1'b0;
        #50 in = 4'b0011;
        #50 load = 1'b0;
        #50 in = 4'b1100;
        #50 load = 1'b1;
        #50 $stop;
    end 
endmodule
