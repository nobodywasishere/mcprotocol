.PHONY: generate
generate:
	GC_DONT_GC=1 crystal run src/generator.cr -p -s --error-trace
	crystal tool format src/mcprotocol/*
