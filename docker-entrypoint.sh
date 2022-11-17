#!/bin/sh
set -e

cd /root/telnet-iot-honeypot
echo "==> Starting backend server..."
echo ""
bash -c "python backend.py &" && sleep 5
echo ""
echo "==> Starting http server..."
echo ""
bash -c "lighttpd -f /etc/lighttpd/lighttpd.conf"

exec "$@"
