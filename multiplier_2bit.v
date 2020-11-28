`timescale 1 ns / 1 ns
module multiplier_2bit(a, b, res);
    localparam ZERO = 1'b0, ONE = 1'b1;
    input [1:0] a, b;
    output [3:0] res;

    wire a0b0, a0b1, a1b0, a1b1;
    module_c1 c1_a0b0(ZERO, a[0], b[0], ZERO, ZERO, ZERO, ZERO, ZERO, a0b0),
              c1_a0b1(ZERO, a[0], b[1], ZERO, ZERO, ZERO, ZERO, ZERO, a0b1),
              c1_a1b0(ZERO, a[1], b[0], ZERO, ZERO, ZERO, ZERO, ZERO, a1b0),
              c1_a1b1(ZERO, a[1], b[1], ZERO, ZERO, ZERO, ZERO, ZERO, a1b1);

    assign res[0] = a0b0;

    module_c1 c1_res1(ZERO, ONE, a0b1, ONE, ZERO, a0b1, a1b0, ZERO, res[1]),
              c1_res2(a1b1, ZERO, a0b0, ZERO, ZERO, ZERO, ZERO, ZERO, res[2]),
              c1_res3(ZERO, a0b0, a1b1, ZERO, ZERO, ZERO, ZERO, ZERO, res[3]);
endmodule

module test_multiplier_2bit();
    reg [1:0] a, b;
    wire [3:0] res;
    multiplier_2bit mult(a, b, res);

    integer i, j;
    initial begin
        {a, b} = 4'b0000;
        for (i = 0; i < 4; i = i + 1) begin
            #100 b = 2'b00;
            for (j = 0; j < 4; j = j + 1) begin
                #100 b = b + 2'b01;
            end
            #100 a = a + 2'b01;
        end
        #200 $stop;
    end
endmodule