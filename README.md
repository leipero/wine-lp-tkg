# wine-lp-tkg
Personal wine-tkg builds for Lutris. Nothing special about it, built without mfpat and pulse patchsets. Fshack version with AMD FSR community patch, enabled FUTEX2 futex_waitv support.

## Install
Extract release to ~/.local/share/lutris/runners/wine/

## Build
Use wine-tkg build system
```
git clone https://github.com/Frogging-Family/wine-tkg-git.git
```

Copy and replace customization.cfg from here into cloned directory, answer N (or press enter) for reverts questions, andswer Y for AMD FSR patch for fshack version to get those builds compiled. Or edit your customization.cfg accordingly.

## BUILDS
- lutris-tkg-fshack
- lutris-tkg-nofshack (useful for gallium nine and some funky games/apps)

## Sources
https://github.com/Frogging-Family/wine-tkg-git
