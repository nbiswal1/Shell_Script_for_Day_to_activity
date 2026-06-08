#!/bin/bash

#Advanced System Monitoring + Maintenance Script

LOG_FILE="/var/log/system_health_$(date +%F).log"


echo "===============================" | tee -a "$LOG_FILE"
echo " SYSTEM HEALTH REPORT " | tee -a "$LOG_FILE"
echo "===============================" | tee -a "$LOG_FILE"

echo -e "\n[1] System Uptime" | tee -a "$LOG_FILE"
uptime -p | tee -a "$LOG_FILE"

echo -e "\n[2] CPU Usage" | tee -a "$LOG_FILE"
top -bn1 | grep "Cpu(s)" | tee -a "$LOG_FILE"

echo -e "\n[3] Memory Usage" | tee -a "$LOG_FILE"
free -h | tee -a "$LOG_FILE"

echo -e "\n[4] Disk Usage" | tee -a "$LOG_FILE"
df -h | tee -a "$LOG_FILE"

echo -e "\n[5] Listening Ports" | tee -a "$LOG_FILE"
ss -tuln | tee -a "$LOG_FILE"

echo -e "\n[6] System Update & Cleanup" | tee -a "$LOG_FILE"

apt-get update -y >> "$LOG_FILE" 2>&1
apt-get upgrade -y -o Dpkg::Options::="--force-confold" >> "$LOG_FILE" 2>&1
apt-get autoremove -y >> "$LOG_FILE" 2>&1
apt-get clean >> "$LOG_FILE" 2>&1

echo "System update completed successfully" | tee -a "$LOG_FILE"

echo "===============================" | tee -a "$LOG_FILE"
echo " REPORT COMPLETED " | tee -a "$LOG_FILE"
echo " Log File: $LOG_FILE " | tee -a "$LOG_FILE"
echo "===============================" | tee -a "$LOG_FILE"
