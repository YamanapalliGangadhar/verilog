module duty_cycle(input clk,rst,output duty_out );
		reg[3:0]count;
	always@(posedge clk)
		begin
			if(rst)
				count<=4'b0;
			else if(count==4'd9)
				count<=4'b0;
			else
				count<=count+1'b1;
		end
	assign duty_out=count[3];

endmodule



//============================Efficient Code=========================
module duty_cycle (
    input  clk,
    input  rst,
    output reg duty_out
);
    reg [3:0] count;

    always @(posedge clk) begin
        if (rst)
            count <= 4'd0;
        else if (count == 4'd9)
            count <= 4'd0;
        else
            count <= count + 1'b1;
    end

    always @(posedge clk) begin
        if (rst)
            duty_out <= 1'b0;
        else
            duty_out <= (count < 4'd2); // 20% duty
    end

endmodule


//======================================================TB=================================================================================
module tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire duty_out;

	// Instantiate the Unit Under Test (UUT)
	duty_cycle uut (
		.clk(clk), 
		.rst(rst), 
		.duty_out(duty_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always#10clk=~clk;
	
	initial begin
		@(negedge clk)
			rst=1'b1;
			@(negedge clk)
			rst=1'b0;
	end
      
endmodule


