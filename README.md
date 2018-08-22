# Synopsis
Using scapy and netfilterqueue, this script is able to edit packet's data when the attacker is conducting a MITM. This will bring several benefits as the packet itself is still legitimate since we are only editing the data. Both IP and Data checksum will be recalculated in this script. The cool thing about this script is that you are able to edit the port, so it enables creater flexibility as a lot of the script out there is only designed for port 80 or 8080. This script is coded and run on Kali Linux.

# Motivation
For my final year project, I need to conduct penetration testing on a smart metering system. There are some default protection mechanism like packet replay. However, the packets are not encrypted and can be manipulated. Due to the sensitivity of the project, I am not allowed to put in the data or the data structure of the packet. Ultimately, this script has allowed me to conduct some attacks such as falsifying data and hash replay attacks.

# Installation
Install Python 3.5 or above

Install NetFilterQueue

Install ARPSPOOF






