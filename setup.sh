#!/data/data/com.termux/files/usr/bin/bash
R="$(printf '\033[1;31m')"                           
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"
C="$(printf '\033[1;36m')"                                        W="$(printf '\033[1;37m')"

banner() {
clear
printf "\033[33m       █▄▀ ▄▀█ █░░ █   █▀▄▀█ █▀█ █▀▄\033[0m\n"
printf "\033[36m       █░█ █▀█ █▄▄ █   █░▀░█ █▄█ █▄▀ \033[0m\n"
printf "\033[32m   A modded gui of kali\033[0m\n"
printf "\033[32m            Code by @saba_mdarif \033[0m\n"

}

add_distro(){
	banner
	echo -e "${R} [${W}-${R}]${C} Checking required packages..."${W}
    termux-setup-storage
	pkg update -y
	pkg install proot proot-distro -y
touch $PREFIX/etc/proot-distro/kali.sh
cat << EOF >> $PREFIX/etc/proot-distro/kali.sh
# This is a default distribution plug-in.
# Do not modify this file as your changes will be overwritten on next update.
# If you want customize installation, please make a copy.
DISTRO_NAME="Kali Linux (nethunter)"

TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kalifs-arm64-minimal.tar.xz"
TARBALL_SHA256['aarch64']="149e56700374920a25016e228b93d0ce2aa9eccfe76a06436e48697dc70dd342"
TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kalifs-armhf-minimal.tar.xz"
TARBALL_SHA256['arm']="e9117e6464a98e76e19793d44b6f84c836b1781ba6e01125f5292708be9232a0"
TARBALL_URL['i686']="https://kali.download/nethunter-images/current/rootfs/kalifs-i386-minimal.tar.xz"
TARBALL_SHA256['i686']="6ec934ac10e100b84b5f635afa55a869fdc0c537a5b27e448650415c03b65c1a"
TARBALL_URL['x86_64']="https://kali.download/nethunter-images/current/rootfs/kalifs-amd64-minimal.tar.xz"
TARBALL_SHA256['x86_64']="e6b239d709f6e39d468404961a2c241a69ac866ebe49b5dc8cdec4a2be585912"

EOF

}

check_pack() {
	banner
	echo -e "${R} [${W}-${R}]${C} Checking required packages..."${W}
if [[ `command -v pulseaudio` && `command -v proot-distro` && `command -v wget` ]]; then
        echo -e "\n${R} [${W}-${R}]${G} Packages already installed."${W}
    else
        packs=(pulseaudio proot proot-distro wget)
        for hulu in "${packs[@]}"; do
            type -p "$hulu" &>/dev/null || {
                echo -e "\n${R} [${W}-${R}]${G} Installing package : ${Y}$hulu${C}"${W}
                apt update -y
                apt upgrade -y
                apt install "$hulu" -y
            }
        done
    fi

}


install_rootfs() {
	banner
	echo -e "${R} [${W}-${R}]${C} Setting up Environment..."${W}
    if [[ -d "$PREFIX/var/lib/proot-distro/installed-rootfs/kali" ]]; then
        echo -e "\n${R} [${W}-${R}]${G} Distro already installed."${W}
        exit 0
    else
        proot-distro install kali
        termux-reload-settings
    fi

    if [[ -d "$PREFIX/var/lib/proot-distro/installed-rootfs/kali" ]]; then
        echo -e "\n${R} [${W}-${R}]${G} Installed Successfully !!"${W}
    else
        echo -e "\n${R} [${W}-${R}]${G} Error Installing Distro !\n"${W}
        exit 0
    fi
}

add_sound() {
    banner
    echo -e "\n${R} [${W}-${R}]${C} Fixing Sound Problem..."${W}
    if [[ ! -e "$HOME/.sound" ]]; then
        touch $HOME/.sound
    fi

    echo "pulseaudio --start --exit-idle-time=-1" >> $HOME/.sound
    echo "pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" >> $HOME/.sound
    if [[ -e "$PREFIX/var/lib/proot-distro/installed-rootfs/kali /root/gui.sh" ]]; then
        chmod +x $PREFIX/var/lib/proot-distro/installed-rootfs/kali/root/gui.sh
    else
        mv -f /data/data/com.termux/files/home/modded-kali/builder/gui.sh $PREFIX/var/lib/proot-distro/installed-rootfs/kali/root/gui.sh
        chmod +x $PREFIX/var/lib/proot-distro/installed-rootfs/kali/root/gui.sh
    fi

}

notes() {
	echo "proot-distro login kali --bind /dev/null:/proc/sys/kernel/cap_last_last --shared-tmp --fix-low-ports" > $PREFIX/bin/kali
    if [[ -e "$PREFIX/bin/kali" ]]; then
        chmod +x $PREFIX/bin/kali
        termux-reload-settings
	echo -e "\n${R} [${W}-${R}]${G} kali-letest(CLI) is now Installed on your Termux"${W}
        echo -e "\n${R} [${W}-${R}]${G} Type ${C}kali${G} to run kali CLI."${W}
        echo -e "\n${R} [${W}-${R}]${G} If you Want to Use kali in GUI MODE then ,"${W}
        echo -e "\n${R} [${W}-${R}]${G} Run ${C}kali${G} first & then type ${C}bash gui.sh "${W}
        echo -e "\n"
        exit 0
    else
        echo -e "\n${R} [${W}-${R}]${G} Error Installing Distro !"${W}
        exit 0
    fi
}



add_distro
check_pack
install_rootfs
add_sound
notes
