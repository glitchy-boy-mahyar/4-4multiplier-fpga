`timescale  1 ns / 1 ns
module fpga(clk, rst, start, in_1, in_2, out, ready);

    input clk, rst, start;
    input [3:0] in_1, in_2;
    output [7:0] out;
    output ready;

    wire sig_rst, ld1, ld2, s0, s1, s2;

    datapath d(in_1, in_2, clk, sig_rst, ld1, ld2, s0, s1, s2, out);
    controller c(clk, rst, start, s0, s1, s2, sig_rst, ld1, ld2, ready);

endmodule

module test_bench();

    reg clk = 1'b0 , rst, start;
    reg [3:0] in_1, in_2;
    integer golden_result;
    wire [7:0] out;
    wire ready;
    
    fpga f(clk, rst, start, in_1, in_2, out, ready);

    always #5 clk = ~clk;

    /*initial begin
        rst = 1; 
        #10 start = 1'b1;
        #10 rst = 0;
        in_1 = 4'b0110; in_2 = 4'b1001;
        #10 start = 1'b0;
        
        #200 in_1 = 4'b1010; in_2 = 4'b0011;
        start = 1'b1;
        #10 start = 1'b0;
        
        #200 in_1 = 4'b1010; in_2 = 4'b0011;
        start = 1'b1;
        #10 start = 1'b0;
        
        #200 in_1 = 4'b1011; in_2 = 4'b0101;
        start = 1'b1;
        #10 start = 1'b0;
        
        #200 in_1 = 4'b0111; in_2 = 4'b1100;
        start = 1'b1;
        #10 start = 1'b0;
        
        #200 in_1 = 4'b1011; in_2 = 4'b0101;
        start = 1'b1;
        #10 start = 1'b0;
        #200 $stop;

    end*/

    initial begin
        #10 in_1 = 0; rst = 1; 
        #10 start = 1'b0;
        #10 rst = 0;
        repeat (16) begin
            #100 in_2 = 0;
            repeat (16) begin
                #10 start = 1'b1;
                #10 start = 1'b0;
                golden_result = in_1 * in_2;
                #100 if (golden_result != out)
                    $display("ERROR: golden_res=%b, out=%b", in_1, in_2);
                #100 in_2 = in_2 + 1;
            end       
            in_1 = in_1 + 1;
        end
        #100 $stop;
    end

    // always@ (f.d.adder.a or f.d.adder.b)begin
    //     if(in_1 == 5 && in_2 == 5)begin
    //       $display("ERROR: a = %d b = %d out adder =%d,", f.d.adder.a, f.d.adder.b, f.d.adder.out);
    //     end
    // end
endmodule