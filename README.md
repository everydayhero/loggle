# Loggle

Replace STDOUT logs with syslog

## Assumptions

- /dev/log in your app container is a syslog socket
- apps set their app name and process type as environment
    variables

## Use

Ensure a loggle volume container is running on each node:

    docker run \
      --detach \
      --name="loggle-base" \
      -v /loggle:/loggle \
      loggle

Preface your docker commands with /loggle/wrap.sh:

    docker run \
        ... \
        /serve

    <VAST QUANTITIES OF DATA>

    docker run \
      ...
      -e PLAIN_APP_NAME=<app-name> \
      -e PLAIN_PROCESS_TYPE=<process-type> \
      --volumes-from loggle-base \
      -v /loggle:/loggle \
      /loggle/wrap.sh /serve

    <BLISSFUL SILENCE>


Profit?
