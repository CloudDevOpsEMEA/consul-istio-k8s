#!/usr/bin/env bash

IP_ADDRESS=$(hostname -I | cut -d' ' -f1)

case ${IP_ADDRESS} in

  "10.1.1.5")
    sudo sh -c "echo k8s-master > /etc/hostname" ; sudo init 6
    ;;
  "10.1.1.6")
    sudo sh -c "echo k8s-node > /etc/hostname" ; sudo init 6
    ;;
  "10.1.1.7")
    sudo sh -c "echo consul-master > /etc/hostname" ; sudo init 6
    ;;
  "10.1.1.8")
    sudo sh -c "echo consul-node > /etc/hostname" ; sudo init 6
    ;;
  "10.1.1.9")
    sudo sh -c "echo traditional > /etc/hostname" ; sudo init 6
    ;;
  "10.1.1.10")
    sudo sh -c "echo jumphost > /etc/hostname" ; sudo init 6
    ;;

esac
