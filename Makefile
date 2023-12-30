PYTHON ?= python3

.PHONY: help setup remove test format sdist bdist upload clean clean-all

help:
	@echo "setup     local pip install of package"
	@echo "remove    uninstall pip install"
	@echo "test      run pytest suite"
	@echo "format    format source code"
	@echo "sdist     build source dist"
	@echo "bdist     build binary dist"
	@echo "upload    dist to pypi"
	@echo "clean     clean"
	@echo "clean-all remove all"

setup:
	pip install -e .

remove:
	pip uninstall machine68k

test:
	pytest test

format:
	black .

sdist:
	$(PYTHON) -m build -s

bdist:
	$(PYTHON) -m build -w

upload: sdist
	twine upload dist/*

clean:
	$(PYTHON) setup.py clean

clean-all:
	rm -rf build/ dist/