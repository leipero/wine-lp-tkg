#!/bin/bash
fsht='_proton_fs_hack="true"'
fshst=$(echo $(cat customization.cfg | grep ^_proton_fs_hack=))

cd pkg/wine*/opt
wineversrc=$(ls | grep wine* | sed 's/^[^:]*-//g')

if [ "$fshst" = "$fsht" ]; then
    winever=lutris-tkg-fshack-$(echo ${wineversrc%.*}-x86_64)
else
    winever=lutris-tkg-$(echo ${wineversrc%.*}-x86_64)
fi

mv wine* $winever
rm -rf $winever/include
tar cf - $winever/ | xz -z -T0 - > $winever.tar.xz
mv $winever.tar.xz ~/
