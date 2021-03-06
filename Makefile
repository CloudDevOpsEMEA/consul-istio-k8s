# Makefile

GIT_REPO=https://github.com/CloudDevOpsEMEA/consul-istio-k8s
HOME_DIR=/home/ubuntu
REPO_DIR=${HOME_DIR}/consul-istio-k8s


.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


install-k8s: ## Install k8s using kubespray
	cd /tmp && git clone https://github.com/kubernetes-sigs/kubespray.git && \
	cd kubespray && git checkout release-2.14 && \
	cp -R ${REPO_DIR}/kubespray/istio /tmp/kubespray/inventory && \
	sudo pip3 install -r requirements.txt && \
	ansible-playbook -i inventory/istio/hosts.yaml  --become --become-user=root cluster.yml


reboot-k8s: ## Reboot k8s cluster hosts
	ssh k8s-master sudo reboot || true
	ssh k8s-node sudo reboot || true


reboot-consul: ## Reboot consul cluster hosts
	ssh consul-master sudo reboot || true
	ssh consul-node sudo reboot || true


git-clone-all: ## Clone all git repos
	ssh k8s-master    'cd ${HOME_DIR} ; git clone ${GIT_REPO}' || true
	ssh k8s-node      'cd ${HOME_DIR} ; git clone ${GIT_REPO}' || true
	ssh consul-master 'cd ${HOME_DIR} ; git clone ${GIT_REPO}' || true
	ssh consul-node   'cd ${HOME_DIR} ; git clone ${GIT_REPO}' || true
	ssh jumphost      'cd ${HOME_DIR} ; git clone ${GIT_REPO}' || true
	ssh traditional   'cd ${HOME_DIR} ; git clone ${GIT_REPO}' || true


git-pull-all: ## Pull all git repos
	ssh k8s-master    'cd ${REPO_DIR}; git pull ; sudo updatedb' || true
	ssh k8s-node      'cd ${REPO_DIR}; git pull ; sudo updatedb' || true
	ssh consul-master 'cd ${REPO_DIR}; git pull ; sudo updatedb' || true
	ssh consul-node   'cd ${REPO_DIR}; git pull ; sudo updatedb' || true
	ssh jumphost      'cd ${REPO_DIR}; git pull ; sudo updatedb' || true
	ssh traditional   'cd ${REPO_DIR}; git pull ; sudo updatedb' || true
