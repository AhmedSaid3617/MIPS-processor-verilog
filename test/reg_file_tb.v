module top;
    
    reg clk, write_en;
    reg [4:0] read_reg_1, read_reg_2, write_reg;
    reg [31:0] write_data;
    wire [31:0] read_data_1, read_data_2;

    reg_file my_reg_file(read_data_1, read_data_2, clk, read_reg_1, read_reg_2, write_en, write_reg, write_data);
    
    initial begin
        $monitor("Time:%d\tread_data1:%x\tread_data2:%x", $time, read_data_1, read_data_2);
        write_en = 1;
        write_data = 32'h1234ABCD;
        write_reg = 10;
        read_reg_2 = 15;
        #3
        read_reg_1 = 10;
        //read_reg_2 = 15;
    end

    integer i;
    initial begin
        clk <= 0;
        for (i = 0; i<20; i = i + 1) begin
            #1
            clk <= ~ clk;
        end
    end
    
endmodule
