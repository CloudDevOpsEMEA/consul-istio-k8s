# Makefile

CONSULT_VERSION=1.9.0

.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


install:  ## Install consul server
	sudo apt-get install -y unzip gnupg2 curl wget
	cd /tmp && \
	wget https://releases.hashicorp.com/consul/${CONSULT_VERSION}/consul_${CONSULT_VERSION}_linux_amd64.zip && \
	unzip consul_${CONSULT_VERSION}_linux_amd64.zip && \
	sudo mv consul /usr/local/bin/
	consul --version
	sudo groupadd --system consul
	sudo useradd -s /sbin/nologin --system -g consul consul
	sudo mkdir -p /var/lib/consul
	sudo mkdir /etc/consul.d
	sudo chown -R consul:consul /var/lib/consul
	sudo chmod -R 775 /var/lib/consul
	sudo chown -R consul:consul /etc/consul.d
	sudo cp consul.service /etc/systemd/system/consul.service
	sudo systemctl daemon-reload
	sudo cp config.json /etc/consul.d/config.json
	sudo chown -R consul:consul /etc/consul.d
	sudo systemctl start consul
	sudo systemctl enable consul

	
