module alu (alu_result, ALU_op, operand1, operand2);
    
    output reg [31:0] alu_result;
    input wire [1:0] ALU_op;
    input wire [31:0] operand1, operand2;

    always @(*) begin
        case (ALU_op)
            // Add
            00: alu_result = operand1 + operand2;
            01: alu_result = operand1 - operand2;
            default: alu_result = 0;
        endcase
    end

endmodule
