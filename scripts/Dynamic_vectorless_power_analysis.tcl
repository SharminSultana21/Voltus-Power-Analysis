#------------------------------------------------------------
#        Setting the power analysis mode
#------------------------------------------------------------
set_db power_method dynamic_vectorless
set_db power_disable_static true
set_db power_view AV_wc_on
set_db power_corner max
set_db power_write_db false
set_db power_write_static_currents false
set_db power_honor_negative_energy true
set_db power_ignore_control_signals true
#------------------------------------------------------------
#        Setting up the libraries
#------------------------------------------------------------
set_db power_grid_libraries \
        {../pgv_gen/techonly_pgv/techonly.cl
        ../pgv_gen/stdcells_pgv/stdcells.cl
        ../pgv_gen/macro_pgv/macros_pll.cl}
set_power_output_dir -reset
set_power_output_dir ./dynamic_power
set_default_switching_activity -reset
set_default_switching_activity -input_activity 0.3 -period 4.0 -sequential_activity 0.3 -clock_gates_output 0.5

#------------------------------------------------------------
#        dump power report
#------------------------------------------------------------
set_power -reset
report_power
