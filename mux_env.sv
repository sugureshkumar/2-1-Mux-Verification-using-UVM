class mux_env extends uvm_env;
	`uvm_component_utils(mux_env)

	mux_agent agent;
	mux_coverage cov;
	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		agent = mux_agent::type_id::create("agent",this);
		cov = mux_coverage::type_id::create("cov",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		agent.mon.ap_mon.connect(cov.analysis_export);
	endfunction
endclass
