TOP_DIR=.
VERSION=$(strip $(shell cat version))

init: install
	@echo "Initializing the repo..."

install:
	@echo "Install software required for this repo..."
	@brew install elixir

dep:
	@echo "Install dependencies required for this repo..."
	@mix deps.get

build:
	@echo "Building the software..."
	@mix format; mix compile

run:
	@echo "Running the software..."
	@iex -S mix

test:
	@echo "Running test suites..."
	@mix test

travis-init: extract-deps
	@echo "Initialize software required for travis (normally ubuntu software)"

travis: dep test

travis-deploy: release
	@echo "Deploy the software by travis"

include .makefiles/*.mk

.PHONY: test
