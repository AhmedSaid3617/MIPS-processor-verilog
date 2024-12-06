module mux2_1 #(parameter N = 1) (out, in0, in1, control);
    
    output reg [N-1:0] out;
    input wire [31:0] in0, in1;
    input wire control;

    always @(*) begin
        out = control? in1:in0;
    end

endmodule