#------------------------------------------------------
# loading design
#------------------------------------------------------
read_mmmc ../design/viewDefinition.tcl
set lefs [list]
lappend lefs ../data/lef/gsclib090_tech.lef
lappend lefs ../data/lef/gsclib090_macro.lef
lappend lefs ../data/lef/pll.lef
lappend lefs ../data/lef/decap.lef
lappend lefs ../data/lef/pso_header.lef
lappend lefs ../data/lef/pso_ring.lef
lappend lefs ../data/lef/buf_ao.lef
read_physical -lef $lefs
read_netlist ../design/postRouteOpt.design.dat/super_filter.v.gz \
						-top super_filter
read_power_intent -cpf ../design/super_filter.cpf
commit_power_intent
init_design
#-----------------------------------------------------------------------
# Read def file
#-----------------------------------------------------------------------
read_def ../design/postRouteOpt.design.dat/super_filter.def.gz
#-----------------------------------------------------------------------
# Read spef file
#-----------------------------------------------------------------------
read_spef -rc_corner RC_wc_125 ../design/postRouteOpt_RC_wc_125.spef.gz
