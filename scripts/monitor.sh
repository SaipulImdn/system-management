#!/bin/bash

# Source configuration
source ./scripts/config.sh

# Function to check CPU usage
check_cpu() {
    CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")
    CPU_USAGE=$(awk "BEGIN {print 100 - $CPU_IDLE}")
    echo "CPU Usage: ${CPU_USAGE}%"
}

# Function to check memory usage
check_memory() {
    MEMORY_TOTAL=$(free -m | grep Mem | awk '{print $2}') # Total memory in MB
    MEMORY_USED=$(free -m | grep Mem | awk '{print $3}') # Used memory in MB
    MEMORY_USAGE=$(awk "BEGIN {print ($MEMORY_USED / $MEMORY_TOTAL) * 100}")
    echo "Memory Usage: ${MEMORY_USAGE}%"
    echo "Memory Total: ${MEMORY_TOTAL} MB"
    echo "Memory Used: ${MEMORY_USED} MB"
}

# Function to check disk usage
check_disk() {
    DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')
    DISK_TOTAL=$(df -h / | grep / | awk '{print $2}')
    DISK_USED=$(df -h / | grep / | awk '{print $3}')
    echo "Disk Usage: ${DISK_USAGE}%"
    echo "Disk Total: ${DISK_TOTAL}"
    echo "Disk Used: ${DISK_USED}"
}

# Function to check battery status
check_battery() {
    if [ -f /sys/class/power_supply/BAT0/capacity ]; then
        BATTERY_CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
        BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
        echo "Battery Capacity: ${BATTERY_CAPACITY}%"
        echo "Battery Status: ${BATTERY_STATUS}"
    else
        echo "Battery information not available."
    fi
}

# Function to list top CPU consuming processes
top_cpu_processes() {
    echo "Top CPU consuming processes:"
    ps -eo pcpu,pid,cmd --sort=-pcpu | head -n 11 | awk '{print $3, $1}'
}

# Function to list top memory consuming processes
top_memory_processes() {
    echo "Top Memory consuming processes:"
    ps -eo pmem,pid,cmd --sort=-pmem | head -n 11 | awk '{print $3, $1}'
}

# Function to display system stats in real-time
monitor_system() {
    while true; do
        clear
        check_cpu
        check_memory
        check_disk
        check_battery
        top_cpu_processes
        top_memory_processes
        echo "Press Ctrl+C to stop monitoring..."
        sleep 5 # Refresh interval in seconds
    done
}

# Set trap for SIGINT (Ctrl+C)
trap 'echo "Monitoring stopped."; exit' SIGINT

# Run the system monitor
monitor_system
