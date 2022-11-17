#!/bin/sh
set -e

cd /root/telnet-iot-honeypot
bash -c "python backend.py &" && sleep 5

exec "$@"
