# source: https://scaron.info/blog/makefiles-for-latex.html

PAPER = src/main.tex
NAME = main
SHELL = /bin/zsh

all: ## compile document
	mkdir -p target
	rubber --pdf --into target $(PAPER) --jobname $(NAME)

clean: ## clean LaTeX output files
	rubber --clean --into target $(PAPER) --jobname $(NAME)

watch: ## continuously compile document
	@while [ 1 ]; do; inotifywait $(PAPER); sleep 0.01; make all; done

.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
