module mux_8bit(in_1, in_2, s, out);
    input [7:0] in_1, in_2;
    input s;
    output [7:0] out;

    localparam ZERO = 1'b0, ONE = 1'b1;

    module_c1 mux_0(in_1[7], in_2[7], s, ZERO, ZERO, ZERO, ZERO, ZERO, out[7]),
              mux_1(in_1[6], in_2[6], s, ZERO, ZERO, ZERO, ZERO, ZERO, out[6]),
              mux_2(in_1[5], in_2[5], s, ZERO, ZERO, ZERO, ZERO, ZERO, out[5]),
              mux_3(in_1[4], in_2[4], s, ZERO, ZERO, ZERO, ZERO, ZERO, out[4]),
              mux_4(in_1[3], in_2[3], s, ZERO, ZERO, ZERO, ZERO, ZERO, out[3]),
              mux_5(in_1[2], in_2[2], s, ZERO, ZERO, ZERO, ZERO, ZERO, out[2]),
              mux_6(in_1[1], in_2[1], s, ZERO, ZERO, ZERO, ZERO, ZERO, out[1]),
              mux_7(in_1[0], in_2[0], s, ZERO, ZERO, ZERO, ZERO, ZERO, out[0]);
endmodule