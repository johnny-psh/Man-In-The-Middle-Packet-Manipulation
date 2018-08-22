#Requires Python 3.5 and above
from scapy.all import *
from netfilterqueue import NetfilterQueue
import codecs


similar="" #Search for common bytes in the packets
newData = "" #Insert new Data

def modify(packet):
    pkt = packet.get_payload()
    pktInfo = IP(pkt)
    pktHex = pkt.hex()


    if pktInfo.haslayer(TCP) and pktInfo.getlayer(TCP).dport == 7777 and similar in pktHex:
        pktDefault = pktHex[:104]
        pktEdit = pktHex[104:                                   ]

        pktSave = pktEdit[16:]
        pktSave = newData + pktSave
        pktNew = pktDefault + pktSave

        pktBack = bytes.fromhex(pktNew)
        pktBack = IP(pktBack)
        del pktBack[IP].chksum
        del pktBack[TCP].chksum
        packet.set_payload(bytes(pktBack))
        print("Payload sent!")
    packet.accept()

nfqueue = NetfilterQueue()
nfqueue.bind(0, modify)
try:
    print ("[*] waiting for data")
    nfqueue.run()
except KeyboardInterrupt:
    pass

nfqueue.unbind()
