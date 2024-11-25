#!/bin/bash

disk_usuage(){
	df -h
}

monitor_running_service(){
	systemctl | grep -i "running"
}

memory_usage(){
	free
}

cpu_usage(){
	top | head -n 10
}

send_email(){
	 local email="ishuj4329@gmail.com"
	 local report="/tmp/healthcheck_report.txt"

	 {
		 echo "disk usage : " disk_usage
		 echo
		 echo "monitor-running sevices : " monitor_running_service
		 echo
		 echo "memory usage : " memory_usage
		 echo
		 echo "CPU usage : " cpu_usage
		 echo 
	} > "$report"
	mail -s "System Health Report" "$email" > "$report"

}

display_menu(){
	echo "1. Check Disk Usage"
	echo "2. Monitor Running Services"
	echo "3. Assess Memory Usage"
	echo "4. Evaluate CPU Usage"
	echo "5. Send a Comprehensive Report via Email Every Four Hours"
	echo "6. Exit"

}

while true; do
	display_menu
	read "Enter your choice : " choice
	case $choice in
		1) disk_usage ;;
                2) monitor_running_service ;;
                3) memory_usage ;;
                4) cpu_usage ;;
                5) send_email ;;
                6) exit 0 ;;
                *) echo "Invalid choice" ;;
	esac
done
