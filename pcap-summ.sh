tshark -r capture.pcap -T fields -e ip.src -e ip.dst -e frame.protocols -e ssl.handshake.ciphersuite -Y "ssl" -E separator=, -E header=y > summary.csv
