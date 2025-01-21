#!/bin/bash

rm -f /app/tmp/pids/server.pid
bin/setup --skip-server
exec "$@"
