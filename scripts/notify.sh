#!/bin/bash

# Source configuration
source ./scripts/config.sh

# Notification message
MESSAGE=$1

# Print message to the console
echo "Notification: $MESSAGE"

# Optional: Send an email notification
if [ -n "$NOTIFY_EMAIL" ]; then
    echo "$MESSAGE" | mail -s "System Alert" $NOTIFY_EMAIL
fi
