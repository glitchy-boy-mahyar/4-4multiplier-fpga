module mux_2bit(in_1, in_2, s, out);
    input [1:0] in_1, in_2;
    input s;
    output [1:0] out;

    localparam ZERO = 1'b0, ONE = 1'b1;

    module_c1 mux_0(in_1[1], in_2[1], s, ZERO, ZERO, ZERO, ZERO, ZERO, out[1]),
              mux_1(in_1[0], in_2[0], s, ZERO, ZERO, ZERO, ZERO, ZERO, out[0]);
endmodule

module test_mux_2bit();

    reg  [1:0] in_1, in_2;
    reg  s;
    wire [1:0] out;

    mux_2bit m(in_1, in_2, s, out);

    initial begin
        in_1 = 2'b01;
        in_2 = 2'b10;
        s = 1;
        #100 $stop;
    end
endmodule
