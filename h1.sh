# !/bin/bash

ip link set h1 name eth0
ip addr add 20.0.0.1/8 dev eth0
ip link set eth0 up
