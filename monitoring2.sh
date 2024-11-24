#!/bin/bash
ARC=(uname -a)

PCPU=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)

VCPU=$(lscpu -e | grep -vc 'CPU')

MEM_SIZE=$(free -m | grep "Mem:" | awk '{print $2}')

USED_MEM=$(free -m | grep "Mem:" | awk '{print $3}')

MEM_PRC=$(free | grep "Mem:" | awk '{printf("%.2f", $3/$2*100)}')

DISK_SIZE=$(df -h --total --output=size | awk 'END {print $1}')

USED_DISK=$(df -h --total | grep 'total' | awk '{printf("%d", $3)}')

DISK_PRC=$(df -h --total | grep 'total' | awk 'END {print $NF}')

CPU_LOAD=$(mpstat | grep 'all' | awk '{printf("%.2f%%", 100.00 - $NF)}')

LAST_BOOT=$(who -b | awk '{printf("%s %s"), $3, $4}')

LVM_USE=$(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)

TCP=$(ss -neopt state established | wc -l)

USER_LOG=$(users | wc -w)

IP=$(hostname -I)

MAC=$(ip link show | grep "ether" | awk '{print $2}')

SUDO_LOG=$(cat /var/log/sudo/sudo.log | grep -c 'PWD=')

echo "	#Architecture: `uname -a`
	#CPU physical: $PCPU
	#vCPU: $VCPU
	#Memory Usage: $USED_MEM/${MEM_SIZE}MB ($MEM_PRC%)
	#Disk Usage: $USED_DISK/${DISK_SIZE}Gb ($DISK_PRC%)
	#CPU load: $CPU_LOAD
	#Last boot: $LAST_BOOT
	#LVM use: $LVM_USE
	#Connections TCP: $TCP ESTABLISHED
	#User log: $USER_LOG
	#Network: IP $IP ($MAC)
	#Sudo: $SUDO_LOG cmd"
