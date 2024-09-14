````markdown
# System Management Project

## Overview

This project provides a set of shell scripts for monitoring system resources, including CPU, memory, disk usage, and battery status. The scripts log usage statistics and send notifications if usage exceeds defined thresholds. They are useful for real-time monitoring and managing system performance.

## Folder Structure

- `scripts/`: Contains shell scripts for monitoring and notifications.
  - `monitor.sh`: Main script for checking system usage and displaying real-time statistics.
  - `notify.sh`: Sends notifications when usage exceeds thresholds defined in `config.sh`.
  - `config.sh`: Configuration file with thresholds for notifications and settings.
- `logs/`: Directory where log files are saved.
- `README.md`: Documentation file.

## Setup

1. **Clone the repository:**

   ```bash
   git clone <repository_url>
   ```
````

2. **Navigate to the project directory:**

   ```bash
   cd <repository_name>
   ```

3. **Make sure the scripts have executable permissions:**

   ```bash
   chmod +x scripts/*.sh
   ```

4. **Configure the thresholds:**

   Edit the `scripts/config.sh` file to set your desired thresholds for CPU, memory, disk usage, and battery. The default values are:

   ```bash
   # Configuration for thresholds
   CPU_THRESHOLD=90
   MEMORY_THRESHOLD=80
   DISK_THRESHOLD=90
   BATTERY_THRESHOLD=20
   ```

5. **Run the monitoring script:**

   ```bash
   ./scripts/monitor.sh
   ```

   This script will display real-time statistics for CPU usage, memory usage, disk usage, and battery status. It will also show the top CPU and memory consuming processes.

6. **Run the notification script separately (optional):**

   You can run `notify.sh` in the background to receive notifications based on the thresholds set in `config.sh`.

   ```bash
   ./scripts/notify.sh
   ```

## Features

- **Real-time Monitoring**: `monitor.sh` displays real-time statistics for CPU usage, memory usage, disk usage, and battery status.
- **Top Processes**: Shows the top CPU and memory consuming processes, sorted from highest to lowest usage.
- **Notifications**: `notify.sh` sends notifications if CPU, memory, disk usage, or battery levels exceed the configured thresholds.
- **Logging**: Usage statistics are saved in the `logs/` directory for historical reference.

## Example Output

Running `monitor.sh` will produce output similar to:

```
CPU Usage: 96%
Memory Usage: 47.9861%
Memory Total: 14946 MB
Memory Used: 7172 MB
Disk Usage: 72%
Disk Total: 234G
Disk Used: 159G
Battery Capacity: 85%
Battery Status: Charging

Top CPU consuming processes:
/snap/chromium/2943/usr/lib/chromium-browser/chrome 31.1
/usr/share/code/code 25.1
/usr/local/bin/k3s 14.8
...

Top Memory consuming processes:
/usr/share/code/code 20.0
/snap/chromium/2943/usr/lib/chromium-browser/chrome 3.2
/usr/sbin/mysqld 2.5
...
```

## Contributing

Contributions to this project are welcome. Please follow the standard Git workflow: fork the repository, make changes, and submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact

For any issues or questions, please contact Syaiful Imanudin at yusriltc@gmail.com.

```

Copy and paste this content into your `README.md` file. Be sure to replace `<repository_url>`, `<repository_name>`, `[Your Name]`, and `[Your Email]` with the appropriate information for your project.
```
