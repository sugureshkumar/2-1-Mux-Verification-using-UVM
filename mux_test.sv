class mux_test extends uvm_test;
		`uvm_component_utils(mux_test)
	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	mux_env env;

	function void build_phase(uvm_phase phase);
		env = mux_env::type_id::create("env",this);
	endfunction

	function void end_of_elobartion_phase(uvm_phase phase);
		factory.print();
	endfunction

	task run_phase(uvm_phase phase);
		mux_seq10 seq10;
		phase.raise_objection(this);
		seq10= mux_seq10::type_id::create("seq10",this);
		seq10.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask

endclass

class mux_testa extends uvm_test;
		`uvm_component_utils(mux_testa)
	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	mux_env env;

	function void build_phase(uvm_phase phase);
		env = mux_env::type_id::create("env",this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);

		uvm_top.print_topology();
	endfunction

	task run_phase(uvm_phase phase);
		mux_seqa seqa;
		phase.raise_objection(this);
		seqa= mux_seqa::type_id::create("seqa",this);
		seqa.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask

endclass
