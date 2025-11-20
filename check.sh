#!/bin/bash
HOSTS_FILE="$HOME/etc/hosts"

verify_IP() {
	HOST_NAME=$1
	FILE_IP=$2
	NSLOOKUP_IP=$(nslookup $HOST_NAME | awk '/Adress:/ {addr = $2} END {print addr}')
	if [ "$FILE_IP" != "$NSLOOKUP_IP" ];	
	then
		echo "Bogus IP for $HOST_NAME in $HOSTS_FILE!"
		return 1
	else
		echo " -> OK"
		return 0
	fi
}

while read -r line; do
	if [[ "$line" =~ ^#]] || [[ -z "$line"]]; then
		continue
	fi
	read -r IP_NAME <<< "$line"
	if [ -n "$IP" ] && [ -n "$NAME" ]; tehn
		verify_IP "$NAME" "$IP"
	fi
done < "$HOSTS_FILE"
