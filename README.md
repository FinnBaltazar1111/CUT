# CUT 
#### ChromeOS Unenrollment Toolkit
An Alpine-based miniroot system designed to run ChromeOS exploits, utilizing the RMA shim rootfs verification exploit.

## Features
- Minimal rootfs - 25mb rootfs, compared to SH1MMER's 200mb, making it load much faster on slow USB drives.
- Proper wireless support - Comes with a utility to connect to networks using WPA_supplicant, allowing for previously-impossible payloads such as the full Mr. Chromebox firmware utility.
- Failsafes - Only permits you to run payloads when their conditions are met (no csmite on 119+, for example)
- More payload auditing - Doesn't allow joke payloads like the infamous troll.sh SH1MMER payload to be merged.
- More fine-grained control - Along with the typical non-interactive payloads, there are also utilities for actions that require user input, such as setting specific GBB flags.
- More cohesive - All modules are organized into their proper catagories, and all ChromeOS requirements are documented 
- Multishim support - One board not enough for you? Try a few more.
- System information - Ships with a very in-depth system information utility that shows everything recovery mode does, and more. See GBB flags, VPD settings, FWMP status, ChromeOS version, etc.

## Payloads
The following payloads are included in the current build; PRs are welcome, but it has to be useful.
### Enrollment
- Legacy unenrollment
- Defog
- Cryptosmite
- Caliginosity
### Update blocking
- Clobber-based update blocker
- Stateful-based update blocker
### Misc
- Mr. Chromebox firmware utility script (requires internet connection)
- Pencilmod WP disable loop
- Kernver rollback

## Building
CUT uses modified versions of the [Shimboot](https://github.com/ading2210/shimboot) build scripts, and as such building is similar.
To build a complete image, use `doas ./build_complete.sh <board>`
To build the rootfs, `doas ./build_rootfs.sh`
