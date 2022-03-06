all: help

help:
	@cat makefile | grep ^[a-z]

status:
	@git status --short

pull:
	@git pull

push:
	@git push
