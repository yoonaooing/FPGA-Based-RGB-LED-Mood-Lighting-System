module top_debounce(bounce_in, clk, rst_n, debounce_out);

input bounce_in, clk, rst_n;
output debounce_out;

wire cnt_w, strt_w;

sm_debounce SM_de_1(clk, rst_n, bounce_in, cnt_w, strt_w, debounce_out);
counter_20ms C20_1(strt_w, clk, rst_n, cnt_w);

endmodule
