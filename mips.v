`include "modules/i_memory.v"
`include "modules/reg_file.v"

module mips (input wire clk);

    // Registers
    reg [31:0] program_counter;
    wire [31:0] instruction_reg;
    wire [31:0] reg_1, reg_2;

    i_memory instruction_memory(.clk(clk), .address(program_counter), .instruction(instruction_reg));
    //reg_file my_reg_file(.read_data_1(reg_1), .read_data_2(reg_2), .clk(clk), .read_reg_1(instruction_reg[25:21]), .read_reg_2(instruction_reg[]));

    always @(posedge clk) begin
        if (instruction_reg[31:26] == 0) begin
            case (instruction_reg[5:0])
                32:; //Add.
                34:; //Sub.
                default:; // Doesn't matter.
            endcase
        end
    end
    
endmodule