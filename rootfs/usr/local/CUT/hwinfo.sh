#!/bin/bash
mount -o ro /dev/mmcblk0p3 /mnt
rootfs1ver=$(cat /mnt/etc/os-release | sed -n '7p' | grep -o "[0-9]*")
umount /mnt

mount -o ro /dev/mmcblk0p5 /mnt
rootfs2ver=$(cat /mnt/etc/os-release | sed -n '7p' | grep -o "[0-9]*")
umount /mnt

device_path=/sys/class/dmi/id/
clear
echo -e "${green}Hardware/software information${white}"
echo "Board type: $(cat $device_path/product_family)"
echo "Device codename: $(cat $device_path/board_name)"
echo "Firmware version: $(cat $device_path/bios_version)"
echo "Firmware date: $(cat $device_path/bios_date)"
echo "Board revision: $(cat $device_path/board_version)"
echo
echo "ChromeOS rootfs A (/dev/mmcblk0p3) version: ${rootfs1ver}" 
echo "ChromeOS rootfs B (/dev/mmcblk0p5) version: ${rootfs2ver}" 
