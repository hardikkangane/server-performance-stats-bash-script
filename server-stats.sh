#!/bin/bash

echo "============================================"
echo "        SERVER PERFORMANCE STATISTICS        "
echo "============================================"
echo 

# ----------- CPU USAGE -----------------------------------
echo ">>> Total CPU Usage:"
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d. -f1)
CPU_USAGE=$((100 - CPU_IDLE))
echo "CPU Usage: $CPU_USAGE%"
echo 

# ----------- MEMORY USAGE --------------------------------
echo ">>> Memory Usage:"
MEM_TOTAL=$(free -m | awk 'NR==2 {print $2}')
MEM_USED=$(free -m | awk 'NR==2 {print $3}')
MEM_FREE=$(free -m | awk 'NR==2 {print $4}')
MEM_PERC=$(( MEM_USED * 100 / MEM_TOTAL ))

echo "Total Memory: ${MEM_TOTAL}MB"
echo "Used Memory:  ${MEM_USED}MB"
echo "Free Memory:  ${MEM_FREE}MB"
echo "Usage:        ${MEM_PERC}%"
echo 

# ----------- DISK USAGE ----------------------------------
echo ">>> Disk Usage (root partition):"
DISK_TOTAL=$(df -h | awk 'NR==3 {print $2}')
DISK_USED=$(df -h | awk 'NR==3 {print $3}')
DISK_AVAIL=$(df -h | awk 'NR==3 {print $4}')
DISK_PERC=$(df -h | awk 'NR==3 {print $5}')

echo "Total Disk: $DISK_TOTAL"
echo "Used Disk:  $DISK_USED"
echo "Free Disk:  $DISK_AVAIL"
echo "Usage:      $DISK_PERC"
echo 

# ----------- TOP 5 CPU PROCESSES --------------------------
echo ">>> Top 5 Processes by CPU Usage:"
ps aux --sort=-%cpu | head -6
echo 

# ----------- TOP 5 MEMORY PROCESSES -----------------------
echo ">>> Top 5 Processes by Memory Usage:"
ps aux --sort=-%mem | head -6
echo 

echo "============================================"
echo "         END OF SERVER PERFORMANCE STATS      "
echo "============================================"
