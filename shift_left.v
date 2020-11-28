module shift_left(in, out);

    input [7:0] in;
    output [7:0] out;

    localparam ZERO = 1'b0, ONE = 1'b1;

    module_c1 c1_0(in[5], ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, out[7]),
              c1_1(in[4], ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, out[6]),
              c1_2(in[3], ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, out[5]),
              c1_3(in[2], ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, out[4]),
              c1_4(in[1], ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, out[3]),
              c1_5(in[0], ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, out[2]),
              c1_6(ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, out[1]),
              c1_7(ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, ZERO, out[0]);
endmodule

module test_shift_left();

    reg [7:0] in;
    wire [7:0] out;

    shift_left s(in, out);

    initial begin
        in = 8'b11111111;
        #100 in = 8'b10101101;
        #100 $stop; 
    end
endmodule