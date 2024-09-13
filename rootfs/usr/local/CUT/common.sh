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

check_wp_status () {
  if [ $1 ]; then # TODO: actually check the input
    echo "WP enabled; aborting!"
    return 1
  else
    return 0
  fi
}

check_fwmp_status () { #can't wait to implement this 🫠
  test
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
  clear
  echo -e "${doc_text}"
  read a
}
