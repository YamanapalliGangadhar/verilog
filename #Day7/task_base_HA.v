	module Half_Adder (input a,b, output reg sum,carry);
		
			task H_sum ;
				input x,y;
				output s,c;
				begin
				s=x^y;
				c=x&y;
				end
			endtask
			
			always@(*)
			begin
			H_sum(a,b,sum,carry);
			end
	
	endmodule
			

