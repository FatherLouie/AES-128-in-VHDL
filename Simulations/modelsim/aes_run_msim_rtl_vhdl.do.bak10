transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/Gates.vhdl}
vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/muxes.vhd}
vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/shift_rows.vhd}
vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/rot_word.vhd}
vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/cipher.vhd}
vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/aes.vhd}
vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/sbox.vhd}
vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/xtimes.vhd}
vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/add_round_key.vhd}
vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/key_expansion.vhd}
vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/mix_columns.vhd}

vcom -93 -work work {C:/Ze actual stuff/Projects/Digital- AES/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
