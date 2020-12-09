# Makefile

ISTIO_VERSION=1.6.12

.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


install:  ## Install istio on k8s
	cd /tmp && \
	curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} sh - && \
	cd istio-${ISTIO_VERSION} && \
	sudo cp bin/istioctl /usr/local/bin && \
	istioctl install --set profile=demo

post-install:  ## Extra installation steps (nodeport exposure)
	kubectl apply -f ./nodeport

