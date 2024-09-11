#!/bin/bash
. usr/local/CUT/common.sh
payloads () {
  local run=true
  while $run; do
    clear
    logo 
    echo "e - Enrollment"
    echo "u - Update blockers"
    echo "m - misc"
    echo "b - back"
    read sel
    case $sel in
      "e")
        enrollment
        ;;
      "u")
        updates
        ;;
      "m")
        misc
        ;;
      "b")
        run=false
        ;;
      *)
        echo "Invalid selection!"
        read
    esac
  done
}

enrollment () {
  local run=true
  while $run; do 
    clear
    logo
    echo "l - Legacy unenrollment (<112)"
    echo "u - Unfog (<114)"
    echo "c - Cryptosmite (<119)"
    echo "a - Caliginosity re-enrollment (Unknown compatibility)"
    read sel
    case $sel in
      "l")
        legacy.sh
        ;;
      "u")
        unfog.sh
        ;;
      "c")
        cryptsmite.sh
        ;;
      "a")
        caliginosity.sh
        ;;

}
