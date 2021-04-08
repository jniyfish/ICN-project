# !/bin/bash

pid_BRG1=$(sudo docker inspect -f '{{.State.Pid}}' BRG1)
pid_isp=$(sudo docker inspect -f '{{.State.Pid}}' isp)
pid_BRGr=$(sudo docker inspect -f '{{.State.Pid}}' BRGr)
pid_h1=$(sudo docker inspect -f '{{.State.Pid}}' h1)

sudo ip link add h1 type veth peer name brg_h1
sudo ip link add brg_isp type veth peer name isp_brg
sudo ip link add isp_brgr type veth peer name brgr_isp
sudo ip link add brgr_gwr  type veth peer name eth0

sudo ip link set h1 netns $pid_h1
sudo ip link set brg_h1 netns $pid_BRG1
sudo ip link set brg_isp netns $pid_BRG1
sudo ip link set isp_brg netns $pid_isp
sudo ip link set isp_brgr netns $pid_isp
sudo ip link set brgr_isp netns $pid_BRGr
sudo ip link set brgr_gwr netns $pid_BRGr

