//Write a verilog code to swap two variables without a temporary variable
module test();
		reg [3:0]A=4'd10;
		reg [3:0]B=4'd15;
		initial begin
			$display("Before swapping the numbers A:%d | B:%d",A,B);
			A=A+B;
			B=A-B;
			A=A-B;
			$display("After swapping the numbers A:%d | B:%d",A,B);
		end
endmodule
