module seg7_ascii(
    input  [7:0] ch,
    output reg [6:0] seg
);


always @(*) begin
    case(ch)

        // ASCII number '0'~'9'
        "0": seg = 7'b0000001;
        "1": seg = 7'b1001111;
        "2": seg = 7'b0010010;
        "3": seg = 7'b0000110;
        "4": seg = 7'b1001100;
        "5": seg = 7'b0100100;
        "6": seg = 7'b0100000;
        "7": seg = 7'b0001111;
        "8": seg = 7'b0000000;
        "9": seg = 7'b0000100;

        "R": seg = 7'b1111010;   
        "G": seg = 7'b0100001;   
        "B": seg = 7'b1100000;   
        " ": seg = 7'b1111111;  

        default: seg = 7'b1111111; 
    endcase
end

endmodule
