# !/bin/bash

ip link set isp_brg name eth0
ip link set isp_brgr name eth1


ip addr add 172.27.0.2/16 dev eth0
ip addr add 140.114.0.1/16 dev eth1

ip route add 140.113.0.0/16 via 140.114.0.1

ip link set eth1 up
ip link set eth0 up

iptables -t nat -A POSTROUTING -p UDP -s 172.27.0.0/16 -d 0.0.0.0/0 -o eth1 -j SNAT --to-source 140.114.0.1:23456

sysctl net.ipv4.ip_forward=1