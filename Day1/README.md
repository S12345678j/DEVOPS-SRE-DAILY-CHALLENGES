SYSTEM HEALTH MONITORING SCRIPT
This Shell script provides system health monitoring capabilities with email reporting functionality.It allows users to check various system metrics and receive email reports abiut system health.

✨FEATURES :

1. Disk Usage Monitoring 💾

Function: disk_usage()

-Monitors disk space utilization using "df -h" command

-Returns percentage of disk usage

-Handles exceptions and returns error messages if monitoring fails

2. Running Services Monitor 🔄
   
-Function: monitor_running_service()

-Lists all currently running system services using systemctl

-Uses OS commands to fetch service status

-Returns formatted list of active services

-Includes error handling for command execution failures

3. Memory Usage Assessment 🧮
 
-Function: memory_usage()

-Tracks system memory utilization using "free" command

-Provides memory usage percentage and total available memory in GB

-Includes exception handling for monitoring failures

4. CPU Usage Evaluation ⚡
 
-Function: cpu_usage()

-Monitors CPU utilization percentage

-Tracks CPU utilization using top command

-Returns current CPU usage percentage

-Handles potential monitoring errors

5. Email Reporting System 📧
 
-Function: send_email()

-Sends system health metrics into a comprehensive report using "mail" every four hours(using crontab -e)

-Includes all monitored metrics in the email body

-Handles email sending failures with error reporting

📋 Interactive Menu

The script includes an interactive menu system that allows users to:

Choose specific monitoring functions

-Execute individual checks

-Send complete system reports via email

-Exit the program

⚠️ Error Handling

-Comprehensive exception handling throughout all functions

-User-friendly error messages
-Graceful error recovery
