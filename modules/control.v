module control_u (mem_read, mem_to_reg, mem_write, reg_write, jump, ALU_op, op_code, funct);
    
    output reg mem_read, mem_to_reg, mem_write, reg_write, jump;
    output reg [1:0] ALU_op;
    input wire [5:0] op_code, funct;

    always @(*) begin
        case (op_code)
            // R-format
            0: begin
                // Add
                if (funct == 32) begin
                    mem_read = 1'bx;
                    mem_to_reg = 0;
                    mem_write = 0;
                    reg_write = 1;
                    jump = 0;
                    ALU_op = 2'b00;
                end
                // Sub
                else if (funct == 34) begin
                    mem_read = 1'bx;
                    mem_to_reg = 0;
                    mem_write = 0;
                    reg_write = 1;
                    jump = 0;
                    ALU_op = 2'b01;
                end
            end

            // Load
            35: begin
                mem_read = 1;
                mem_to_reg = 1;
                mem_write = 0;
                reg_write = 1;
                jump = 0;
                ALU_op = 00;
            end

            // Store
            43: begin
                mem_read = 0;
                mem_to_reg = 1;
                mem_write = 1;
                reg_write = 0;
                jump = 0;
                ALU_op = 00;
            end

            // Jump
            2: begin
                mem_read = 1'bX;
                mem_to_reg = 1'bX;
                mem_write = 0;
                reg_write = 0;
                jump = 1;
                ALU_op = 2'bxx;
            end
        endcase
    end

endmodule