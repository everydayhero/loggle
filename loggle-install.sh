#!/bin/sh

set -e

mkdir -p /loggle
cp -v /opt/loggle/loggle-wrap.sh /loggle/wrap.sh
cp -v /opt/loggle/jq /loggle/jq
chmod +x /loggle/jq
echo "loggle -- ready to log(gle)"
