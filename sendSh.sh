#! /bin/bash
docker cp h1.sh h1:/
docker cp BRGR.sh BRGr:/
docker cp BRG1.sh BRG1:/
docker cp isp.sh isp:/


sysctl net.ipv4.ip_forward=1