all: install clean lint test

build:
	docker build . -t mb-streamlit-dev:latest

clean:
	isort --profile black src lib tests
	black --skip-string-normalization --line-length 120 src lib tests

install:
	python3 -m pip install --upgrade pip wheel
	python3 -m pip install -e . -r requirements_dev.txt --upgrade

lint:
	isort --profile black --check-only src lib tests
	black --check --skip-string-normalization --line-length 120 src lib tests
	flake8 src lib tests

test:
	py.test . \
	--cov-branch \
	--cov-report term-missing

list:
	@grep '^[^#[:space:]].*:' Makefile

local:
	streamlit run src/app.py
