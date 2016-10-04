#!/bin/bash
ironic node-list | awk '$0 ~ /available/ {print $2, $4}' | while read -a NODE; do ironic node-update ${NODE[0]} replace properties/capabilities='node:'${NODE[1]}',boot_option:local'; done

