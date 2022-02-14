#!/bin/bash

git clone https://github.com/Frogging-Family/wine-tkg-git.git

cd wine-tkg-git/wine-tkg-git
rm *.pkg.tar.xz > /dev/null 2>&1

CFG="customization.cfg"
ADVCFG="wine-tkg-profiles/advanced-customization.cfg"

sed -i -e '/^_EXTERNAL_INSTALL=/c\_EXTERNAL_INSTALL="true"' ${CFG}
sed -i -e '/^_FS_bypass_compositor=/c\_FS_bypass_compositor="true"' ${CFG}
sed -i -e '/^_win10_default=/c\_win10_default="true"' ${CFG}
sed -i -e '/^_staging_pulse_disable=/c\_staging_pulse_disable="true"' ${ADVCFG}

function setenvfshack() {
  sed -i -e '/^_proton_fs_hack=/c\_proton_fs_hack="true"' ${CFG}
  sed -i -e '/^_community_patches=/c\_community_patches="amd_fsr_fshack.mypatch"' ${CFG}
}

function setenvnofshack() {
  sed -i -e '/^_proton_fs_hack=/c\_proton_fs_hack="false"' ${CFG}
}

function pack() {
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
  echo "Compressing lutris build..."
  tar cf - $winever/ | xz -z -T0 - > $winever.tar.xz
  mv $winever.tar.xz ../../../../..
}

read -rp 'Choose staging version (e.g. "7cfceb7" or "v6.0", leave empty for git): ' -e stgver
if [ -z "$stgver" ]; then
  echo "Using git version."
else
  sed -i -e '/^_staging_version=/c\_staging_version="'${stgver}'"' ${CFG}
  echo "Using ${stgver}."
fi

read -rp "Use Valve fshack patch?"$'\n> N/y : ' buildenv
if [[ "$buildenv" =~ [yY] ]]; then
  setenvfshack
else
  setenvnofshack
fi

makepkg -s && pack
