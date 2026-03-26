#!/bin/bash
if ! docker info &>/dev/null; then
    exit 0
fi
count=$(docker ps -q 2>/dev/null | wc -l | tr -d ' ')
if [ "$count" -gt 0 ]; then
    echo "#[fg=#7dcfff]󰡨 $count"
fi
