#!/usr/bin/env bash
# Probe: log the identity variables of each startup (SUPPORT-2731). No secrets.
line="$(date -u +%H:%M:%S) mode=${AIR_STARTUP_MODE:-unset} FLEET_WORKSPACE_AGENT_SESSION_ID=${FLEET_WORKSPACE_AGENT_SESSION_ID:-unset} AIR_TASK_ID=${AIR_TASK_ID:-unset} host=$(hostname)"
echo "[probe] $line"
echo "[probe] var names: $(env | cut -d= -f1 | grep -E '^(AIR|FLEET|ORCA|JCP|AGENT)' | sort | tr '\n' ' ')"
echo "$line" >> /tmp/probe-env.log
echo "$line" >> "$HOME/probe-env.log"
exit 0
