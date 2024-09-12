#!/bin/sh
red="\e[31m"
green="\e[32m"
purple="\e[35m"
white="\e[37m"

logo () {
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
}

check_wp_status () {
  if [ $1 ]; then
    echo "WP enabled; aborting!"
    return 1
  else
    return 0
  fi
}
