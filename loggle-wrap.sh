#!/bin/sh

docker_container_id="`cat /proc/self/cgroup |grep cpu: | cut -f 3- -d/ | cut -b 1-12`"
process_type="${PLAIN_PROCESS_TYPE}"
app_name="${PLAIN_APP_NAME}"
log_file="${PLAIN_LOG_FILE}"

log_prefix="${app_name}[${process_type}.${docker_container_id}]"

loggle() {
  sed -e "s/^/${log_prefix} /"
}

"$@" | loggle > "${log_file}"
