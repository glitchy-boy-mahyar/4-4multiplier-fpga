module module_c2(D00, D01, D10, D11, a1, b1, a0, b0, out);

    input D00, D01, D10, D11, a1, b1, a0, b0;
    output out;

    wire f1, f2;

    assign f1 = a1 | b1;
    assign f2 = a0 & b0;

    assign out = ~f1 ? (~f2 ? D00 : D01) : (~f2 ? D10 : D11);
endmodule 