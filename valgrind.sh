#!/bin/bash
systemctl stop test
rm -rf /run/test
mkdir -p /run/test
chown readsb /run/test
source /etc/default/test
cp -f readsb /tmp/test123

MEM="--show-leak-kinds=all --track-origins=yes --leak-check=full"
MEM=""

sudo -u readsb valgrind $MEM /tmp/test123 $RECEIVER_OPTIONS $DECODER_OPTIONS $NET_OPTIONS $JSON_OPTIONS --quiet --db-file=none $@

