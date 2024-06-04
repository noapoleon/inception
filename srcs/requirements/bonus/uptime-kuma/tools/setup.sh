#!/usr/bin/env bash

# Only configure first time
if [ ! -e "/app/data/kuma.db" ]; then
	# Start server temporarily to configure monitors
	printf "Starting Uptime Kuma temporarily..."
	node /app/server/server.js &
	serverPID=$!
	printf "Uptime Kuma started with PID $serverPID"
	sleep 10 # bad method, find fix for that, maybe api call?
	printf "Configuring Uptime Kuma..."
	python3 /config-uptime-kuma.py
	printf "Uptime Kuma configured."
	printf "Stopping Uptime Kuma temp server..."
	kill $serverPID
fi

printf "Starting Uptime Kuma...\n"
exec node /app/server/server.js
