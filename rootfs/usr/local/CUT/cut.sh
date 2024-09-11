#!/bin/sh

. usr/local/CUT/common.sh
. usr/local/CUT/hwinfo.sh
. usr/local/CUT/utilities.sh
. usr/local/CUT/payloads.sh
. usr/local/CUT/credits.sh

while true; do
  clear
  logo

  echo "i - Hardware/software info"
  echo "p - Payloads"
  echo "u - Utilities"
  echo "c - Credits"
  echo "s - Shell"
  echo "r - Reboot"

  read res
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
    "s")
      sh
      ;;
    "c")
      credits
      ;;
    "r")
      reboot
      ;;
    *)
      echo "Invalid selection!"
      read a
      ;;
  esac
done
