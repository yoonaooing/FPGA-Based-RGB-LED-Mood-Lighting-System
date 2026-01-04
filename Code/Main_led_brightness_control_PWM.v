module Main_led_brightness_control_PWM(
    output pwm_r, pwm_g,pwm_b,
    output [6:0] seg,
    output [7:0] an,

    input main_btn_up, main_btn_down, 
    input [2:0] sw_rgb, // sw[0]=R sw[1]=G sw[2]=B

    input main_Clk50Mhz,
    input main_rst);


wire w_pb_up;
wire w_pb_down;

// BTN UP debounce
top_button BTN_UP(main_btn_up, main_Clk50Mhz, main_rst, w_pb_up);

// BTN DOWN debounce
top_button BTN_DOWN(main_btn_down, main_Clk50Mhz, main_rst, w_pb_down);

wire [2:0] sel_r, sel_g, sel_b;

top_PWM_Control pwm(pwm_r, pwm_g, pwm_b, w_pb_up, w_pb_down, main_Clk50Mhz, main_rst,
		sw_rgb[0], sw_rgb[1], sw_rgb[2], 
		sel_r, sel_g, sel_b);


top_display DISP(main_Clk50Mhz, main_rst, sel_r, sel_g, sel_b, seg, an);

endmodule
