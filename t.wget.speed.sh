#!/bin/bash
# 2023-02-11  06:59:04 


    msg=$'parameter :  action   
    Action defination:
        ssd         ========== read file from ssd/LAN 
        ramdisk     ========== read file from ramdisk/LAN 
        hd          ========== read file from hd/LAN 
        clound      ========== read file from clound/WAN
        clound2     ========== read file from clound/WAN
        '
    
###### result LAN #######
# sd card file 55MB/s 
#w_file="http://192.168.3.66/ISO/vmplayer/VMware-Workstation-Full-16.2.4-20089737.x86_64.bundle"

# a8 ramdisk file 55MB/s 
#w_file="http://192.168.3.66/ramdisk/ISO/openwrt/openwrt-sdk-22.03.2-x86-64_gcc-11.2.0_musl.Linux-x86_64.tar.xz"
#w_file="http://192.168.3.66/ramdisk/ISO/openwrt/sdk.off.tgz"

###### result WAN #######


############################## #######

w_file=""

   if [ "$1" = "ssd" ]; then   ############
        echo "using  ssd"
        w_file="http://192.168.3.66/ISO/vmplayer/VMware-Workstation-Full-16.2.4-20089737.x86_64.bundle"
   elif [ "$1" = "ramdisk" ]; then   ############
        echo "using  ramdisk"
        w_file="http://192.168.3.66/ramdisk/ISO/openwrt/sdk.off.tgz"

   elif [ "$1" = "hd" ]; then   ############
        echo "using  hd"
   
   elif [ "$1" = "clound" ]; then   ############
        echo "using  clound"
        w_file="https://downloads.openwrt.org/releases/22.03.2/targets/bcm27xx/bcm2710/openwrt-22.03.2-bcm27xx-bcm2710-rpi-3-ext4-factory.img.gz"
   elif [ "$1" = "clound2" ]; then   ############
        echo "using  clound2"
        w_file="https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.169.tar.xz"
   else
        #w_file=""
        echo "  Help "
        echo "$msg  "
        exit 0
   fi
 

   folder="${w_file%/*}"
   file="${w_file##*/}"

   echo "speed of ${folder}"
   echo "file ${file}"
   echo ""

   cd /tmp
   wget ${w_file}
   sleep 1
   file="${w_file##*/}"
   echo ""
   rm ${file}

##############################



