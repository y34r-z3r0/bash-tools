#!/bin/bash

echo "List of available hosts:"
echo "[1] hostname.one"
echo "[2] hostname.two"

while true; do
read -p "Connect to host number: " host
if [ -z $host ]; then
    continue
elif [ $host = "1" ]; then
    read -p "Are you connected to VPN? [y/n]: " vpn
        if  [ -z $vpn ]; then
            continue
        elif [ $vpn = "y" ]; then
            ssh hostname.one
            break
        else
            continue
        fi
elif [ $host = "2" ]; then
    read -p "default user [y/n]: " getUser
    if [ $getUser = "n" ]; then
        read -p "username: " user
        ssh $user@hostname.two
    break
    elif [ $question = "y" ]; then
        ssh hostname.two
	break
    else
	continue
    fi
else
    continue
fi
done
