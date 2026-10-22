quit -sim
vlib work
vmap work work
vcom -2008 ../rtl/counter8.vhd
vcom -2008 ../tb/tb_counter8.vhd
vsim -voptargs=+acc work.tb_counter8

# 1. Ouvre la fenêtre du chronogramme (Wave)
view wave

# 2. Ajoute TOUS les signaux de votre banc de test (tb_counter8) au chronogramme
add wave -position insertpoint sim:/tb_counter8/*

# 3. Lance la simulation pendant toute la durée

run -all