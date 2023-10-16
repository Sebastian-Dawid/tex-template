# source: https://scaron.info/blog/makefiles-for-latex.html

PAPER = src/main.tex
NAME = main
SHELL = /bin/zsh

all:
	mkdir -p target
	rubber --pdf --into target $(PAPER) --jobname $(NAME)

clean:
	rubber --clean --into target $(PAPER) --jobname $(NAME)

watch:
	@while [ 1 ]; do; inotifywait $(PAPER); sleep 0.01; make all; done
