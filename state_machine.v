`timescale 1 ns / 1 ns
module state_machine(start, clk, clr, v);
    input start, clk, clr;
    output [2:0] v;

    localparam ZERO = 1'b0, ONE = 1'b1;
    
    // next_v0 = ~v0.(~v2.(v1 + s) + v2.~v1) = ~v0.partial_nv0
    wire partial_nv0;
    module_c1 c1_next_v0(start, ONE, v[1], ONE, ZERO, v[1], v[2], ZERO, partial_nv0);
    module_s2 s2_next_v0(partial_nv0, ZERO, ZERO, ZERO, ZERO, ZERO, v[0], ONE, clr, clk, v[0]);

    // next_v1 = ~v1.v0 + v1.~(v0 + v2)
    wire not_v0_or_v2;
    module_c1 c1_not_v0_or_v2(ONE, ONE, ONE, ZERO, ZERO, ZERO, v[0], v[2], not_v0_or_v2);
    module_s2 s2_next_v1(v[0], not_v0_or_v2, ZERO, ZERO, ZERO, ZERO, v[1], ONE, clr, clk, v[1]);

    // next_v2 = ~v1.v2 + v1.(~v2.v0)
    module_s2 s2_next_v2(v[2], v[2], v[0], ZERO, v[1], ZERO, v[2], ONE, clr, clk, v[2]);
endmodule

module test_state_machine();
    reg start, clk, clr;
    wire [2:0] v;

    state_machine sm(start, clk, clr, v);

    initial clk = 1'b0;
    always #(5) clk = ~clk;

    initial begin
        clr = 1'b1;
        start = 1'b1;
        #50 clr = 1'b0;
        #200 start = 1'b0;
        #200 start = 1'b1;
        #200 start = 1'b0;
        #200 $stop;
    end
endmodule