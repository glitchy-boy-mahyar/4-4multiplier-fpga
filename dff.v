`timescale 1 ns / 1 ns
module dff(in, clk, clr, out);
    input in, clk, clr;
    output reg out;

    always @(posedge clk) begin
        if (clr)
            out <= 1'b0;
        else
            out <= in;
    end
endmodule
