# wine-lp-tkg
Personal wine-tkg builds for Lutris. Based on wine-staging, disabled staging PA patchset, Fshack version with AMD FSR community patch.

## Install
Extract release to ~/.local/share/lutris/runners/wine/

## Build
Using wine-tkg build system, just run the build script:
```
git clone https://github.com/leipero/wine-lp-tkg.git && cd wine-lp-tkg && chmod +x build.sh
./build.sh
```

Choose version to build. Answer Y to AMD FSR patch question for fshack version to get that build.

## Builds
- lutris-tkg-fshack
- lutris-tkg (useful for gallium nine and some funky games/apps)

## WINE TKG Build System
https://github.com/Frogging-Family/wine-tkg-git
