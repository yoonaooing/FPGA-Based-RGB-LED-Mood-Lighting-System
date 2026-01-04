module top_PWM_Control(
    output pwm_r, pwm_g, pwm_b,
    input pb_up, pb_down,

    input tp_clk, tp_rst,

    input sw_r, sw_g, sw_b,

    output [2:0] sel_r, sel_g, sel_b);


Mode_select m_sc1(sel_r, sel_g, sel_b, tp_clk, tp_rst, pb_up, pb_down, sw_r, sw_g, sw_b);

wire [15:0] n_r, n_g, n_b;

rom_n m_rom_r(n_r, sel_r);
rom_n m_rom_g(n_g, sel_g);
rom_n m_rom_b(n_b, sel_b);

pwm_counter m_pc_r(pwm_r, tp_clk, tp_rst, n_r);
pwm_counter m_pc_g(pwm_g, tp_clk, tp_rst, n_g);
pwm_counter m_pc_b(pwm_b, tp_clk, tp_rst, n_b);


endmodule


