module pwm_counter(
    output reg pwm,
    input clk, rst_n,
    input [15:0] n_rom
);

reg [15:0] count_out;
localparam total = 16'd50000;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		count_out <= 16'd0;
		pwm <= 1'b0;
	end 
	else begin
		if(count_out >= total)
 			count_out <= 16'd0;
		else
			count_out <= count_out + 16'd1;

        // duty
		if(count_out < n_rom)
			pwm <= 1'b1;
		else
			pwm <= 1'b0;
	end
end

endmodule

