onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sqrt_tb/clk
add wave -noupdate /sqrt_tb/rst_n
add wave -noupdate /sqrt_tb/input
add wave -noupdate /sqrt_tb/ready
add wave -noupdate /sqrt_tb/DUV/data_path/data_diff
add wave -noupdate -radix decimal -childformat {{/sqrt_tb/root(7) -radix decimal} {/sqrt_tb/root(6) -radix decimal} {/sqrt_tb/root(5) -radix decimal} {/sqrt_tb/root(4) -radix decimal} {/sqrt_tb/root(3) -radix decimal} {/sqrt_tb/root(2) -radix decimal} {/sqrt_tb/root(1) -radix decimal} {/sqrt_tb/root(0) -radix decimal}} -subitemconfig {/sqrt_tb/root(7) {-height 15 -radix decimal} /sqrt_tb/root(6) {-height 15 -radix decimal} /sqrt_tb/root(5) {-height 15 -radix decimal} /sqrt_tb/root(4) {-height 15 -radix decimal} /sqrt_tb/root(3) {-height 15 -radix decimal} /sqrt_tb/root(2) {-height 15 -radix decimal} /sqrt_tb/root(1) {-height 15 -radix decimal} /sqrt_tb/root(0) {-height 15 -radix decimal}} /sqrt_tb/root
add wave -noupdate -radix decimal /sqrt_tb/DUV/data_path/drt_register/q
add wave -noupdate -radix decimal /sqrt_tb/DUV/data_path/root_register/q
add wave -noupdate /sqrt_tb/DUV/data_path/input_register/q
add wave -noupdate -radix decimal /sqrt_tb/DUV/data_path/square_adder/result
add wave -noupdate -radix decimal /sqrt_tb/DUV/data_path/square_reg_q
add wave -noupdate -radix decimal /sqrt_tb/DUV/data_path/shifted_drt
add wave -noupdate /sqrt_tb/DUV/data_path/comparator/A
add wave -noupdate /sqrt_tb/DUV/data_path/comparator/B
add wave -noupdate /sqrt_tb/DUV/data_path/comparator/AltB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {72 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 334
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {38 ns} {116 ns}
