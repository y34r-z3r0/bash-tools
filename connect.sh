#!/bin/bash

echo "List of available hosts:"
echo "[1] hostname_one"
echo "[2] hostname_two"

while true; do
read -p "Connect to host number: " host
if [ -z $host ]; then
    continue
elif [ $host = "1" ]; then
    read -p "Are you connected to VPN? [y/n]: " vpn
        if  [ -z $vpn ]; then
            continue
        elif [ $vpn = "y" ]; then
            ssh hostname_one
            break
        else
            continue
        fi
elif [ $host = "2" ]; then
    read -p "default user [y/n]: " question
    if [ $question = "n" ]; then
        read -p "username: " user
        ssh $user@hostname_two
    break
    elif [ $question = "y" ]; then
        ssh hostname_two
	break
    else
	continue
    fi
else
    continue
fi
done
