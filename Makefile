WATCHEXEC_ARCH_NAME := $(shell sh ./arch-detect.sh)
WATCHEXEC_VERSION := 2.3.2

export WATCHEXEC_ARCH_NAME
export WATCHEXEC_VERSION

run:
	docker compose -f docker-compose.yaml up --build -d

stop:
	docker compose -f docker-compose.yaml down