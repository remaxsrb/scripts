#!/bin/bash

# Find and kill the process using port 4000
echo "Finding process using port 4000..."
PID=$(netstat -tulpn | grep :4000 | awk '{print $7}' | cut -d'/' -f1)

if [ -n "$PID" ]; then
  echo "Process found: $PID"
  echo "Killing process $PID..."
  kill -9 $PID
else
  echo "No process found using port 4000."
fi

# Recompile TypeScript code
echo "Recompiling TypeScript code..."
tsc

# Restart the Node.js application
echo "Restarting the Node.js application..."
npm run serve

echo "Done."
