#!/bin/bash
LOG="monitor_$(date +%Y-%m-%d_%H-%M-%S).txt"
CPU=$(top -bn1 | grep "Cpu" | awk '{print $2}')
RAM=$(free -m | awk '/Mem/ {print $3}')
DISK=$(df -h / | awk 'NR==2 {print $5}')
echo "=== Server Monitor Report ===" > "$LOG"
echo "CPU Usage: $CPU%" >> "$LOG"
echo "RAM Usage: $RAM MB" >> "$LOG"
echo "Disk Usage: $DISK" >> "$LOG"
echo "Report saved to $LOG"
