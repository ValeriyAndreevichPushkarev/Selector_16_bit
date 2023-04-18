//test of full module with converter
module tb;
reg [11:0] addr;
wire [4095:0] decoded;

integer i;
integer j;

Selector_test dut (addr,1'b1, decoded);

initial
begin
$display("manual smoke test:");

addr = 1'b1;

# 10000000


if (decoded[1]!=1'b1)
			begin
				$display ("ERROR: incorrect result");
			end
			

$display("test carry:");

addr = 12;

# 10000000

if (decoded[12]!=1'b1)
	begin
		$display ("ERROR: incorrect result");
	end
if (decoded[13]!=1'b0)
	begin
		$display ("ERROR: incorrect result");
	end;
if (decoded[11]!=1'b0)
	begin
		$display ("ERROR: incorrect result");
	end;

$display("10 autotests:");
for (i=0; i<10; i=i+1)
	begin
		j = $urandom%4095; 
		addr<=j;

		# 10000000

		if (decoded[j]!=1'b1)
			begin
				$display ("ERROR: incorrect result");
			end;
		if (decoded[j+1]!=1'b0)
			begin
				$display ("ERROR: incorrect result");
			end;
		if (decoded[j-1]!=1'b0)
			begin
				$display ("ERROR: incorrect result");
			end;
	end;
$finish;
end
endmodule

