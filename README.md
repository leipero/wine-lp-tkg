# wine-lp-tkg
Personal wine-tkg builds for Lutris. Nothing special about it, based on wine-staging. Fshack version with AMD FSR community patch.

## Install
Extract release to ~/.local/share/lutris/runners/wine/

## Build
Use wine-tkg build system:
```
git clone https://github.com/Frogging-Family/wine-tkg-git.git
```

Copy and replace customization.cfg from here into cloned directory, answer Y to AMD FSR patch question for fshack version to get that build. Or edit your customization.cfg accordingly.

To get exact builds copy pack.sh in the same directory where customization.cfg is copied and run build process with (resulting .tar.xz in $HOME directory):
```
makepkg -s && ./pack.sh
```

## Builds
- lutris-tkg-fshack
- lutris-tkg (useful for gallium nine and some funky games/apps)

## Sources
https://github.com/Frogging-Family/wine-tkg-git
