# Steps to Run the System Info Script

bash
#### 1. Open the terminal

#### 2. Navigate to the folder where the script (system_info.sh) is located
#### For example, if it's in the Documents folder, use this command:
cd ~/Documents

#### 3. Run the script using the following command:

./system_info.sh

#### If you encounter a "Permission denied" error, you need to make the script executable. Run this command:
chmod +x system_info.sh

#### 4. Once the script runs, it will generate a file named system_info.txt in the same folder, containing detailed system information.

#### 5. To view the contents of the system_info.txt file, you can use:
cat system_info.txt

#### Or open it with a text editor like nano or gedit:
nano system_info.txt



## This will show all the steps within a single block of code.


# Will This Work With All Ubuntu


![Alt text](assets/Screenshot%202024-10-21%20191950.png)
![Alt text](assets/Screenshot%202024-10-21%20192143.png)



## Additional Consideration:
If you want the script to be fully portable across systems, you might want to include a check to see if these utilities are installed. Here's an example to check and notify the user:


#!/bin/bash
echo "System Information" > system_info.txt
echo "===================" >> system_info.txt

uname -a >> system_info.txt

echo -e "\nMemory Information" >> system_info.txt
if ! command -v dmidecode &> /dev/null; then
    echo "dmidecode not found, install it with: sudo apt install dmidecode" >> system_info.txt
else
    sudo dmidecode --type memory >> system_info.txt
fi

echo -e "\nRAM Usage" >> system_info.txt
free -h >> system_info.txt

echo -e "\nCPU Information" >> system_info.txt
lscpu >> system_info.txt

echo -e "\nDrive Space" >> system_info.txt
df -h >> system_info.txt

echo -e "\nDrive Type (0=SSD, 1=HDD)" >> system_info.txt
cat /sys/block/sda/queue/rotational >> system_info.txt

echo -e "\nMotherboard Information" >> system_info.txt
if ! command -v dmidecode &> /dev/null; then
    echo "dmidecode not found, install it with: sudo apt install dmidecode" >> system_info.txt
else
    sudo dmidecode -t baseboard >> system_info.txt
fi

echo -e "\nDrive Details" >> system_info.txt
if ! command -v hdparm &> /dev/null; then
    echo "hdparm not found, install it with: sudo apt install hdparm" >> system_info.txt
else
    sudo hdparm -I /dev/sda >> system_info.txt
fi



### This will notify the user to install dmidecode or hdparm if they aren't present.


