#!/data/data/com.termux/files/usr/bin/bash

R="$(printf '\033[1;31m')"                                        
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[1;37m')"

banner() {
clear
printf "\033[33m       █▄▀ ▄▀█ █░░ █   █▀▄▀█ █▀█ █▀▄\033[0m\n"
printf "\033[36m       █░█ █▀█ █▄▄ █   █░▀░█ █▄█ █▄▀ \033[0m\n"
printf "\033[32m code by @saba_mdrif \033[0m\n"
printf "\033[32m subscribe my YouTube Channel Hello Android \033[0m\n"

}

remove() {
    echo -e "${R} [${W}-${R}]${C} Purging packages..."${W}
    if [[ -d "$PREFIX/var/lib/proot-distro/installed-rootfs/kali" ]]; then
        proot-distro remove kali && proot-distro clear-cache
    rm -rf $PREFIX/bin/kali
    cd ~
    rm .sound
    rm -rf /data/data/com.termux/files/usr/bin/kali
    rm -rf $PREFIX/var/lib/proot-distro/installed-rootfs/kali
    rm $PREFIX/etc/proot-distro/kali.sh
        exit 0
    fi
}

banner
remove
