#!/bin/sh

# I include all of these so I get syntax errors when the script starts, rather than having to hunt around for them
. usr/local/CUT/common.sh
. usr/local/CUT/hwinfo.sh
. usr/local/CUT/utilities.sh
. usr/local/CUT/payloads.sh
. usr/local/CUT/credits.sh
. usr/local/CUT/docs.sh

while true; do
  clear
  logo

  echo "i - Hardware/software info"
  echo "p - Payloads"
  echo "u - Utilities"
  echo "d - Documentation"
  echo 
  echo "c - Credits"
  echo "s - Shell"
  echo "r - Reboot"

  read res
  case $res in
    "i") hw_info;;
    "p") payloads;;
    "u") utilities;;
    "d") docs;;
    "s") sh;;
    "c") credits;;
    "r") reboot;;
    *)
      echo "Invalid selection!"
      read a
      ;;
  esac
done
