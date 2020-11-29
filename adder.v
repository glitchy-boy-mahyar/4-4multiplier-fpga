module adder(a, b, out, carry_out);

    input [7:0] a, b;
    output carry_out;
    output [7:0] out;

    localparam ZERO = 1'b0, ONE = 1'b1;

    wire c1, c2, c3, c4, c5,
        c6, c7;
    wire a1_XOR_b1, a1_AND_b1, c1_AND_a1_XOR_b1, a2_XOR_b2,
         a2_AND_b2, c2_AND_a2_XOR_b2;

    module_c2 out0(ZERO, ZERO, ONE, ONE, a[0], b[0], a[0], b[0], out[0]),
              _c1(ZERO, ZERO, ZERO, ONE, a[0], b[0], a[0], b[0], c1);

    module_c2 _a1_XOR_b1(ZERO, ZERO, ONE, ZERO, a[1], b[1], a[1], b[1], a1_XOR_b1),
              _XOR_c1(ZERO, ZERO, ONE, ZERO, a1_XOR_b1, c1, a1_XOR_b1, c1, out[1]),
              _a1_AND_b1(ZERO, ZERO, ZERO, ONE, a[1], b[1], a[1], b[1], a1_AND_b1),
              _c1_AND_a1_XOR_b1(ZERO, ZERO, ZERO, ONE, c1, a1_XOR_b1, c1, a1_XOR_b1, c1_AND_a1_XOR_b1),
              _c2(ZERO, ZERO, ONE, ONE, a1_AND_b1, c1_AND_a1_XOR_b1, a1_AND_b1, c1_AND_a1_XOR_b1, c2);

    module_c2 _a2_XOR_b2(ZERO, ZERO, ONE, ZERO, a[2], b[2], a[2], b[2], a2_XOR_b2),
              _XOR_c2(ZERO, ZERO, ONE, ZERO, a2_XOR_b2, c2, a2_XOR_b2, c2, out[2]),
              _a2_AND_b2(ZERO, ZERO, ZERO, ONE, a[2], b[2], a[2], b[2], a2_AND_b2),
              _c2_AND_a2_XOR_b2(ZERO, ZERO, ZERO, ONE, c2, a2_XOR_b2, c2, a2_XOR_b2, c2_AND_a2_XOR_b2),
              _c3(ZERO, ZERO, ONE, ONE, a2_AND_b2, c2_AND_a2_XOR_b2, a2_AND_b2, c2_AND_a2_XOR_b2, c3);

    wire a3_XOR_b3, a3_AND_b3, c3_AND_a3_XOR_b3;

    module_c2 _a3_XOR_b3(ZERO, ZERO, ONE, ZERO, a[3], b[3], a[3], b[3], a3_XOR_b3),
              _XOR_c3(ZERO, ZERO, ONE, ZERO, a3_XOR_b3, c3, a3_XOR_b3, c3, out[3]),
              _a3_AND_b3(ZERO, ZERO, ZERO, ONE, a[3], b[3], a[3], b[3], a3_AND_b3),
              _c3_AND_a3_XOR_b3(ZERO, ZERO, ZERO, ONE, c3, a3_XOR_b3, c3, a3_XOR_b3, c3_AND_a3_XOR_b3),
              _c4(ZERO, ZERO, ONE, ONE, a3_AND_b3, c3_AND_a3_XOR_b3, a3_AND_b3, c3_AND_a3_XOR_b3, c4);

    wire a4_XOR_b4, a4_AND_b4, c4_AND_a4_XOR_b4;

    module_c2 _a4_XOR_b4(ZERO, ZERO, ONE, ZERO, a[4], b[4], a[4], b[4], a4_XOR_b4),
              _XOR_c4(ZERO, ZERO, ONE, ZERO, a4_XOR_b4, c4, a4_XOR_b4, c4, out[4]),
              _a4_AND_b4(ZERO, ZERO, ZERO, ONE, a[4], b[4], a[4], b[4], a4_AND_b4),
              _c4_AND_a4_XOR_b4(ZERO, ZERO, ZERO, ONE, c4, a4_XOR_b4, c4, a4_XOR_b4, c4_AND_a4_XOR_b4),
              _c5(ZERO, ZERO, ONE, ONE, a4_AND_b4, c4_AND_a4_XOR_b4, a4_AND_b4, c4_AND_a4_XOR_b4, c5);

    wire a5_XOR_b5, a5_AND_b5, c5_AND_a5_XOR_b5;

    module_c2 _a5_XOR_b5(ZERO, ZERO, ONE, ZERO, a[5], b[5], a[5], b[5], a5_XOR_b5),
              __XOR_c5(ZERO, ZERO, ONE, ZERO, a5_XOR_b5, c5, a5_XOR_b5, c5, out[5]),
              _a5_AND_b5(ZERO, ZERO, ZERO, ONE, a[5], b[5], a[5], b[5], a5_AND_b5),
              _c5_AND_a5_XOR_b5(ZERO, ZERO, ZERO, ONE, c5, a5_XOR_b5, c5, a5_XOR_b5, c5_AND_a5_XOR_b5),
              _c6(ZERO, ZERO, ONE, ONE, a5_AND_b5, c5_AND_a5_XOR_b5, a5_AND_b5, c5_AND_a5_XOR_b5, c6);

    wire a6_XOR_b6, a6_AND_b6, c6_AND_a6_XOR_b6;

    module_c2 _a6_XOR_b6(ZERO, ZERO, ONE, ZERO, a[6], b[6], a[6], b[6], a6_XOR_b6),
              _XOR_c6(ZERO, ZERO, ONE, ZERO, a6_XOR_b6, c6, a6_XOR_b6, c6, out[6]),
              _a6_AND_b6(ZERO, ZERO, ZERO, ONE, a[6], b[6], a[6], b[6], a6_AND_b6),
              _c6_AND_a6_XOR_b6(ZERO, ZERO, ZERO, ONE, c6, a6_XOR_b6, c6, a6_XOR_b6, c6_AND_a6_XOR_b6),
              _c7(ZERO, ZERO, ONE, ONE, a6_AND_b6, c6_AND_a6_XOR_b6, a6_AND_b6, c6_AND_a6_XOR_b6, c7);

    module_c2 _a7_XOR_b7(ZERO, ZERO, ONE, ZERO, a[7], b[7], a[7], b[7], a7_XOR_b7),
              _XOR_c7(ZERO, ZERO, ONE, ZERO, a7_XOR_b7, c7, a7_XOR_b7, c7, out[7]),
              _a7_AND_b7(ZERO, ZERO, ZERO, ONE, a[7], b[7], a[7], b[7], a7_AND_b7),
              _c7_AND_a7_XOR_b7(ZERO, ZERO, ZERO, ONE, c7, a7_XOR_b7, c7, a7_XOR_b7, c7_AND_a7_XOR_b7),
              _carry_out(ZERO, ZERO, ONE, ONE, a7_AND_b7, c7_AND_a7_XOR_b7, a7_AND_b7, c7_AND_a7_XOR_b7, carry_out);
endmodule

module test_adder();

    reg [7:0] a, b;
    wire [7:0] out;
    wire carry_out;

    adder add(a, b, out, carry_out);

    initial begin
        a = 8'b01101001; 
        b = 8'b10110110;
        #100
        a = 8'b00001010;
        b = 8'b01010111;
        #100 $stop;
    end
endmodule
              