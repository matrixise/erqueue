ERL ?= erl
ERLC ?= erlc
APP := erqueue
REBAR?= rebar

.PHONY: deps doc

all: deps compile

dev: devbuild

compile:
	@$(REBAR) compile

deps:
	@$(REBAR) get-deps

doc: dev
	$(REBAR) doc skip_deps=true


clean:
	@$(REBAR) clean
	@rm -f t/*.beam
	@rm -f doc/*.html doc/*.css doc/edoc-info doc/*.png

distclean: clean
	@$(REBAR) delete-deps
	@rm -rf deps

dialyzer: compile
	@dialyzer -Wno_return -c ebin

test: all
	@$(REBAR) eunit


# development
#
devclean:
	$(REBAR) clean

devbuild: devdeps
	$(REBAR) compile

devdeps:
	$(REBAR) get-deps
