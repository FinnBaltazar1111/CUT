#!/bin/sh

. usr/local/CUT/common.sh

payloads () {
  local run=true
  while $run; do
    clear
    logo 
    echo "e - Enrollment"
    echo "u - Update blockers"
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
    echo "b - Back"
    read sel
    case $sel in
      "l") legacy.sh;;
      "u") unfog.sh;;
      "c") cryptsmite.sh;;
      "a") caliginosity.sh;;
      "b") run=false;;
      *)
        echo "Invalid selection!"
        read a
    esac
  done
}

updates () {
  local run=true
  while $run; do
    clear
    logo
    echo "c - Clobber-based update blocking (all versions)"
    echo "s - Stateful-based update blocking (unknown compatibility)"
    echo "b - Back"
    read sel
    case $sel in
      "s") statefulblock.sh;;
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
    echo "f - Mr. Chromebox firmware utility script (requires internet connection)"
    echo "p - Pencilmod WP disable loop"
    echo "k - Kernver rollback (0x000000)"
    echo "c - Clobber-based unenrollment"
    echo "b - Back"
    read sel
    case $sel in
      "f") fwutil.sh;;
      "p") pencilloop.sh;;
      "k") set_kver.sh 0x000000;;
      "c") clobberblock.sh;;
      "b") run=false;;
      *)
        echo "Invalid selection!"
    esac
    read
  done
}
