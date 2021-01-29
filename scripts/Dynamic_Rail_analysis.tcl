set temp 125
set_rail_analysis_config \
        -method dynamic \
        -analysis_view AV_wc_on \
        -write_movies false \
        -save_voltage_waveforms true \
        -accuracy hd \
        -temperature $temp \
        -gif_resolution 0 \
        -power_grid_libraries { \
                ../pgv_gen/techonly_pgv/techonly.cl \
                ../pgv_gen/stdcells_pgv/stdcells.cl \
                ../pgv_gen/macro_pgv/macros_pll.cl \
                }
set_rail_analysis_domain -domain_name ALL -power_nets \
        { VDD_AO VDD_external } -ground_nets VSS
set_power_pads -reset
set_power_pads -net VDD_AO \
        -format xy \
        -file ../design/super_filter_VDD_AO.pp
set_power_pads -net VDD_external \
        -format xy \
        -file ../design/super_filter_VDD_external.pp
set_power_pads -net VSS \
        -format xy \
        -file ../design/super_filter_VSS.pp
set_power_data -reset
set_dynamic_rail_simulation -reset
set_dynamic_rail_simulation -resolution 50ps
set_power_data \
        -format current \
        { \
                dynamic_power/dynamic_VDD_AO.ptiavg \
                dynamic_power/dynamic_VDD_column.ptiavg \
		dynamic_power/dynamic_VDD_ring.ptiavg \
                dynamic_power/dynamic_VDD_external.ptiavg \
                dynamic_power/dynamic_VSS.ptiavg \
        }
report_rail -output_dir ./dynamic_rail -type domain ALL

                                                                                                                                1,1           Top
