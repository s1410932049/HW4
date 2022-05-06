

module BCD(clk, rst_syn, Q_out);
    input clk; 
    input rst_syn; 
    output [3:0] Q_out; 
    reg [3:0] Q_out; 

    always@ (posedge clk)
    begin
    if (!rst_syn)
    Q_out = 0;
    else if (Q_out == 9)
        Q_out = 0;
    else
        Q_out = Q_out + 1;
    end
endmodule
//segment
module segment (bcd, seg);
        input bcd;
        output [7:0] seg;
        reg [7:0]seg;
        always @(bcd) begin
            case (bcd)
                1:seg=8'b11000000;
                2:seg=8'b11111001;
                3:seg=8'b10100100;
                4:seg=8'b10100000;
                5:seg=8'b10011001;
                6:seg=8'b10010010;
                7:seg=8'b10000010;
                8:seg=8'b11111000;
                9:seg=8'b10000000;
                10:seg=8'b10010000;
                11:seg=8'b10100000;
                12:seg=8'b10000011;
                13:seg=8'b10100001;
                14:seg=8'b10000100;
                15:seg=8'b11110001;
                default:seg=8'b00000000;
            endcase
        end
endmodule
// 1-bit Synchronous Load
module dff_1 (clk, D, Din, Load, Q4);
input clk, D, Din, Load;
output Q4;
reg Q4;
always@ (posedge clk) 
begin
    if (Load) Q4 = Din;
    else Q4 = D;
end

endmodule