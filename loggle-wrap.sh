#!/bin/sh

container_id="$(cat /proc/self/cgroup |grep cpu: | cut -f 3- -d/ | cut -b 1-12)"
process_type="${PLAIN_PROCESS_TYPE}"
app_name="${PLAIN_APP_NAME}"
log_file="${PLAIN_LOG_FILE}"

loggle() {
  cat | ./loggle/jq \
    --arg container_id "${container_id}" \
    --arg app_name "${app_name}" \
    --arg process_type "${process_type}" \
    --arg timestamp "$(date --utc +%FT%TZ)" \
    --compact-output \
    '{"timestamp":"\($timestamp)","container_id":"\($container_id)","app_name":"\($app_name)","process_type":"\($process_type)","payload":.}'
}

"$@" | loggle > "${log_file}"
