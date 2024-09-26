#!/bin/sh

. usr/local/CUT/common.sh

docs () {
  run=true
  while $run
  do
    clear
    logo
    echo "${purple}Documentation${white}"
    echo "${green}Collection of documentation of systems and guides on how to use the various payloads included in CUT.${white}"
    sel=$(
      selectorLoop 1 \
        "ChromeOS systems" \
        "Payloads" \
        "Utilities" 
    )
    case $sel in
      1) systems;;
      2) payloads;;
      3) utils;;
      *) run=false
    esac
  done
}

systems () {
  run=true
  while $run
  do
    clear
    logo
    echo "${purple}Documentation - ChromeOS systems${white}"
    echo "${green}Documentation on the various systems utilized in ChromeOS${white}"
    echo "s - Startpage"
    echo "f - FWMP"
    read a
  done
}


