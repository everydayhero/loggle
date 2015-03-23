#!/bin/sh

process_type="${PLAIN_PROCESS_TYPE}"
app_name="${PLAIN_APP_NAME}"
docker_container="`hostname`"

log_tag="${app_name}[${process_type}.${docker_container}]"

if [ x"$syslog_server" = x ]; then
  "$@" | logger -t "$log_tag"
else
  "$@" | logger --udp -n "$SYSLOG_IP" -P "$SYSLOG_PORT" -t "$log_tag"
fi
