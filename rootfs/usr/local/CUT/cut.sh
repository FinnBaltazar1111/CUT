#!/bin/bash

. usr/local/CUT/common.sh
. usr/local/CUT/hwinfo.sh
. usr/local/CUT/utilities.sh
. usr/local/CUT/payloads.sh
. usr/local/CUT/credits.sh
while true; do
  clear
  logo

  echo "i - hardware/software info"
  echo "p - payloads"
  echo "u - utilities"
  echo "b - bash"
  echo "c - credits"
  echo "r - reboot"

  read res
  clear
  case $res in
    "i")
      hw_info
      ;;
    "p")
      payloads
      ;;
    "u")
      utilities
      ;;
    "b")
      bash
      ;;
    "c")
      credits
      ;;
    "r")
      reboot
      ;;
    *)
      echo "Invalid selection"
      read
      ;;
  esac
done
