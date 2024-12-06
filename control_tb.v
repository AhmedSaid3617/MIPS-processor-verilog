`include "modules/control.v"

module top ();
    
    wire mem_read, mem_to_reg, mem_write, reg_write, jump;
    wire [1:0] ALU_op;

    reg [5:0] op_code, funct;


    control_u my_ctrl_u(mem_read, mem_to_reg, mem_write, reg_write, jump, ALU_op, op_code, funct);

    initial begin
        $monitor("mem_read=%b, mem_to_reg=%b, mem_write=%b, reg_write=%b, jump=%b, ALU_op=%b", mem_read, mem_to_reg, mem_write, reg_write, jump, ALU_op);
        
        // Add
        op_code = 0;
        funct = 32;

        #1

        //Sub
        op_code = 0;
        funct = 34;
        #1

        //Load
        op_code = 35;
        funct = 'bx;
        #1

        // Store
        op_code = 43;
        #1

        // Jump
        op_code = 2;
        #1;
    end

endmodule
