`timescale 1ns / 1ps

module fifo(	input clk,
					input rst,
					input we,
					input re,
					input [7:0]data_in,
					output reg [7:0]data_out,
					output empty,
					output full);
					
					integer i;
					
					reg [4:0]wp;
					reg [4:0]rp;
					reg [7:0]mem[15:0];
					
					always@(posedge clk)
						begin
							if(!rst)
								begin
									wp<=5'b0;
									for(i=0;i<16;i=i+1)
										begin
											mem[i]<=8'b0;
										end
								end
							else if(we==1 && full==0)
								begin
									mem[wp[4:0]]<=data_in;
									wp<=wp+1'b1;
								end
							else
									mem[wp[4:0]]<=mem[wp[4:0]];
						end
						
					always@(posedge clk)
						begin
							if(!rst)
								begin
									rp<=5'b0;
									data_out<=8'b0;
								end
							else if(re==1 && empty==0)
								begin
									data_out<=mem[rp[4:0]];
									rp<=rp+1'b1;
								end
							else
								data_out<=data_out;
						end
						
					assign full = ((wp[4]!=rp[4]) && (wp[3:0]==rp[3:0]))?1'b1:1'b0;
					assign empty=	(wp==rp)?1'b1 : 1'b0;


endmodule

