#!/bin/sh

. usr/local/CUT/common.sh

set_gbb_flags () {
  if [ ! $(check_wp_status "${wp_status}") ]; then
    read -p "GBB flags to set: " flags
    set_gbb_flags.sh $flags
  fi
  read a
}
