`timescale 1ns / 1ps

module fifo_tb;

	// Inputs
	reg clk;
	reg rst;
	reg we;
	reg re;
	reg [7:0] data_in;

	// Outputs
	wire [7:0] data_out;
	wire empty;
	wire full;

	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.clk(clk), 
		.rst(rst), 
		.we(we), 
		.re(re), 
		.data_in(data_in), 
		.data_out(data_out), 
		.empty(empty), 
		.full(full)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		we = 1;
		re = 0;
		data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #10 clk=~clk;
	
		task reset;
			begin
				@(negedge clk)
					rst=1'b0;
				@(negedge clk)
					rst=1'b1;
			end
		endtask
		
		task data(input [7:0]a);
			begin
				@(negedge clk)
					data_in=a;
			end
		endtask
		
		initial begin
			reset;
			data(8'd50);
			data(8'd30);
			data(8'd50);
			data(8'd32);
			data(8'd61);
			data(8'd11);
			data(8'd65);
			data(8'd24);
			data(8'd52);
			data(8'd76);
			data(8'd31);
			data(8'd18);
			data(8'd50);
			data(8'd30);
			data(8'd50);
			data(8'd32);
			re=1;
			data(8'd61);
			data(8'd11);
			data(8'd65);
			data(8'd24);
			data(8'd52);
			data(8'd76);
			data(8'd31);
			data(8'd18);
			$monitor("time:%t |reset:%b | Data:%d | Data_Out:%d ", $time,rst,data_in,data_out);
			#100 $finish;
		end
      
endmodule


