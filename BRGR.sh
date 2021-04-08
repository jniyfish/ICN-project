# !/bin/bash

ip link set brgr_isp name eth1
ip link set brgr_gwr name eth0

ip addr add 140.113.0.1/16 dev eth1
ip link add my_gre type gretap remote 140.114.0.1 local 140.113.0.1 encap fou encap-sport 55555 encap-dport 23456

ip link add br0 type bridge
ip link set eth0 master br0
ip link set my_gre master br0

ip route add 140.114.0.0/16 via 140.113.0.1

ip link set eth1 up
ip link set eth0 up
ip link set br0 up

sysctl net.ipv4.ip_forward=1