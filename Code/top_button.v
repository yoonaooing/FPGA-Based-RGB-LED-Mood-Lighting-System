module top_button(btn_in, clk, rst_n, p_out);

input btn_in, clk, rst_n;
output p_out;

wire b_w, db_w;
 
synchronizer Sync1(btn_in, clk, rst_n, b_w);

top_debounce Debounce1(b_w, clk, rst_n, db_w);

pulse_converter L2P_1(clk, rst_n, db_w, p_out);

endmodule

