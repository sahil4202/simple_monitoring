#!/bin/bash

echo "Generating CPU load..."
# Simulate CPU load using 'stress'
if command -v stress &> /dev/null; then
    stress --cpu 8 --timeout 60s
else
    echo "stress command not found, please install it to generate load"
fi

echo "Load generation complete."
echo "Please check the Netdata dashboard at http://<your-server-ip>:19999 for CPU usage."
