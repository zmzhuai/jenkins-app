#!/bin/bash
timeout=$(($(date +%s) + 60))
while [ $(date +%s) -lt $timeout ] && ! curl -s "$1" >/dev/null; do
    logger "Jenkins is not responding yet, sleeping..."
    sleep 1
done
logger "Not waiting any longer"
curl -s "$1" >/dev/null