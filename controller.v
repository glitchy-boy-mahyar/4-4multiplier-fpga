`timescale 1 ns / 1 ns
module controller(clk, clr, start, s0, s1, s2, sig_rst, ld1, ld2, ready);
    input clk, clr, start;
    output s0, s1, s2, sig_rst, ld1, ld2, ready;
    wire [2:0] ps;
    state_machine sm(start, clk, clr, ps);
    signal_assigner sa(ps, s0, s1, s2, sig_rst, ld1, ld2, ready);
endmodule

module test_controller();
    reg clk = 1'b0, rst, start;
    wire s0, s1, s2, sig_rst, ld1, ld2, ready;

    controller c(clk, rst, start, s0, s1, s2, sig_rst, ld1, ld2, ready);

    always #10 clk = ~clk;

    initial begin
        rst = 1'b1;
        #200 start = 1'b0;
        #50 rst = 1'b0;
        #50 start = 1'b1;
        #200 $stop;
    end

    always @(c.sm.v)
        $display("%t: CNTL_TEST: ps=%d", $time, c.ps);
endmodule