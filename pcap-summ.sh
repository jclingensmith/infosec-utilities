tshark -r capture.pcap -T fields -e ip.src -e ip.dst -e frame.protocols -e ssl.handshake.ciphersuite -Y "ssl" -E separator=, -E header=y > summary.csv
#tcpdump -nn -r capture.pcap | awk '{print $3, $5, $9}' | sort | uniq -c > summary.txt
