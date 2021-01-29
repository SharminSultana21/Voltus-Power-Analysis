#------------------------------------------------------------
#        Setting the power analysis mode
#------------------------------------------------------------
set start_val 672
set end_val 680
set_db power_method dynamic_vectorbased
set_db power_disable_static true
set_db power_view AV_wc_on
set_db power_write_static_currents false
set_db power_write_db false
set_power_output_dir dynamic_vectorbased_power
set_dynamic_power_simulation -reset
set_dynamic_power_simulation -resolution 50ps
set_db power_report_missing_nets true
read_activity_file -reset
read_activity_file \
        -format VCD \
        -scope FIR_TB.Unit \
        -start $start_val \
        -end $end_val \
        -block {} \
        ../design/ncsim.vcdi
set_dynamic_power_simulation -reset
#------------------------------------------------------------
#        dump power report
#------------------------------------------------------------
report_power -out_file super_filter.rpt
        view_dynamic_waveform \
        -type current \
        -composite_waveform_type total_current \
        -waveform_files {./dynamic_vectorbased_power/dynamic_VDD_AO.ptiavg}
                                                                            
