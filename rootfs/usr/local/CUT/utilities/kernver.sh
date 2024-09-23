#!/bin/sh

. usr/local/CUT/common.sh

set_kernver() {
  if [ ! $(check_wp_status "${wp_status}") ]; then
      read -p "Kernel version to set: " kver
      set_kver.sh $kver
  fi
  read a
}
