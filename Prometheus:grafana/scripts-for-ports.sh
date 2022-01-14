#!/bin/bash

iptables -I INPUT 1 -p tcp --match multiport --dports 9090,9093,9094,9100,3000 -j ACCEPT
iptables -A INPUT -p udp --dport 9094 -j ACCEPT
# setenforce 0
# sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
echo 'script completed '