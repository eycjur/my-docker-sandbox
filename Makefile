# Makefile
.PHONY: build up down exec

build:
	docker compose build

up:
	docker compose up -d

down:
	docker compose down

exec:
	docker compose exec -it sandbox zsh

