module i_memory (output reg [31:0] instruction,
                 input wire[31:0] address,
                 input wire clk);
reg [31:0] instruction_memory[0:1023];

always @(*) begin
    instruction <= instruction_memory[address];
end

initial begin
    // lw $t0, 0 ($s3)
    instruction_memory[0] = 32'h8E680000;

    // lw $t1, 4 ($s3)
    instruction_memory[4] = 32'h8E690004;

    // add $s0, $t0, $t1
    instruction_memory[8] = 32'h01098020;

    // sw $s0, 12 ($a0)
    instruction_memory[12] = 32'hAC90000C;

    // j 0x64
    instruction_memory[16] = 32'h08000019;

    // sub $s0, $t0, $t1
    instruction_memory[100] = 32'h01098022;

    // sw $s0, 16 ($a0)
    instruction_memory[104] = 32'hAC900010;
end

endmodule
