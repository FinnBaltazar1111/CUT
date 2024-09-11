#!/bin/sh

. usr/local/CUT/common.sh

utilities () {
  local run=true
  while $run; do
    clear
    logo
    echo -e "$green All of these utilities require WP to be disabled$white"
    echo -e "$red Current WP status: $(flashrom --wp-status -p host) $white"
    echo "s - Set GBB flags"
    echo "f - Remove FWMP"
    echo "s - Set FWMP flags"
    echo "k - Set kernver"
    echo "b - Back"

    read sel

    case $sel in
      "s")
        read -p "GBB flags to set: " flags
        set_gbb_flags.sh $flags
        read a
        ;;
      "f")
        crypthome --remove-firmware-management-parameters
        read a
        ;;
      "s")
        read -p "FWMP flags to set: " flags
        crypthome --action=set_firmware_management_parameters --flags=$flags
        read a
        ;;
      "k")
        read -p "Kernel version to set: " kver
        set_kver.sh $kver
        read a
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
