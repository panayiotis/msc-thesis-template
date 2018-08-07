.PHONY: all \
	clean \
	watch \
	help

all:
	true \
	&& latexmk

clean:
	latexmk -C

watch:
	latexmk -pvc

help:
	@echo 'Commands:'
	@echo '  help      Print this help message'
	@echo '  all       Create the final pdf using latexmk & xelatex'
	@echo '  clean     Clean the built artifact'
