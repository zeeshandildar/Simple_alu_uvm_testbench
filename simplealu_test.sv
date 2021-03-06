class simplealu_test extends uvm_test;
    `uvm_component_utils(simplealu_test)

    simplealu_env sa_env;
function new(string name, uvm_component parent);
    super.new(name, parent);
endfunction: new

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sa_env = simplealu_env::type_id::create(.name("sa_env"), .parent(this));
endfunction: build_phase

task run_phase(uvm_phase phase);
    simplealu_sequence sa_seq;
    phase.raise_objection(.obj(this));
        sa_seq = simplealu_sequence::type_id::create(.name("sa_seq"), .contxt(get_full_name()));
        //assert(sa_seq.randomize());
        sa_seq.start(sa_env.sa_agent.sa_seqr);
           phase.phase_done.set_drain_time(this, 200ns);

        
    phase.drop_objection(.obj(this));
endtask: run_phase
endclass: simplealu_test