#!/bin/bash
arch=$(uname -a)
cpup=$(cat /proc/cpuinfo | grep "physical id" | wc -l)
cpuv=$(cat /proc/cpuinfo | grep processor | wc -l)
mem=$(free -m | grep Mem | awk '{printf("%.1f/%.fGb (%s)", $3, $2, ($3/$2)/100)}')
disku=$(df -h --total | grep total | awk '{printf("%.1f/%fGb (%s)", $3, $2, $5)}')
The current utilization rate of your processors as a percentage:
The date and time of the last reboot:
Whether LVM is active or not:
The number of active connections:
The number of users using the server:
The IPv4 address of your server and its MAC (Media Access Control) address:
The number of commands executed with the sudo program:
