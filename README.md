Presentation based on my repos (https://github.com/ValeryAndreevichPushkarev)

### Structure


designs - directory with OpenLane projects (copy content to OpenLane/designs)

	Run synthesis:
	(
		./flow.tcl -design Selector_test
		./flow.tcl -design Selector_test -synth_explore 
	)
	Run testbenches:

	iverilog *.v
	vvp a.out - only for windows

	there are 1 project:
	1) Selector test - test of characteristics of selector based on positional encoding


results - synthesis results for all types of projects

	With synthesis log, metrics and -synth_explore.
### Short analysis of the result

		1)ABC: netlist                       : i/o =   13/ 4096  lat =    0  nd = 10047  edge =  22454  area =78924.27  delay = 6.00  lev = 6
		Delay =  1533.06 ps 
		2)ABC: netlist                       : i/o =   16/65536  lat =    0  nd =110645  edge = 216174  area =672794.38  delay =13.00  lev = 13
		Delay =  2776.08 ps
		3)ABC: netlist                       : i/o =   14/16384  lat =    0  nd = 26076  edge =  49823  area =158531.00  delay =10.00  lev = 10
		Delay =  1767.02 ps

Analysis of results:
1) 12-bit selector. After synthesis explore, we have 5k gates for 4098 lanes, or about **1 transistor gate per lane(!)**.

High-speed version have **10047 gates for 4098 lanes**.

Delay for **12 bit selector is 1234.39 ps, that is comparable with 16 bit adder(!)**.

2) 16 bit selector. **110645 gates 65536 lanes, 2 gates per lane**. Delay is twise bigger than 16 bit carry-lookahead adder has.

3) 14 bit selector. **28230 gates 16384 lanes, less tnat 2 gates per line**. Because I cant run -synth_explore with 16 bit selector.

According to (https://www.eng.auburn.edu/~uguin/teaching/E4200_Spring_2021/lecture-slides/Lecture-6-Memory-Models , slide 15) modern DDR4 modules have DDR banks that works only on 100-255 Mhz.

Anyway, on 7nm and less delay is about 40 ps. And modern SSD dont have 20 Gbps at random read.
    

### Testbenches:
	Smoke test (select first lane)
  	User test (select N lane)
	10 self-check tests with random numbers (and check lines nearby)
