#!/bin/bash

echo "System Information" > system_info.txt
echo "===================" >> system_info.txt
uname -a >> system_info.txt

echo -e "\nMemory Information" >> system_info.txt
sudo dmidecode --type memory >> system_info.txt

echo -e "\nRAM Usage" >> system_info.txt
free -h >> system_info.txt

echo -e "\nCPU Information" >> system_info.txt
lscpu >> system_info.txt

echo -e "\nDrive Space" >> system_info.txt
df -h >> system_info.txt

echo -e "\nDrive Type (0=SSD, 1=HDD)" >> system_info.txt
cat /sys/block/sda/queue/rotational >> system_info.txt

echo -e "\nMotherboard Information" >> system_info.txt
sudo dmidecode -t baseboard >> system_info.txt

echo -e "\nDrive Details" >> system_info.txt
sudo hdparm -I /dev/sda >> system_info.txt
