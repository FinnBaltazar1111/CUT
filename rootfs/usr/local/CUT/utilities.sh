#!/bin/sh

. usr/local/CUT/common.sh

utilities () {
  local run=true
  while $run; do
    clear
    logo
    wp_status=$(flashrom --wp-status -p host)
    echo -e "$green All of these utilities require WP to be disabled$white"
    echo -e "$red Current WP status: $wp_status $white"
    echo "s - Set GBB flags"
    echo "f - Remove FWMP (requires boot from dev mode)"
    echo "s - Set FWMP flags (requires boot from dev mode)"
    echo "k - Set kernver"
    echo "w - Connect to a WPA wireless network"
    echo "b - Back"

    read sel

    case $sel in
      "s") set_gbb_flags;;
      "f") clear_fwmp;;
      "s") set_fwmp_flags;;
      "k") set_kernver 0x000000;;
      "w") connect_wireless;;
      "b") run=false;;
      *)
        echo "Invalid selection!"
        read a
    esac
  done
}
