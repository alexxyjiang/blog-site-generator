#!/bin/sh
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <alpine_version> <current_platform> <target_platforms>"
  echo "e.g. $0 3.20 x86_64 x86_64,aarch64"
  exit 1
fi

ALPINE_VERSION="${1}"
CURRENT_PLATFORM="${2}"
TARGET_PLATFORMS="${3}"
if [ ! -d aports ]; then
  git clone --depth 1 --branch "${ALPINE_VERSION}-stable" https://github.com/alpinelinux/aports
  # TODO: special patches for fakeroot, remove when fixed in future
  cp .main.fakeroot.APKBUILD aports/main/fakeroot/APKBUILD && rm .main.fakeroot.APKBUILD
fi
for platform in $(echo ${TARGET_PLATFORMS} | sed 's/,/ /g'); do
  if [ "${platform}" != "${CURRENT_PLATFORM}" ]; then
    echo "==== Cross platform support for ${platform} building ===="
    ./aports/scripts/bootstrap.sh ${platform} || exit 1
    echo "==== Cross platform support for ${platform} done ===="
  fi
done
