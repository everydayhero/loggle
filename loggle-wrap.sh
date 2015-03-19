#!/bin/sh

process_type="${PLAIN_PROCESS_TYPE}"
app_name="${PLAIN_APP_NAME}"
docker_container="`hostname`"

syslog_server="$SYSLOG_PORT_5140_UDP_ADDR"
syslog_port="$SYSLOG_PORT_5140_UDP_PORT"

log_tag="${app_name}[${process_type}.${docker_container}]"

if [ x"$syslog_server" = x ]; then
  "$@" | logger -t "$log_tag"
else
  "$@" | logger --udp -n "$syslog_server" -P "$syslog_port" -t "$log_tag"
fi
