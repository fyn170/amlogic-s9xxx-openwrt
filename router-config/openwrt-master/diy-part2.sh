#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' ./feeds/luci/collections/luci/Makefile

# change ssid
sed -i "s/OpenWrt/REYRE-STBx/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i "s/iw /ipconfig /g" package/kernel/mac80211/files/lib/netifd/wireless/mac80211.sh

# change hostname
sed -i "s/OpenWrt/REYRE-STB/g" package/base-files/files/bin/config_generate

svn co https://github.com/rayhanbone/ROOterSource2102/trunk/package/rooter/ext-rooter-basic package/ext-rooter-basic
#rm -rf package/rmbim/.svn 2>/dev/null
#svn co https://github.com/rayhanbone/ROOterSource2102/trunk/package/rooter/0drivers/rqmi package/rqmi
#svn co https://github.com/rayhanbone/ROOterSource2102/trunk/package/rooter/0basicsupport/ext-buttons package/ext-buttons
#svn co https://github.com/rayhanbone/ROOterSource2102/trunk/package/rooter/0basicsupport/ext-sms package/ext-sms
#svn co https://github.com/rayhanbone/ROOterSource2102/trunk/package/rooter-builds/0protocols/luci-proto-3x package/luci-proto-3x
# ------------------------------- Main source ends -------------------------------
svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/openwrt-passwall
svn co https://github.com/tianiue/luci-app-passwall/trunk package/luci-app-passwall
# ------------------------------- Main source ends -------------------------------
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/brook
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/chinadns-ng
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/dns2socks
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/hysteria
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/ipt2socks
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/microsocks
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/naiveproxy
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/pdnsd-alt
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/shadowsocks-rust
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/shadowsocksr-libev
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/simple-obfs
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/ssocks
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/tcping
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/trojan-go
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/trojan-plus
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/trojan
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/v2ray-core
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/v2ray-geodata
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/v2ray-plugin
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/xray-core
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk packages/xray-plugin
# ------------------------------- Main source ends -------------------------------

svn co https://github.com/r3yr3/helmiwrt-packages/trunk/badvpn package/badvpn
svn co https://github.com/r3yr3/helmiwrt-packages/trunk/corkscrew package/corkscrew

# Add p7zip
svn co https://github.com/hubutui/p7zip-lede/trunk package/lean/p7zip

# Add luci-app-3ginfo-lite
svn co https://github.com/4IceG/luci-app-3ginfo-lite/trunk package/luci-app-3ginfo-lite

# Intel XMM 7650 LTE-A Pro modem.
svn co https://github.com/koshev-msk/xmm-modem/trunk package/xmm-modem

# A Qos luci app filter device by MAC address
svn co https://github.com/WROIATE/luci-app-mqos/trunk package/luci-app-mqos

# luci-app-modeminfo
svn co https://github.com/koshev-msk/luci-app-modeminfo/trunk package/luci-app-modeminfo

# luci-app-smstools3 
svn co https://github.com/koshev-msk/luci-app-smstools3/trunk package/luci-app-smstools3

# luci-app-mqos
svn co https://github.com/WROIATE/luci-app-mqos/trunk package/luci-app-mqos

# luci-app-kodexplorer
# svn co https://github.com/jlzsss/luci-app-kodexplorer/trunk package/luci-app-kodexplorer

# luci-app-atinout-mod
svn co https://github.com/4IceG/luci-app-atinout-mod/trunk package/luci-app-atinout-mod

svn co https://github.com/brvphoenix/luci-app-wrtbwmon/trunk/luci-app-wrtbwmon package/luci-app-wrtbwmon
svn co https://github.com/brvphoenix/wrtbwmon/trunk/wrtbwmon package/wrtbwmon

# ------------------------------- Other started -------------------------------
#
# Add luci-app-passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/openwrt-passwall
# rm -rf package/openwrt-passwall/{kcptun,xray-core} 2>/dev/null

# Add luci-app-openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/openwrt-openclash
pushd package/openwrt-openclash/tools/po2lmo && make && sudo make install 2>/dev/null && popd

# Add luci-app-ssr-plus
# svn co https://github.com/fw876/helloworld/trunk/{luci-app-ssr-plus,shadowsocksr-libev} package/openwrt-ssrplus
# rm -rf package/openwrt-ssrplus/luci-app-ssr-plus/po/zh_Hans 2>/dev/null

# Add luci-app-rclone
# svn co https://github.com/ElonH/Rclone-OpenWrt/trunk package/openWrt-rclone

# Add luci-app-diskman
svn co https://github.com/lisaac/luci-app-diskman/trunk/applications/luci-app-diskman package/openwrt-diskman/luci-app-diskman
# wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -q -P package/openwrt-diskman/parted
# pushd package/openwrt-diskman/parted && mv -f Parted.Makefile Makefile 2>/dev/null && popd

# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/depends/luci-lib-fs package/luci-lib-fs

# Apply patch
# git apply ../router-config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------

