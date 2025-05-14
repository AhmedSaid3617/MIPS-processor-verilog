`include "modules/i_memory.v"
`include "modules/reg_file.v"
`include "modules/control.v"
`include "modules/mux.v"
`include "modules/alu.v"
`include "modules/sign_ext.v"
`include "modules/data_mem.v"

module mips ();

    reg clk;
    // Registers
    reg [31:0] program_counter;
    wire [31:0] instruction_reg;
    wire [31:0] read_data_1, read_data_2;

    wire mem_read, mem_to_reg, mem_write, reg_write, jump, reg_dst, ALU_src;
    wire [1:0] ALU_op;

    wire [4:0] write_reg;

    wire [31:0] alu_result, operand2;

    wire [31:0] immediate_ext;

    wire [31:0] RAM_read_data;
    wire [31:0] reg_write_data;

    control_u control_unit(mem_read, mem_to_reg, mem_write, reg_write, jump, ALU_op, reg_dst, ALU_src, instruction_reg[31:26], instruction_reg[5:0]);
    i_memory instruction_memory(.clk(clk), .address(program_counter), .instruction(instruction_reg));
    reg_file my_reg_file(.read_data_1(read_data_1), .read_data_2(read_data_2), .clk(clk), .read_reg_1(instruction_reg[25:21]), .read_reg_2(instruction_reg[20:16]), .write_reg(write_reg), .write_en(reg_write), .write_data(reg_write_data));
    
    // TODO: implement reg_dst.
    mux2_1 #(.N(5)) write_reg_mux(.out(write_reg), .in0(instruction_reg[20:16]), .in1(instruction_reg[15:11]), .control(reg_dst));
    alu my_alu(alu_result, ALU_op, read_data_1, operand2);

    // TODO: implement ALU_src.
    mux2_1 #(.N(32)) alu_op_mux (.in0(read_data_2), .in1(immediate_ext), .out(operand2), .control(ALU_src));
    sign_ext sign_ext_mod(instruction_reg[15:0], immediate_ext);

    data_mem RAM (.read_data(RAM_read_data), .clk(clk), .mem_write(mem_write), .mem_read(mem_read), .write_data(read_data_2), .address(alu_result));

    mux2_1 #(.N(32)) mem_out_mux(.in0(alu_result), .in1(RAM_read_data), .out(reg_write_data), .control(mem_to_reg));
    
    always @(posedge clk) begin
        if (!jump) begin
            program_counter <= program_counter + 4;
        end
        else begin
            program_counter = {program_counter[31:28], {instruction_reg[25:0] << 2}};
        end
    end
    
    integer i;
    initial begin
        program_counter <= 0;

        $monitor("PC:%x %x\t ALU result: %x\tOperand1:%x, Operand2:%x\tReg write data:%x", program_counter, instruction_reg, alu_result, read_data_1, operand2, reg_write_data);

        clk <= 0;
        for (i = 0; i<20; i = i + 1) begin
            #1
            clk <= ~ clk;
        end
    end

endmodule