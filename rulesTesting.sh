#! /bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward
cat /proc/sys/net/ipv4/ip_forward

iptables -A FORWARD -p tcp --dport 7777 -j NFQUEUE --queue-num 0










