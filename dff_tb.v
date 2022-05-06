module BCD7_tb;
reg clk;
reg rst_syn;
reg D;
reg Din;
reg bcd;
reg Load;
wire [7:0]seg;
parameter PERIOD = 20;
parameter real DUTY_CYCLE = 0.5;
parameter OFFSET = 0;
// clock process
initial begin
    #OFFSET;
    forever begin
        clk = 1'b0;
        #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
        #(PERIOD*DUTY_CYCLE);
    end
end

initial begin
    Din=1'b1;
    D=1'b0;
    bcd=0;
end
initial begin
    Load=1'b1;
    #20 Load=1'b0;
    #20 Load=1'b1;
    #500 $finish;
end
initial begin
    $dumpfile("BCD7.vcd");
    $dumpvars(0, BCD7_tb);
end
BCD dff_1(
    .rst_syn(Q4),
    .clk(clk)
);
segment BCD(
    .bcd(Q_out)
);
dff_1 BCD7_tb(
    .clk(clk),
    .Load(Load),
    .Din(Din),
    .D(D)
);
endmodule