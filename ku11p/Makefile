THIS_DIR :=$(realpath $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

GIT_CLONE_STYLE :=ssh
#GIT_CLONE_STYLE :=https

ifeq ($(GIT_CLONE_STYLE),ssh)
  GITHUB    :=git@github.com:
  BITBUCKET :=git@bitbucket.com:
else ifeq ($(GIT_CLONE_STYLE),https)
  GITHUB    :=https://github.com/
  BITBUCKET :=https://bitbucket.com/
endif

blackparrot_dir := $(THIS_DIR)/black-parrot
blackparrot_url := $(GITHUB)black-parrot/black-parrot
blackparrot_commit := 1008321

basejump_stl_dir := $(THIS_DIR)/basejump_stl
basejump_stl_url := $(GITHUB)bespoke-silicon-group/basejump_stl
basejump_stl_commit := 97552f9

tapeout_dir := $(THIS_DIR)/bsg_tapeout_v1_tsmc40
tapeout_url := $(GITHUB)gaozihou/bsg_tapeout_v1_tsmc40
tapeout_commit := 7c80a1c


vivado_bin := $(XILINX_VIVADO)/bin/vivado

project_dir := $(THIS_DIR)/ku11p_test
project_xpr_dir := $(project_dir)/ku11p_test.xpr
build_tcl_dir := $(THIS_DIR)/bp_fpga.tcl

script_dir := $(THIS_DIR)/script
generate_tcl := $(script_dir)/generate_bitstream.tcl
program_tcl_dir := $(script_dir)/program_fpga.tcl
update_tcl_dir := $(script_dir)/update_tcl.tcl



all: libs

libs: $(blackparrot_dir) $(basejump_stl_dir) $(tapeout_dir)

$(blackparrot_dir):
	git clone $(blackparrot_url) $(blackparrot_dir)
	cd $(blackparrot_dir); git checkout $(blackparrot_commit)

$(basejump_stl_dir):
	git clone $(basejump_stl_url) $(basejump_stl_dir)
	cd $(basejump_stl_dir); git checkout $(basejump_stl_commit)
    
$(tapeout_dir):
	git clone $(tapeout_url) $(tapeout_dir)
	cd $(tapeout_dir); git checkout $(tapeout_commit)

build: $(project_dir)

$(project_dir): libs $(build_tcl_dir)
	cd $(blackparrot_dir); make libs; make ucode
	$(vivado_bin) -mode batch -source $(build_tcl_dir)

open:
	$(vivado_bin) $(project_xpr_dir) &

generate_bitstream:
	$(vivado_bin) -mode batch -source $(generate_tcl)

program_fpga:
	sudo $(vivado_bin) -mode batch -source $(program_tcl_dir)

update_tcl:
	$(vivado_bin) -mode batch -source $(update_tcl_dir)

clean_libs: are_you_sure
	rm -rf $(blackparrot_dir) $(basejump_stl_dir) $(tapeout_dir)

clean_build: are_you_sure
	rm -rf $(project_dir)

DISABLE_SAFETY_PROMPT ?= false
are_you_sure:
	@$(DISABLE_SAFETY_PROMPT) || (echo -n "Are you sure [Y/n]? " && read ans && ([ "$$ans" == "Y" ] || [ "$$ans" == "y" ]))
