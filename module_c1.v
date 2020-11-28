`timescale 1 ns / 1 ns
module module_c1(a0, a1, sa, b0, b1, sb, s0, s1, f);
    input a0, a1, sa, b0, b1, sb, s0, s1;
    output f;

    wire f1, f2, s2;

    assign f1 = ~sa ? a0 : a1;
    assign f2 = ~sb ? b0 : b1;
    assign s2 = s0 | s1;

    assign f = ~s2 ? f1 : f2;
endmodule