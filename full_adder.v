`timescale 1 ns / 1 ns
module full_adder(a, b, cin, res, cout);
    input a, b, cin;
    output res, cout;

    localparam ZERO = 1'b0, ONE = 1'b1;
    // res = (a xor b) xor c
    wire a_xor_b;
    module_c1 c1_a_xor_b(ZERO, ONE, a, ONE, ZERO, a, b, ZERO, a_xor_b),
              c1_res(ZERO, ONE, a_xor_b, ONE, ZERO, a_xor_b, cin, ZERO, res);

    // cout = ~c.(ab) + c.(a + b)
    module_c1 c1_cout(ZERO, a, b, a, ONE, b, cin, ZERO, cout);
endmodule

module test_full_adder();
    reg a, b, cin;
    wire res, cout;

    full_adder fa(a, b, cin, res, cout);

    initial begin
        {a, b, cin} = 3'b000;
        repeat(8) begin #(10)
            {a, b, cin} = {a, b, cin} + 3'b001;
        end
        #(10) $stop;
    end
    
endmodule