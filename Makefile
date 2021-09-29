# Return date 15 days in the future
DATE := $(shell date -j -v +15d '+%Y-%m-%d')
TITLE ?= new-post

VERBOSE ?= 0
ifeq ($(VERBOSE),1)
Q :=
export VERBOSE = 1
else
Q := @
export VERBOSE = 0
endif

.PHONY: serve
serve:
# Open Google Chrome on macOS
	$(Q)open -a "Google Chrome" http://localhost:1313/
	$(Q)hugo server -FD

.PHONY: kill
kill:
	ps -ax | grep "hugo server -FD"

.PHONY: new
new:
	$(Q)hugo new --kind post  post/$(TITLE)
	$(Q)cp -a content/post/$(TITLE) content/post/$(DATE)-$(TITLE)
	$(Q)rm -r content/post/$(TITLE)

.PHONY: build
build:
	$(Q)hugo --minify

# Removes all generated build output
.PHONY: clean
clean:
	$(Q)rm -rf public/ resources/
	$(Q)hugo mod clean

#.PHONY: help
#help:
