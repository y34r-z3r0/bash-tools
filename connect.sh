#!/bin/bash

echo "List of available hosts:"
echo "[1] host.name.one"
echo "[2] host.name.two"

while true; do
read -p "Connect to host number: " host
if [ -z $host ]; then
    continue
elif [ $host = "1" ]; then
    read -p "Are you connected to VPN? [y/n]: " vpn
        if  [ -z $vpn ]; then
            continue
        elif [ $vpn = "y" ]; then
            ssh host.name.one
            break
        else
            continue
        fi
elif [ $host = "2" ]; then
    ssh host.name.two
    break
else
    continue
fi
done