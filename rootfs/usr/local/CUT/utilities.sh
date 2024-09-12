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
      "s")
        if [ ! $(check_wp_status "${wp_status}") ]; then
          read -p "GBB flags to set: " flags
          set_gbb_flags.sh $flags
        fi
        read a
        ;;
      "f")
        # Also check if it's booted through dev mode instead of os_verif=0, otherwise the TPM won't allow for it
        crypthome --remove-firmware-management-parameters # Replace with custom FWMP script
        read a
        ;;
      "s")
        read -p "FWMP flags to set: " flags
        crypthome --action=set_firmware_management_parameters --flags=$flags # Replace with custom FWMP script 
        read a
        ;;
      "k")
        if [ ! $(check_wp_status "${wp_status}") ]; then
          read -p "Kernel version to set: " kver
          set_kver.sh $kver
        fi
        read a
        ;;
      "w")
        read -p "Network name: " name
        read -p "Network password (echo is ON): " passwd
        wpa_supplicant -Dnl80211 
      "b")
        run=false
        ;;
      *)
        echo "Invalid selection!"
        read a
    esac
  done
}
