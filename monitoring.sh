#!/bin/bash
arch=$(uname -a)
cpup=$(cat /proc/cpuinfo | grep "physical id" | wc -l)
cpuv=$(cat /proc/cpuinfo | grep processor | wc -l)
fram=$(free -m | grep Mem | awk '$1 == "Mem:" {printf $2}')
uram=$(free -m | grep Mem | awk '$1 == "Mem:" {printf $3}')
pram=$(free | grep Mem | awk '$1 == "Mem:" {printf("%.2f"), $3/2*100}')
disk=$(df -h --total | grep total | awk '{printf("%.1f/%.fGb (%s)", $3, $2, $5)}')
cpul=$(top -bn1 | grep '^%Cpu' | awk '{printf("%.1f%%", $2 + $4)}')
lboot=$(uptime -s | awk '{printf("%s %s\n", $1, substr($2, 1, length($2) - 3))}')
onlvm=$(lsblk | grep lvm | wc -l | awk '{if ($1){printf("yes"); exit;} else print "no"}')
ontcp=$(netstat -an | grep ESTABLISHED | wc -l)
log=$(users | wc -w)
ip=$(hostname -I)
macad=$(ip link show | grep "ether" | awk '{printf ($2)}')
#sudo=$(journalctl _COMM=sudo | grep COMMAND | wc -l)
wall "	#Architecture: $arch
	#CPU physical: $pcpu
	#vCPU: $vcpu
	#Memory Usage: $uram/${fram}MB ($pram%)
	#Disk Usage: $disk
	#CPU load: $cpul
	#Last boot: $lboot
	#LVM use: $onlvm
	#Connections TCP: $ontcp ESTABLISHED
	#User log: $log
	#Network: IP $ip ($macad)
	#Sudo: $sudo cmd"


Configure contrab -e
	root@login:~# sudo crontab -e
	*/10 * * * * sh /path/to/file/monitoring.sh
	root@login:~# systemctl enable cron.service
	root@login:~# reboot
