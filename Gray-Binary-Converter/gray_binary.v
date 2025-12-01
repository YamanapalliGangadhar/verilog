//====================================RTL=====================================//
`timescale 1ns / 1ps

module gray_binary(input [3:0]gray,output reg [3:0]binary);
	integer i;
		always@(*)
			begin
			binary[3]=gray[3];
				for(i=2;i>=0;i=i-1)
					begin
						binary[i]=gray[i]^binary[i+1];
					end
			end
		

endmodule
//============================ Test Bench ======================================//
`timescale 1ns / 1ps


module tb;
	// Inputs
	reg [3:0] gray;
	// Outputs
	wire [3:0] binary;
	// Instantiate the Unit Under Test (UUT)
	gray_binary uut (
		.gray(gray), 
		.binary(binary)
	);
	initial begin
		// Initialize Inputs
		gray = 4'b0000;
		
	end
	task data(input [3:0]a);
		begin
			gray=a;
			#20;
		end
	endtask
	
	initial begin
		data(4'b1111);
		data(4'b1110);
		data(4'b1000);
		data(4'b1100);
		data(4'b0100);
		$monitor("time: %t | GRAY: %b | OUTPUT BINARY: %b ",$time,gray,binary);
		#1000 $finish;
	end
      
endmodule

