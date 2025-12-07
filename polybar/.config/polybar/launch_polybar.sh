#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit || true
# Or, if you prefer the hard kill:
# killall -q polybar || true

# Small delay so X/monitors are ready (sometimes helps on login)
sleep 0.5

# Log file
LOGFILE=/tmp/toph.log

echo "--- $(date)" | tee -a "$LOGFILE"
polybar toph 2>&1 | tee -a "$LOGFILE" &
