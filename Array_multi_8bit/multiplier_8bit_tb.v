module multi_8_tb();
    reg [7:0]a;
    reg [7:0]b;
    wire [15:0]o;

multi_8 dut(a,b,o);
initial begin
    $dumpfile("multi.vcd");
    $dumpvars(0 ,multi_8_tb);
    a = 100; b = 100; #10; 
    $display("Input : a=%d , b=%d -> o=%d" , a,b,o);
    a = 3; b = 5; #10;
    $display("Input : a=%d , b=%d -> o=%d" , a,b,o); 
    a = 9; b = 9; #10; 
    $display("Input : a=%d , b=%d -> o=%d" , a,b,o);
    a = 17; b = 17; #10;
    $display("Input : a=%d , b=%d -> o=%d" , a,b,o); 
    a = 20; b = 50; #10; 
    $display("Input : a=%d , b=%d -> o=%d" , a,b,o);
    a = 12; b = 20; #10;
    $display("Input : a=%d , b=%d -> o=%d" , a,b,o); 
    a = 1; b = 255; #10; 
    $display("Input : a=%d , b=%d -> o=%d" , a,b,o);
    $display("Test done");
    #10 $finish;
end    
endmodule
