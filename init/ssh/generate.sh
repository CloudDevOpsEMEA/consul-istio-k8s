#!/usr/bin/env bash

TMP_BASE_DIR=/tmp/ssh-udf

echo "Creating temporary output folders"
mkdir -p ${TMP_BASE_DIR}/bigip
mkdir -p ${TMP_BASE_DIR}/k8s-master
mkdir -p ${TMP_BASE_DIR}/k8s-node
mkdir -p ${TMP_BASE_DIR}/consul-master
mkdir -p ${TMP_BASE_DIR}/consul-node
mkdir -p ${TMP_BASE_DIR}/traditional
mkdir -p ${TMP_BASE_DIR}/jumphost

echo "Generating ssh key pairs"
ssh-keygen -b 2048 -t rsa -f ${TMP_BASE_DIR}/bigip/id_rsa         -C ubuntu@bigip         -q -N ""
ssh-keygen -b 2048 -t rsa -f ${TMP_BASE_DIR}/k8s-master/id_rsa    -C ubuntu@k8s-master    -q -N ""
ssh-keygen -b 2048 -t rsa -f ${TMP_BASE_DIR}/k8s-node/id_rsa      -C ubuntu@k8s-node      -q -N ""
ssh-keygen -b 2048 -t rsa -f ${TMP_BASE_DIR}/consul-master/id_rsa -C ubuntu@consul-master -q -N ""
ssh-keygen -b 2048 -t rsa -f ${TMP_BASE_DIR}/consul-node/id_rsa   -C ubuntu@consul-node   -q -N ""
ssh-keygen -b 2048 -t rsa -f ${TMP_BASE_DIR}/traditional/id_rsa   -C ubuntu@traditional   -q -N ""
ssh-keygen -b 2048 -t rsa -f ${TMP_BASE_DIR}/jumphost/id_rsa      -C ubuntu@jumphost      -q -N ""

echo "Moving ssh keypairs to repo"
mv ${TMP_BASE_DIR}/* .
