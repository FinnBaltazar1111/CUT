#!/bin/bash

red="\x1b[31m"
green="\x1b[32m"
purple="\x1b[35m"
white="\x1b[37m"

echo -e "$purple"
echo " ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░ "
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░     "
echo "░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░     "
echo "░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░     "
echo "░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░     "
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░     "   
echo " ░▒▓██████▓▒░ ░▒▓██████▓▒░   ░▒▓█▓▒░     "
echo
echo "ChromeOS Unenrollment Toolkit"
echo "Made by Rosa Green"
echo "See credits for full author list"
echo -e "$white"
echo "i - hardware/software info"
echo "p - payloads"
echo "u - utilities"
echo "b - bash"
echo "c - credits"
echo "r - reboot"

read res
case res in
  "i")
    hw_info
    ;;
  "p")
    payloads
    ;;
  "u")
    utilities
    ;;
  "b")
    bash
    ;;
  "c")
    credits
    ;;
  "r")
    reboot
    ;;
  *)
    echo "Invalid selection"
    ;;
esac

