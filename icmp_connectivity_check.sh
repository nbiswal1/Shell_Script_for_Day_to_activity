#!/bin/bash

# Script Name: network_connectivity_check.sh
# Purpose: Check whether a host is reachable over the network.

read -rp "Enter a hostname (e.g., google.com): " HOST

network_connectivity() {
    if ping -c 1 "$HOST" &>/dev/null; then
        echo "✅ Network connectivity to $HOST is successful."
    else
        echo "❌ Unable to reach $HOST."
    fi
}

network_connectivity
