all: help

help:
	@cat makefile | grep ^[a-z]

status:
	@git status --short

fetch:
	@git fetch

pull:
	@git pull

push:
	@git push
