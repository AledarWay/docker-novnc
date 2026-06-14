#!/bin/bash
set -ex

NOVNC_PORT=${NOVNC_PORT:-8080}
NOVNC_BIND=${NOVNC_BIND:-0.0.0.0}
VNC_SERVER=${VNC_SERVER:-localhost:5900}

case $RUN_FLUXBOX in
  false|no|n|0)
    rm -f /app/conf.d/fluxbox.conf
    ;;
esac

case $RUN_XTERM in
  false|no|n|0)
    rm -f /app/conf.d/xterm.conf
    ;;
esac

sed -i "s|8080 localhost:5900|${NOVNC_BIND}:${NOVNC_PORT} ${VNC_SERVER}|" /app/websockify.conf

exec supervisord -c /app/supervisord.conf