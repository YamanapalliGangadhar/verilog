//=================================================================================RTL=====================================================================================//
// BCD code  ,that has to count from 00-99 
module BCD(input clk,rst,output reg[3:0] count0,count1);
	always@(posedge clk)
		begin
			if(rst)
				count0<=4'b0;
			else
				begin
					if(count0==4'd9)
						count0<=4'b0;
				
					else
						count0<=count0+1'b1;
				end
			end
		
		always@(posedge clk)
			begin 
				if(rst)
					count1<=4'b0;
				else
					begin
						if(count0==4'd9 && count1<4'd9)
							count1<=count1+1'b1;
						else if(count0==4'd9 && count1==4'd9)
								count1<=4'b0;
						else
								count1<=count1;
					end
			end
endmodule

//===========================================================Test Bench =================================================================//
module tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] count0;
	wire [3:0] count1;

	// Instantiate the Unit Under Test (UUT)
	BCD uut (
		.clk(clk), 
		.rst(rst), 
		.count0(count0), 
		.count1(count1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
		always#10 clk=~clk;
		
		task reset;
			begin
				@(negedge clk)
					rst=1'b1;
				@(negedge clk)
					rst=1'b0;
			end
		endtask
		initial begin
			reset;
		$monitor("reset:%d |count:%d %d  ",rst,count1,count0);
		end
		
	
      
endmodule

