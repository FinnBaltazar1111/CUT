#!/bin/sh
red=$(printf "\x1B[31m")
green=$(printf "\x1B[32m")
purple=$(printf "\x1B[35m")
white=$(printf "\x1B[37m")
bold=$(printf "\x1B[1m")
unbold=$(printf "\x1B[22m")
italic=$(printf "\x1B[3m")
unitalic=$(printf "\x1B[23m")
underline=$(printf "\x1B[4m")
nounderline=$(printf "\x1B[24m")

logo () {
  echo "$purple"
  cat << EOF
             ______ __  __ ______
|========/  / ____// / / //_  __/  /=====| 
|=======/  / /    / / / /  / /    /======|
|======/  / /___ / /_/ /  / /    /=======|
|=====/   \____/ \____/  /_/    /========|

------------------------------------------
EOF
  echo "$white $bold"
  echo "     ChromeOS Unenrollment Toolkit"
  echo "$unbold"
}

get_wp_status () {
  status=$(flashrom --wp-status 2>&1 | grep -o "Protection mode: hardware")
  if [ "$status" = "Protection mode: hardware" ]; then
    echo 1
  else
    echo 0
  fi
}

check_wp_status () {
  if [ get_wp_status ]; then 
    echo "WP enabled; aborting!"
    return 1
  else
    return 0
  fi
}

check_fwmp_status () { #can't wait to implement this 🫠
  test
}

status () {
  echo "${bold}$1${unbold}"
}

print_doc () {
  doc=$1
  doc_text=$(cat "usr/local/CUT/docs/${doc}.txt")
  doc_text=$(echo "${doc_text}" | sed "s/\[GREEN\]/${green}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[RED\]/${red}]/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[PURPLE\]/${purple}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[WHITE\]/${white}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[BOLD\]/${bold}]/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[UNBOLD\]/${unbold}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[ITALIC\]/${italic}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[UNITALIC\]/${unitalic}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[UNDERLINE\]/${underline}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[NOUNDERLINE\]/${nounderline}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[SECTION\]/${bold}${underline}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[UNSECTION\]/${unbold}${nounderline}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[TITLE]\]/# ${bold}${underline}${green}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[UNTITLE\]/${unbold}${nounderline}${white}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[DESC]\]/${bold}${underline}${green}/g")
  doc_text=$(echo "${doc_text}" | sed "s/\[UNDESC]\]/${unbold}${nounderline}${ungreen}/g")
  clear
  echo "${doc_text}" | less
}

