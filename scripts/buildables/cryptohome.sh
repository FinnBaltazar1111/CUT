#!/bin/sh
if [ ! -d "${2}/cryptohome-repo" ]; then
  git clone https://chromium.googlesource.com/chromiumos/platform/cryptohome cryptohome-repo
fi
cd cryptohome-repo
make
