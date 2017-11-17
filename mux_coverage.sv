class mux_coverage extends uvm_subscriber#(mux_tx);
	`uvm_component_utils(mux_coverage)

	
	mux_tx trans;
	real cov;

	function void build_phase(uvm_phase phase);
	endfunction

	covergroup mux_cov;
		option.per_instance = 1;
		option.name = "covergae for MUX";
		sel_cp:coverpoint trans.select{
			bins select0 = {0};
			bins select1 = {1};
		}

		a_cp:coverpoint trans.a{
			bins a0 = {0};
			bins a1 = {1};
		}

		b_cp:coverpoint trans.b{
			bins b0 = {0};
			bins b1 = {1};
		}

		sel_X_a:cross sel_cp, a_cp{
			bins valid = binsof(sel_cp.select1) && (binsof(a_cp.a0) || binsof(a_cp.a1));
			ignore_bins invaild = binsof(sel_cp.select0) && (binsof(a_cp.a0) || binsof(a_cp.a1));
		}

		sel_X_b:cross sel_cp, b_cp{
			bins valid = binsof(sel_cp.select0) && (binsof(b_cp.b0) || binsof(b_cp.b1));
			ignore_bins invaild = binsof(sel_cp.select1) && (binsof(b_cp.b0) || binsof(b_cp.b1));
		}
	endgroup


		function new(string name="",uvm_component parent);
			super.new(name,parent);
			mux_cov = new();
		endfunction
		

		function void write(mux_tx t);
			trans = t;	
			mux_cov.sample();
		endfunction

		function void extract_phase(uvm_phase phase);
                		cov = mux_cov.get_coverage();
		endfunction
	
		function void report_phase(uvm_phase phase);
        	        `uvm_info(get_type_name(), $sformatf("Coverage is: %f", cov), UVM_MEDIUM)
		endfunction

	

endclass
