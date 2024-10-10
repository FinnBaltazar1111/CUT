#!/bin/sh

. usr/local/CUT/common.sh

set_kernver() {
  echo "02  4c 57 52 47  0 0 0 0  0 0 0  e8" | tpm2_nvwrite 0x1008
  read a
}
