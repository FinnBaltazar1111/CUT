#!/bin/sh

. usr/local/CUT/common.sh

pencilloop () {
  echo "${red}${bold}DO NOT TOUCH YOUR FLASH CHIP WHILE DOING THIS"
  echo "DOING SO HAS A HIGH LIKELYHOOD OF DESTROYING YOUR CHIP, RENDEDRING YOUR SYSTEM UNUSABLE${white}"
  echo "Press ctrl+c at any time to cancel${unbold}"
  while :; do 
    if ! [ $(flashrom --wp-disable | grep -o "Failed to apply new WP settings" ) ]; then
			  echo "${green}${bold}Your WP was successfully disabled; you can now utilize the following payloads: ${white}${unbold}"
			  echo "- Legacy unenrollment"
			  echo "- Mr. Chromebox firmware utility script"
			  return
	  fi
	  echo "${red}WP disable FAILED${white}"
  done
}
