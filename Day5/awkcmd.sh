#!/bin/bash

#("TASK 1 -----EXTRACT UNIQUE IP ADDRESS------")
awk '{
for(i=1; i<NF; i++){
        if ($i ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/){
                arr_ip[$i]++
        }
}
}
END {
for(ip in arr_ip){
        print ip
        c++
}
print "Unique IP Addresses : ", c
}' user_activity.log | sort | uniq

#( "TASK 2 --------SHOW ALL USERS-----")
awk '{
for(i=1; i<NF; i++){
        if ($i ~ /user/){
                arr_user[$i]++
        }
}
}
END {
for(u in arr_user){
        print u
}
}' user_activity.log
#( "TASK 3 ------COUNT HTTP STATUS CODE-------")
awk '{for(i=1;i<=NF;i++)
if ($i ~ /^[0-9]{3}$/){
        count[$i]++}
}
END {
for(code in count){
        print code, count[code]}
}' user_activity.log | sort -nr -k2
#("TASK 4------Identify Failed Login Attempts-------")
#
awk '{for(i=1;i<=NF;i++) if ($i == 403) print $0}' user_activity.log

#("TASK 5 ------- Generate a Summary Report Create a summary report----")
awk '
{

    for(i=1;i<=NF;i++) {if ($i ~ /user/) {c++}}
    totaluser++
    if ($NF == 200) success++
    if ($NF == 404 || $NF == 403) fail++
}
END {
    print "Total unique users: " c
    print "Total requests: " totaluser
    print "Successful requests (200): " success
    print "Failed requests (404 or 403): " fail
}' user_activity.log
