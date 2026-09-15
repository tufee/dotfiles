#!/usr/bin/env bash

ip -4 -o addr show dev snwl_ssltunnel 2>/dev/null |
    awk 'NR == 1 { sub(/\/.*/, "", $4); print "VPN " $4; found = 1 }
         END { if (!found) print "VPN desconectada" }'
