all: help

help:
	@cat makefile | grep ^[a-z]

status:
	@git status

pull:
	@git pull

push:
	@git push
