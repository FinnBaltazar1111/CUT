#!/bin/sh

. usr/local/CUT/common.sh

docs () {
  run=true
  while $run
  do
    clear
    logo
    echo -e "${green} Collection of documentation and guides on how to use the various payloads included in CUT. ${white}"
    echo "c - Basic ChromeOS hacking terminology"
    echo "p - Payloads"
    echo "u - Utilities"
    echo "b - Back"
    read sel
    case $sel in
      "c") print_doc "terminology";;
      "p") payloads;;
      "u") utils;;
      "b") run=false;;
      *)
        echo "Invalid selection!"
        read a
        ;;
    esac
  done
}


