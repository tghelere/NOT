#!/bin/bash

user=$(whoami)
hostname=$(hostname | sed 's/.local//g')
distro=$(cat /etc/os-release | grep PRETTY_NAME | sed 's/PRETTY_NAME=//')
kernel=$(uname)
uptime=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')
shell="$SHELL"
terminal="$TERM ${TERM_PROGRAM//_/ }"
cpu=""
battery=""
ram=""
disk=$(df | head -2 | tail -1 | awk '{print $5}')

RED=$(tput setaf 1 2>/dev/null)
textColor=$(tput setaf 6 2>/dev/null)
normal=$(tput sgr0 2>/dev/null)

fieldlist[0]="${textColor}User:${normal} ${user}${normal}"
fieldlist[1]="${textColor}Hostname:${normal} ${hostname}${normal}"
fieldlist[2]="${textColor}Distro:${normal} ${distro}${normal}"
fieldlist[3]="${textColor}Kernel:${normal} ${kernel}${normal}"
fieldlist[4]="${textColor}Uptime:${normal} ${uptime}${normal}"
fieldlist[5]="${textColor}CPU:${normal} ${cpu}${normal}"
fieldlist[6]="${textColor}Memory:${normal} ${ram}${normal}"
fieldlist[7]="${textColor}Disk:${normal} ${disk}${normal}"
fieldlist[8]="${textColor}Battery:${normal} ${battery}${normal}"
fieldlist[9]="${textColor}Date:${normal} $(date)${normal}"

echo -e "
    ${RED#} °°°°°°°     °°°°   ${fieldlist[0]}    ${fieldlist[1]}
    ${RED#} °°°°°°°°    °°°°   ${fieldlist[2]}    ${fieldlist[3]}
    ${RED#} °°°° °°°°   °°°°   ${fieldlist[4]}
    ${RED#} °°°°  °°°°  °°°°   ${fieldlist[5]}
    ${RED#} °°°°   °°°° °°°°   ${fieldlist[6]}
    ${RED#} °°°°    °°°°°°°°   ${fieldlist[7]}
    ${RED#} °°°°     °°°°°°°   ${fieldlist[8]}    ${fieldlist[9]} ${normal}
"
