module top_display(
    input clk, input rst,
    input [2:0] sel_r, sel_g, sel_b,
    output [6:0] seg, output reg [7:0] an
);

reg [16:0] count;
reg scan_clk;

always @(posedge clk or negedge rst) begin
	if(!rst) begin count<=0; scan_clk<=0; end
	else if(count>=17'd49999) begin count<=0; scan_clk<=~scan_clk; end
	else count<=count+1;
end

reg [2:0] scan;

always @(posedge scan_clk or negedge rst)
	if(!rst) scan<=0; 
	else scan<=scan+1;

reg [7:0] ch;

always @(*) begin
    case(scan)
	0: begin an=8'b0111_1111; ch="R"; end
	1: begin an=8'b1011_1111; ch=8'h30 + sel_r; end
	2: begin an=8'b1101_1111; ch=8'h20; end // space
	3: begin an=8'b1110_1111; ch="G"; end
	4: begin an=8'b1111_0111; ch=8'h30 + sel_g; end
	5: begin an=8'b1111_1011; ch=8'h20; end
	6: begin an=8'b1111_1101; ch="B"; end
	7: begin an=8'b1111_1110; ch=8'h30 + sel_b; end
	default: begin an=8'b1111_1111; ch=8'h20; end
    endcase
end

seg7_ascii S1(ch,seg);

endmodule
