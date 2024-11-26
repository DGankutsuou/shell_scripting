#!bin/bash

USED_MEM=`free -m | grep 'Mem:' | awk '{printf("%d/%dMB", $3, $2)}'`
MEM_USAGE=`free -m | grep 'Mem:' | awk '{printf("%.2f%%", $3 / $2 * 100)}'`

USED_DISK=`df -h --total | grep 'total' | awk '{printf("%d/%sb", $3, $2)}'`
DISK_USAGE=`df -h --total | grep 'total' | awk '{printf("%s", $(NF - 1))}'`

LVM_USE=`
	if [ $(lsblk | grep -c 'lvm') -eq 0 ]
		then
			echo no
		else
			echo yes
	fi
`

wall "	#Architecture: `uname -a`
	#CPU physical : `grep 'physical id' /proc/cpuinfo | sort -u | wc -l`
	#vCPU : `lscpu -e | grep -vc 'CPU'`
	#Memory Usage: $USED_MEM ($MEM_USAGE)
	#Disk Usage: $USED_DISK ($DISK_USAGE)
	#CPU load: `mpstat | grep 'all' | awk '{printf("%.1f%%", 100.00 - $NF)}'`
	#Last boot: `who -b | awk '{printf("%s %s", $3, $4)}'`
	#LVM use: $LVM_USE
	#Connections TCP : `ss -t | grep -vc 'State'` ESTABLISHED
	#User log: users | wc -w
	#Network: IP `hostname -I` (`ip a | grep 'ether' | awk '{printf("%s", $2)}'`)
	#Sudo : `grep -c 'PWD=' /var/log/sudo/sudo.log` cmd"
