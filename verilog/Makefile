BOARD=tangnano9k
FAMILY=GW1N-9C
DEVICE=GW1NR-LV9QN88PC6/I5

# Directories
SRC_DIR=src
OUT_DIR=out

# Files
TOP_MODULE=top
VERILOG=$(SRC_DIR)/$(TOP_MODULE).v
CONSTRAINTS=$(BOARD).cst

# Targets
all: $(OUT_DIR)/verilog.fs

# Synthesis
$(OUT_DIR)/verilog.json: $(VERILOG)
	mkdir -p $(OUT_DIR)
	yosys -p "read_verilog src/*.v; synth_gowin -top $(TOP_MODULE) -json $@"

# Place and Route
$(OUT_DIR)/verilog_pnr.json: $(OUT_DIR)/verilog.json
	nextpnr-himbaechel --json $< --freq 27 --write $@ --device ${DEVICE} --vopt family=${FAMILY} --vopt cst=$(CONSTRAINTS)

# Generate Bitstream
$(OUT_DIR)/verilog.fs: $(OUT_DIR)/verilog_pnr.json
	gowin_pack -d ${FAMILY} -o $@ $<

# Program Board
load: $(OUT_DIR)/verilog.fs
	openFPGALoader -b ${BOARD} $<

flash: $(OUT_DIR)/verilog.fs
	openFPGALoader -b ${BOARD} -f $<

# Cleanup build artifacts
clean:
	rm -rf $(OUT_DIR)

.PHONY: all load clean
.INTERMEDIATE: $(OUT_DIR)/verilog_pnr.json $(OUT_DIR)/verilog.json
