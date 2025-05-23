module reg_file (read_data_1, read_data_2, clk, read_reg_1, read_reg_2, write_en, write_reg, write_data);
    output reg [31:0] read_data_1, read_data_2;
    input wire clk, write_en;
    input wire [4:0] read_reg_1, read_reg_2, write_reg;
    input wire [31:0] write_data;

    reg [31:0]registers[0:31];

    initial begin
        registers[15] = 32'h01011066;
    end

    always @(posedge clk) begin
        if (write_en) begin
            registers[write_reg] <= write_data;
        end
    end

    always @(*) begin
        read_data_1 <= registers[read_reg_1];
        read_data_2 <= registers[read_reg_2];
    end

    integer i;
    initial begin
        for (i = 0; i < 32; i=i+1) begin
            registers[i] = 0;
        end
    end

endmodule