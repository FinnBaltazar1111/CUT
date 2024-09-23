#!/bin/sh

. usr/local/CUT/common.sh

payloads () {
  local run=true
  while $run; do
    clear
    logo 
    echo "e - Enrollment"
    echo "m - Misc"
    echo "b - Back"
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
        read a
    esac
  done
}

enrollment () {
  local run=true
  while $run; do 
    clear
    logo
    echo "l - Legacy unenrollment (<110)"
    echo "u - Unfog (<114)"
    echo "c - Cryptosmite (<119)"
    echo "a - Caliginosity re-enrollment (Unknown compatibility)"
    echo "p - Pencilmod"
    echo "b - Back"
    read sel
    case $sel in
      "l") usr/local/CUT/payloads/legacy.sh;;
      "u") usr/local/CUT/payloads/unfog.sh;;
      "c") usr/local/CUT/payloads/cryptsmite.sh;;
      "a") usr/local/CUT/payloads/caliginosity.sh;;
      "p") usr/local/CUT/payloads/pencil.sh;;
      "b") run=false;;
      *)
        echo "Invalid selection!"
        read a
    esac
  done
}

misc () {
  local run=true
  while $run; do
    clear
    logo
    echo "k - Kernver rollback (0x000000)"
    echo "c - Clobber-based unenrollment"
    echo "b - Back"
    read sel
    case $sel in
      "k") set_kver.sh 0x000000;;
      "c") clobberblock.sh;;
      "b") run=false;;
      *)
        echo "Invalid selection!"
    esac
    read
  done
}
