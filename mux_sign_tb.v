`include "modules/mux.v"
`include "modules/sign_ext.v"

module top ();

    wire [4:0]out;
    reg [4:0] in0, in1;
    reg control;

    reg [15:0] in;
    wire[31:0] out_mux;

    mux2_1 #(5) my_mux (out, in0, in1, control);
    sign_ext mod(in, out_mux);

    initial begin
        $monitor("out_mux=%x", out_mux);
        in = 16'h8094;
    end

endmodule