#!/usr/bin/env bash

sudo tee -a /etc/hosts << END

# Host aliases for the UDF systems
10.1.1.4    bigip
10.1.1.5    k8s-master
10.1.1.6    k8s-node
10.1.1.7    consul-master
10.1.1.8    consul-node
10.1.1.9    traditional
10.1.1.10   jumphost
10.1.1.10   kibana
10.1.1.10   elasticsearch
10.1.1.10   grafana
10.1.1.10   prometheus
END
