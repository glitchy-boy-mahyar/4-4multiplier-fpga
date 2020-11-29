`timescale 1 ns / 1 ns
module module_s1(d00, d01, d10, d11, a1, b1, a0, clr, clk, out);
    input d00, d01, d10, d11, a1, b1, a0, clr, clk;
    output out;

    wire dff_in, s1, s0;

    assign s1 = a1 | b1;
    assign s0 = a0 & clr;

    assign dff_in = ~s1 ? (~s0 ? d00 : d01) : (~s0 ? d10 : d11);

    dff s1_dff(dff_in, clk, clr, out);
endmodule