# Sets the compiler
set compiler vcom

# Creates the work library if it does not exist
if { ![file exist work] } {
	vlib work
}

# Source files listed in hierarchical order: bottom -> top

set sourceFiles {
	
	FFD_rst.vhd
	FFD_set.vhd
	Add1Rip.vhd
	Adder.vhd
	comp.vhd
	left_log_shift.vhd
	or_1bit.vhd
	reg_drt.vhd
	reg_input.vhd
	reg_root.vhd
	reg_square.vhd
	sqrt_ctrlpath.vhd
	sqrt_datapath.vhd
	sqrt_top.vhd
	
	sqrt_TB.vhd
	}

set top sqrt_TB.vhd

if { [llength $sourceFiles] > 0 } {
	
	foreach file $sourceFiles {
		if [ catch {$compiler $file} ] {
			puts "\n*** ERROR compiling file $file :( ***" 
			return;
		}
	}
}

if { [llength $sourceFiles] > 0 } {
	
	puts "\n*** Compiled files:"  
	
	foreach file $sourceFiles {
		puts \t$file
	}
}

puts "\n*** Compilation OK ;) ***"

set StdArithNoWarnings 1