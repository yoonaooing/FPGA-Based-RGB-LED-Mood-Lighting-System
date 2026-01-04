module Mode_select(
    output reg [2:0] sel_r, sel_g, sel_b,
    input clk, rst_n, pb_up, pb_down,
    input sw_r, sw_g, sw_b
);

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		sel_r <= 0;
		sel_g <= 0;
		sel_b <= 0;
	end 
	else begin
		if(pb_up) begin
			if(sw_r) sel_r <= (sel_r==3'd4)? 3'd0 : sel_r+1;
			if(sw_g) sel_g <= (sel_g==3'd4)? 3'd0 : sel_g+1;
			if(sw_b) sel_b <= (sel_b==3'd4)? 3'd0 : sel_b+1;
        	end

		if(pb_down) begin
			if(sw_r) sel_r <= (sel_r==3'd0)? 3'd4 : sel_r-1;
			if(sw_g) sel_g <= (sel_g==3'd0)? 3'd4 : sel_g-1;
			if(sw_b) sel_b <= (sel_b==3'd0)? 3'd4 : sel_b-1;
		end
	end
end

endmodule
