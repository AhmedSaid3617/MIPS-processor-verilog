module i_memory (output reg [31:0] instruction,
                 input wire[31:0] address,
                 input wire clk);
reg [31:0] instruction_memory[4095:0];

always @(posedge clk) begin
    instruction <= instruction_memory[address];
end

initial begin
    instruction_memory[0] = 32'hABCD1234;
    instruction_memory[1] = 32'h3617;
    instruction_memory[2] = 32'hFEDC;
end

endmodule
