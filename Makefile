SHELL=bash

TEST_DIR=test
TESTS=drop-tabs

all: check

PASS=\e[1;1m\e[1;32mPASS\e[1;0m
FAIL=\e[1;1m\e[1;31mFAIL\e[1;0m
check/%: $(TEST_DIR)/%
	@cd $^; ../../lisp-format -style=file example.lisp > output.lisp; \
	if ./check >/dev/null 2>/dev/null;then \
	printf "$(PASS)\t\e[1;1m%s\e[1;0m\n" $*; exit 0; \
	else \
	printf "$(FAIL)\t\e[1;1m%s\e[1;0m\n" $*; exit 1; \
	fi

check: $(addprefix check/, $(TESTS))

show/%: $(TEST_DIR)/%
	-@diff -U4 --color=always $^/{example,output}.lisp|sed '4,$$ { s/\t/ [TAB]  /g}'

clean:
	rm -f test/*/output.lisp
