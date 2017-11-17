class mux_seq extends uvm_sequence#(mux_tx);
	`uvm_object_utils(mux_seq)

	mux_tx txn;
	function new(string name="");
		super.new(name);
	endfunction

	virtual task body();
	
	endtask
endclass

class mux_seq_a extends mux_seq;
	`uvm_object_utils(mux_seq_a)
	function new(string name="");
		super.new(name);
	endfunction

	task body();
		start_item(txn);
			assert(txn.randomize());
		finish_item(txn);
	endtask
endclass

class mux_seq10 extends mux_seq;
	`uvm_object_utils(mux_seq10)
		mux_tx txn;
	function new(string name="");
		super.new(name);
		txn = new();
	endfunction



	task body();
		start_item(txn);
		repeat(10) begin
			
			assert(txn.randomize());
		end
		finish_item(txn);
	endtask
endclass


class mux_seqa extends mux_seq;
	`uvm_object_utils(mux_seqa)
		mux_tx txn;
	function new(string name="");
		super.new(name);
		txn = new();
	endfunction



	task body();
		start_item(txn);
		repeat(10) begin	
			assert(txn.randomize() with {a==1;});
		end
		finish_item(txn);
	endtask
endclass
