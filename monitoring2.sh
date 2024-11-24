#!/bin/bash
ARC=(uname -a)

PCPU=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)

VCPU=$(lscpu -e | grep -vc 'CPU')

MEM_SIZE=$(free -m | grep "Mem:" | awk '{print $2}')

USED_MEM=$(free -m | grep "Mem:" | awk '{print $3}')

MEM_PRC=$(free | grep "Mem:" | awk '{printf("%.2f", $3/$2*100)}')

DISK_SIZE=$(df -h --total --output=size | awk 'END {print $1}')

USED_DISK=$(df -BM | grep '^/dev/' | grep -v '/boot$' | awk '{ud += $3} END {print ud}')

DISK_PRC=$(df -BM | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft+= $2} END {printf("%d"), ut/ft*100}')

CPU_LOAD=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')

LAST_BOOT=$(who -b | awk '$1 == "system" {printf("%s %s"), $3, $4}')

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
