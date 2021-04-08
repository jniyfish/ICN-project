# !/bin/bash

ip link set brg_h1 name eth0
ip link set brg_isp name eth1

ip addr add 172.27.0.1/16 dev eth1
ip link add my_gre type gretap remote 140.113.0.1 local 172.27.0.1 encap fou encap-sport 33333 encap-dport 55555

ip link add br0 type bridge
ip link set eth0 master br0
ip link set my_gre master br0

ip route add 140.113.0.0/16 via 172.27.0.1

ip link set eth1 up
ip link set eth0 up
ip link set br0 up

sysctl net.ipv4.ip_forward=1