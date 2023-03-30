#!/bin/bash
clear
cmd=0
while true;
do
    echo "#########################################################################"
    echo -e "\e[31mHello $USER, what do you want to know about your system?\e[0m"
    echo -e "\e[38;5;196m1. View distribution and machine name\e[0m"
    echo -e "\e[38;5;226m2. View Distribution version\e[0m"
    echo -e "\e[38;5;208m3. View CPU information\e[0m"
    echo -e "\e[38;5;33m4. View Storage information\e[0m"
    echo -e "\e[38;5;38m5. View Memory information\e[0m"
    echo -e "\e[38;5;27m6. View System's IP\e[0m"
    echo -e "\e[38;5;93m7. List all user\e[0m"
    echo -e "\e[38;5;82m8. List all process\e[0m"
    echo -e "\e[38;5;214m9. View all ports\e[0m"
    echo -e "\e[38;5;111m10. List the folders allow others to write\e[0m"
    echo -e "\e[38;5;201m11. List the packages\e[0m"
    echo "0. Exit"
    echo "Your wish is: "
    read cmd
    

    if [ $cmd -eq 0 ]; then
        echo "Goodbye $USER"
        break
    else
        if [ $cmd -eq 1 ]; then
            uname -a
        fi
        
        if [ $cmd -eq 2 ]; then
            uname -a
        fi

        if [ $cmd -eq 3 ]; then
            lscpu
        fi

        if [ $cmd -eq 4 ]; then
            lsblk
        fi

        if [ $cmd -eq 5 ]; then
            df
        fi

        if [ $cmd -eq 6 ]; then
            ip_list=$(ip -4 addr | grep inet | awk '{print $2}')
            echo $ip_list
        fi

        if [ $cmd -eq 7 ]; then
            echo $(cut -d: -f1 /etc/passwd | sort)
        fi

        if [ $cmd -eq 8 ]; then
            echo $(ps -ef | awk '$1=="root" {print $0}' | sort)
        fi

        if [ $cmd -eq 9 ]; then
            echo $(netstat -tln | awk '$1=="tcp" {print $4}' | awk -F":" '{print $NF}' | sort -n | uniq)
        fi

        if [ $cmd -eq 10 ]; then
            echo $(find / -type d -perm -o+w 2>/dev/null)
        fi

        if [ $cmd -eq 11 ]; then
            echo $(dpkg -l | awk '$1=="ii" {print $2,$3}')
        fi


    fi

done 
#uname -a
#lscpu
#free
#lsblk

