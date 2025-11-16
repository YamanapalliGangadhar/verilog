module HALF_ADDER( input a,b,output sum ,carry );
		function h_sum;
			input x,y; 
						h_sum=x^y;
			endfunction 
			
			function h_carry;
				input x,y;
					h_carry=x&y; 
			endfunction
			
			assign sum =h_sum(a,b);
			assign carry=h_carry(a,b);
			
	endmodule
	
			

