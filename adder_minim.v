`timescale 1 ns / 1 ns
module adder_minim(a, b, res, cout);
    input [7:0] a, b;
    output [7:0] res;
    output cout;

    wire [7:0] c;
    assign c[0] = 1'b0;

    genvar i;
    generate for (i = 0; i < 8; i = i + 1)
        full_adder adder_i(a[i], b[i], c[i], res[i], c[i + 1]);
    endgenerate

    assign cout = c[7];
endmodule

module test_adder_minim();

    reg [7:0] a, b;
    wire [7:0] out;
    wire carry_out;

    adder_minim add(a, b, out, carry_out);

    initial begin
        a = 8'b01101001; 
        b = 8'b10110110;
        #100
        a = 8'b00001010;
        b = 8'b01010111;
        #100 $stop;
    end
endmodule