# Selector_12bit
Contains sythesis results for selector(12 bit)
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

    After synthesis explore, we have 5k gates for 4098 lanes, or about 1 transistor gate per lane(!).
    
    High-speed version have 10047 gates for 4098 lanes.
    
    Delay for 12 bit selector is 1234.39 ps, that is comparable with 16 bit adder(!).
    

### Testbenches:
	Smoke test (select first lane)
  User test (select N lane)
	10 self-check tests with random numbers
