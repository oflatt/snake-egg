.PHONY: all build test install doc clean distclean


all: test

build:
	maturin build --release

install: build
	python3 -m pip install snake_egg \
	  --force-reinstall --no-index --find-link ./target/wheels/

test: tests/*.py install
	python3 tests/math.py
	python3 tests/prop.py
	python3 tests/simple.py

doc:
	python3 -m pydoc -w snake_egg

shell: install
	python3 -ic 'import snake_egg'

clean:
	maturin clean

