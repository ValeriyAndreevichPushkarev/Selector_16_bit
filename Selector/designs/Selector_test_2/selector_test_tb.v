//test of full module with converter
module tb;
reg [15:0] addr;
wire [65535:0] decoded;


Selector_16 dut (addr, decoded);

integer i;
integer j;

initial
begin

$display("test addr decoder");
addr <= 15'b001;

$display("test addr decoder");

# 10000000
if (decoded[1]!=1'b1)
			begin
				$display ("ERROR: incorrect result, %d0", j);
			end;
			
			
$display("manual smoke test:");

addr = 1;

# 10000000
if (decoded[1]!=1'b1)
			begin
				$display ("ERROR: incorrect result, %d0", j);
			end;
		if (decoded[0]!=1'b0)
			begin
				$display ("ERROR: incorrect result, %d0", j+1);
			end;
		if (decoded[2]!=1'b0)
			begin
				$display ("ERROR: incorrect result, %d0", j-1);
			end;
			

$display("10 autotests:");
for (i=0; i<10; i=i+1)
	begin
		j = $urandom%65535; 
		addr<=j;

		# 10000000

		if (decoded[j]!=1'b1)
			begin
				$display ("ERROR: incorrect result, %d0", j);
			end;
		if (decoded[j+1]!=1'b0)
			begin
				$display ("ERROR: incorrect result, %d0", j+1);
			end;
		if (decoded[j-1]!=1'b0)
			begin
				$display ("ERROR: incorrect result, %d0", j-1);
			end;
	end;
$finish;
end
endmodule

