`timescale 1 ns / 1 ns
module loadable_dff(d, clk, clr, load, q);
    input d, clk, clr, load;
    output q;

    localparam ZERO = 1'b0, ONE = 1'b1;

    module_s1 s1_q(q, ZERO, d, ZERO, load, ZERO, ONE, clr, clk, q);
endmodule

module test_loadable_dff();
    reg d, clk, clr, load;
    wire q;
    loadable_dff ld_dff(d, clk, clr, load, q);

    initial clk = 1'b0;
    always #(5) clk = ~clk;

    initial begin
        {d, load, clr} = 3'b111;
        #50 clr = 1'b0;
        #50 d = 1'b0;
        #50 load = 1'b0;
        #50 d = 1'b1;
        #50 load = 1'b1;
        #50 $stop;
    end
endmodule