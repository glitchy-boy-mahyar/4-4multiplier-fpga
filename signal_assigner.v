`timescale 1 ns / 1 ns
module signal_assigner(ps, s0, s1, s2, sig_rst, ld1, ld2, ready);
    input [2:0] ps;
    output s0, s1, s2, sig_rst, ld1, ld2, ready;

    localparam ZERO = 1'b0, ONE = 1'b1;
    
    // ready = ~ps[0].~(ps[1] + ps[2])
    module_c1 c1_ready(ONE, ZERO, ps[0], ZERO, ZERO, ZERO, ps[1], ps[2], ready);

    // sig_rst = ~(ps[2] + ps[1]).ps[0]
    module_c1 c1_sig_rst(ZERO, ONE, ps[0], ZERO, ZERO, ZERO, ps[1], ps[2], sig_rst);

    // ld1 = ~(ps[2] + ps[0]).ps[1]
    module_c1 c1_ld1(ZERO, ONE, ps[1], ZERO, ZERO, ZERO, ps[2], ps[0], ld1);

    // ld2 = ps[2].(~ps[1] + ~ps[0]) + ~ps[2].(ps[1]ps[0])
    module_c2 c2_ld2(ZERO, ONE, ONE, ZERO, ps[2], ZERO, ps[1], ps[0], ld2);

    // s0 = ~ps[0].(ps[2]~ps[1]) + ps[0].(~ps[2]ps[1])
    module_c1 c1_s0(ps[2], ZERO, ps[1], ps[1], ZERO, ps[2], ps[0], ZERO, s0);

    // s2 = s1 = ~ps[1].(ps[0]ps[2]) + ps[1].(ps[0].~ps[2])
    module_c1 c1_s1(ZERO, ps[0], ps[2], ps[0], ZERO, ps[2], ps[1], ZERO, s1);
    assign s2 = s1;
endmodule