#!/usr/bin/env bash

echo "Replacing 10.1.1.x to 10.1.10.x in all kubernetes config files"

sudo sed -i '' -e 's|10\.1\.1\.|10\.1\.10\.|g' $(sudo find /etc/kubernetes -type f)
sudo sed -i '' -e 's|10\.1\.1\.|10\.1\.10\.|g' /etc/etcd.env

sudo sed -i '' -e 's|10\.1\.1\.|10\.1\.10\.|g' /etc/cni/net.d/calico.conflist.template
sudo sed -i '' -e 's|10\.1\.1\.|10\.1\.10\.|g' /etc/cni/net.d/10-calico.conflist
sudo sed -i '' -e 's|10\.1\.1\.|10\.1\.10\.|g' /etc/nginx/nginx.conf
sudo sed -i '' -e 's|10\.1\.1\.|10\.1\.10\.|g' /etc/ssl/etcd/openssl.conf