#!/bin/bash

# Build de Busybox et du noyau Linux pour créer une image minimale QEMU

# Le répertoire de travail est configurable ici. Par défaut il est hors du git
STAGE=$HOME/pl
TOP=$STAGE/petit-linux

if [ ! -f $STAGE ]; then
   mkdir -p $STAGE
fi

cd $STAGE
if [ ! -f $TOP ]; then
   mkdir -p $TOP
fi

# Importer sources Busybox et Kernel
cd $STAGE
curl https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.10.6.tar.xz | tar xJf -
curl https://busybox.net/downloads/busybox-1.33.0.tar.bz2 | tar xjf -

cd $STAGE/busybox-1.33.0

# Crée userland
mkdir -pv $TOP/obj/busybox-x86
make O=$TOP/obj/busybox-x86 defconfig
make O=$TOP/obj/busybox-x86 menuconfig

cd $TOP/obj/busybox-x86
make -j2
make install

