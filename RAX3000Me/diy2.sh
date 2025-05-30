#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Modify default IP
sed -i "s/192.168.1.1/192.168.5.1/g" package/base-files/files/bin/config_generate
sed -i "s/hostname='ImmortalWrt'/hostname='RAX3000Me'/g" package/base-files/files/bin/config_generate
sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION='QiYueYi $(date +"%y%m%d")'/g" package/base-files/files/etc/openwrt_release

wget -O llvm-bpf.tar.zst https://downloads.immortalwrt.org/releases/24.10-SNAPSHOT/targets/mediatek/filogic/llvm-bpf-18.1.7.Linux-x86_64.tar.zst
tar -xvaf llvm-bpf.tar.zst
wget -O toolchain-mediatek-filogic.tar.zst https://downloads.immortalwrt.org/releases/24.10-SNAPSHOT/targets/mediatek/filogic/immortalwrt-toolchain-24.10-SNAPSHOT-mediatek-filogic_gcc-13.3.0_musl.Linux-x86_64.tar.zst
mkdir -p toolchain-mediatek-filogic
tar -xvf toolchain-mediatek-filogic.tar.zst -C toolchain-mediatek-filogic --strip-components=1
./scripts/ext-toolchain.sh --toolchain toolchain-mediatek-filogic/toolchain* --overwrite-config --config mediatek/filogic