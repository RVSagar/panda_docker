SHELL := /bin/bash

base:
	docker build -t mu_panda_latest -t mu_panda_base -f DockerfileBase .

nvidia:
	docker build -t mu_panda_latest -t mu_panda_nvidia -f DockerfileNvidia --build-arg BASE_IMAGE=mu_panda_base .
