onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /testbench/i_green/clk
add wave -noupdate -radix unsigned /testbench/i_green/rst
add wave -noupdate -radix unsigned /testbench/i_green/en
add wave -noupdate -radix unsigned /testbench/i_green/h_sync
add wave -noupdate -radix unsigned /testbench/i_green/v_sync
add wave -noupdate -radix unsigned /testbench/i_green/red
add wave -noupdate -radix unsigned /testbench/i_green/blue
add wave -noupdate -radix unsigned /testbench/i_green/green
add wave -noupdate -radix unsigned /testbench/i_green/h_count
add wave -noupdate -radix unsigned /testbench/i_green/v_count
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/clk
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/enable
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/reset
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/vsync
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/hsync
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/r
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/g
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/b
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/vsync_positive_front_detector
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/vsync_delay
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/cnt_h
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/cnt_v
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/h_visible_area
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/v_visible_area
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/visible_area
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/fout_pointer
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/last_pixel
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/last_line
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/frame_process
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/expected_hsync
add wave -noupdate -radix unsigned /testbench/i_vga_monitor/expected_vsync
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {163 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 191
configure wave -valuecolwidth 72
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ns} {1168 ns}
