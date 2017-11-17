class mux_agent extends uvm_agent;
		`uvm_component_utils(mux_agent)
	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction
	mux_driver driver;
	mux_sequencer sqr;
	mux_monitor mon;

	function void build_phase(uvm_phase phase);
		driver = mux_driver::type_id::create("driver",this);
		sqr = mux_sequencer::type_id::create("sqr",this);
		mon = mux_monitor::type_id::create("mon",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		driver.seq_item_port.connect(sqr.seq_item_export);
	endfunction	
endclass
