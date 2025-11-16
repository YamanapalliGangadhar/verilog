module tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	HALF_ADDER uut (
		.a(a), 
		.b(b), 
		.sum(sum), 
		.carry(carry)
	);

	initial begin
		a=1'b0;
		b=1'b0;
		#10;
	end
	task data(input x,y);
		begin
		#5;
			a=x;
			b=y;
		end
	endtask
	
	initial begin
		data(0,1);
		data(1,0);
		data(1,1);
	end
      
endmodule


