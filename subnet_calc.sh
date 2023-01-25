#!/bin/bash

# Script name: subnet_calc.sh
# Description: Calculates various information about an IPv4 subnet
# Author: J Clingensmith
# Date: 01/25/2023
# Version: 1.0

# Get the IP address and CIDR from the user
read -p "Enter the IP address in CIDR notation (e.g. 192.168.0.0/24): " ip_cidr

# Extract the IP address and CIDR using parameter expansion
ip=${ip_cidr%/*}
cidr=${ip_cidr#*/}

# Calculate the subnet mask
subnet_mask=$(ipcalc -p $ip_cidr | awk -F' = ' '/NETMASK/ {print $2}')

# Calculate the increment
increment=$(ipcalc -b $ip_cidr | awk -F' = ' '/INCREMENT/ {print $2}')

# Calculate the current subnet
current_subnet=$(ipcalc -n $ip_cidr | awk -F' = ' '/NETWORK/ {print $2}')

# Calculate the next subnet
next_subnet=$(ipcalc -n $ip_cidr | awk -F' = ' '/NEXT-NET/ {print $2}')

# Calculate the broadcast address
broadcast=$(ipcalc -b $ip_cidr | awk -F' = ' '/BROADCAST/ {print $2}')

# Calculate the first IP address
first_ip=$(ipcalc -h $ip_cidr | awk -F' = ' '/HOSTMIN/ {print $2}')

# Calculate the last IP address
last_ip=$(ipcalc -h $ip_cidr | awk -F' = ' '/HOSTMAX/ {print $2}')

# Calculate the number of subnet bits
subnet_bits=$(ipcalc -b $ip_cidr | awk -F' = ' '/PREFIX/ {print $2}')

# Calculate the number of host bits
host_bits=$((32-subnet_bits))

# Calculate the number of subnets
number_of_subnets=$((2**subnet_bits))

# Calculate the number of hosts
number_of_hosts=$((2**host_bits-2))

# Print the results
echo "Increment: $increment"
echo "Current Subnet: $current_subnet"
echo "Next Subnet: $next_subnet"
echo "Broadcast Address: $broadcast"
echo "First IP address: $first_ip"
echo "Last IP address: $last_ip"
echo "Subnet bits: $subnet_bits"
echo "Host bits: $host_bits"
echo "Number of Subnets: $number_of_subnets"
echo "Number of Hosts: $number_of_hosts"
