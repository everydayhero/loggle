# Loggle

Replace STDOUT logs with file logging

## Assumptions

- you will pass the location of a log file
- apps set their app name and process type as environment
    variables

## Use

Ensure a loggle volume container is running on each node:

    docker run \
      --detach \
      --name="loggle-base" \
      --volume /loggle:/loggle \
      loggle

Preface your docker commands with /loggle/wrap.sh:

    docker run \
        ... \
        /serve

    <VAST QUANTITIES OF DATA>

    docker run \
      ...
      --env PLAIN_APP_NAME=<app-name> \
      --env PLAIN_PROCESS_TYPE=<process-type> \
      --env PLAIN_LOG_FILE=/dev/stdout \
      --volumes-from loggle-base \
      --volume /loggle:/loggle \
      /loggle/wrap.sh ./web

    <BLISSFUL SILENCE>


Profit?
