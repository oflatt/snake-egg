.PHONY: all build test install doc clean distclean


all: test

build:
	maturin build --release

test: tests/*.py build
	python3 tests/math.py
	python3 tests/prop.py
	python3 tests/simple.py

install: build
	python3 -m pip install snake_egg \
	  --force-reinstall --no-index --find-link ./target/wheels/

doc:
	python3 -m pydoc -w snake_egg

shell:
	python3 -ic 'import snake_egg'

clean:
	maturin clean

