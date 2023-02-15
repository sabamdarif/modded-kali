#!/bin/bash

R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
C="$(printf '\033[1;36m')"

banner() {
clear
printf "\033[33m       █▄▀ ▄▀█ █░░ █   █▀▄▀█ █▀█ █▀▄\033[0m\n"
printf "\033[36m       █░█ █▀█ █▄▄ █   █░▀░█ █▄█ █▄▀ \033[0m\n"
printf "\033[32m code by @saba_mdrif \033[0m\n"
printf "\033[32m subscribe my YouTube Channel Hello Android \033[0m\n"

}

firefox_install() {
		clear
		banner
		sleep 1
		echo "${Y}Checking if  Firefox browser installed already.."${W}
		echo
		echo
		if [[ $(command -v firefox) ]]; then
			echo "${C}Firefox is already installed.."${W}
			sleep .5
			clear
		else
			clear
			sleep 1
			echo "${G}Firefox not found.Installing now.."${W}
			echo
			echo
			sudo apt update;sudo apt install firefox-esr -y 
		fi

}
	
vlc_installer() {

	clear
	banner
	echo
	echo "${Y}Checking if vlc is available or not"${W}
	if [[ $(command -v vlc) ]]; then
		echo 
		echo "${G}vlc is already Installed"${W}
		sleep 1
	else
		echo "${G}vlc  is not installed. Installing vlc.."${W}
		echo
		sleep 1
		sudo apt update && sudo apt install vlc -y
	fi

}

select_desktop_type() {
	clear
	banner
	echo
	echo -e "${R} [${W}-${R}]${C} Select Desktop Type"${W}
	echo
	echo "${C}1. XFCE4 (recommended)"${W}
	echo
	echo "${C}2. LXDE"${W}
	echo
	echo "${C}3. LXQT"${W}
	echo
	echo "${C}4. KDE"${W}
	echo
	echo "${C}5. GNOME (buggy)"${W}
	echo
	read -p "Select option(default 1): " select_method
	echo
	sleep 1.5

	if [[ $select_method == "1" ]]; then
		kfce_mode
	fi
	if [[ $select_method == "2" ]]; then
		lxde_mode
	fi
	if [[ $select_method == "3" ]]; then
		lxqt_mode
	fi
	if [[ $select_method == "4" ]]; then
		kde_mode
	fi
	if [[ $select_method == "5" ]]; then
		gnome_mode
	fi
	if [[ $select_method == "" ]]; then
		kfce_mode
	fi
}

kfce_mode() {
	banner
	echo -e "${R} [${W}-${R}]${C} Installing XFCE DESKTOP"${W}
	apt update
       sudo apt install xfce4* kali-themes -y
       banner
       echo -e "${R} [${W}-${R}]${C} Setting up VNC Server..."${W}
  if [[ ! -d "$HOME/.vnc" ]]; then
        mkdir -p "$HOME/.vnc"
    fi
   if [[ -e "/usr/local/bin/vncstart" ]]; then
        rm -rf /usr/local/bin/vncstart
    fi                                                                       
    echo "#!/usr/bin/env bash" >>/usr/local/bin/vncstart
  echo "dbus-launch" >>/usr/local/bin/vncstart
  echo "vncserver -geometry 1500x720  -xstartup /usr/bin/startxfce4" >>/usr/local/bin/vncstart
  chmod +x /usr/local/bin/vncstart
  if [[ -e "/usr/local/bin/vncstop" ]]; then
        rm -rf /usr/local/bin/vncstop
    fi
  echo "#!/usr/bin/env bash" >>/usr/local/bin/vncstop
  echo "vncserver -kill :*" >>/usr/local/bin/vncstop
  echo "rm -rf /username/.vnc/localhost:*.pid" >>/usr/local/bin/vncstop
  echo "rm -rf /tmp/.X1-lock" >>/usr/local/bin/vncstop
  echo "rm -rf /tmp/.X11-unix/X1" >>/usr/local/bin/vncstop
    chmod +x /usr/local/bin/vncstop
  if [[ -e "/usr/local/bin/fixvnc" ]]; then
        rm -rf /usr/local/bin/fixvnc
    fi
  echo "pkill Xtigervnc" >>/usr/local/bin/fixvnc
  echo "LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver :1 -localhost no" >>/usr/local/bin/fixvnc
    chmod +x /usr/local/bin/fixvnc

    echo "export DISPLAY=":1"" >> /etc/profile
    echo "export PULSE_SERVER=127.0.0.1" >> /etc/profile
    source /etc/profile
    cd ~
    wget https://raw.githubusercontent.com/sabamdarif/modded-kali/main/setup/customuze-my-desktop
    mv customuze-my-desktop  /home/${user}/customuze-my-desktop
}

gnome_mode() {
	banner
	echo -e "${R} [${W}-${R}]${C} Installing GNOME DESKTOP"${W}
	apt update
	sudo apt install kali-desktop-gnome -y
	sudo apt-get install gnome-panel gnome-settings-daemon metacity nautilus gnome-tweaks gnome-session-flashback -y
	banner
   echo -e "${R} [${W}-${R}]${C} Setting up VNC Server..."${W}
   sudo apt autoremove tigervnc-standalone-server tigervnc-common tigervnc-tools -y
  if [[ ! -d "$HOME/.vnc" ]]; then
        mkdir -p "$HOME/.vnc"
    fi
   if [[ -e "/usr/local/bin/vncstart" ]]; then
        rm -rf /usr/local/bin/vncstart
    fi                                                                      
    echo "#!/usr/bin/env bash" >>/usr/local/bin/vncstart
  echo "sudo service dbus start" >>/usr/local/bin/vncstart
  echo "vncserver -geometry 1500x720" >>/usr/local/bin/vncstart
    chmod +x /usr/local/bin/vncstart
  if [[ -e "/usr/local/bin/vncstop" ]]; then
        rm -rf /usr/local/bin/vncstop                                        
        fi
  echo "#!/usr/bin/env bash" >>/usr/local/bin/vncstop
  echo "vncserver -kill :1" >>/usr/local/bin/vncstop
  echo "rm -rf /username/.vnc/localhost:*.pid" >>/usr/local/bin/vncstop
  echo "rm -rf /tmp/.X1-lock" >>/usr/local/bin/vncstop
  echo "rm -rf /tmp/.X11-unix/X1" >>/usr/local/bin/vncstop
    chmod +x /usr/local/bin/vncstop
  if [[ -e "/usr/local/bin/fixvnc" ]]; then
        rm -rf /usr/local/bin/fixvnc                                         
        fi
  echo "pkill Xtigervnc" >>/usr/local/bin/fixvnc
  echo "LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver :1 -localhost no" >>/usr/local/bin/fixvnc
    chmod +x /usr/local/bin/fixvnc

    echo "export DISPLAY=":1"" >> /etc/profile
    echo "export PULSE_SERVER=127.0.0.1" >> /etc/profile
    source /etc/profile
    cat << EOF >> ~/.vnc/xstartup
# Uncomment the following two lines for normal desktop:
# unset SESSION_MANAGER
# exec /etc/X11/xinit/xinitrc
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
x-window-manager &
export XKL_XMODMAP_DISABLE=1
export XDG_CURRENT_DESKTOP="GNOME-Flashback:GNOME"
export XDG_MENU_PREFIX="gnome-flashback-"
gnome-session --session=gnome-flashback-metacity --disable-acceleration-check --debug &
gnome-panel &
gnome-settings-daemon &
metacity &
nautilus &

EOF
}

lxde_mode() {
	banner
	echo -e "${R} [${W}-${R}]${C} Installing LXDE DESKTOP"${W}
	apt update
	sudo apt install lxde lxterminal kali-themes -y
	apt-get install udisks2 -y
	echo " " > /var/lib/dpkg/info/udisks2.postinst
	apt-mark hold udisks2
	apt-get install sudo tzdata -y
	apt-get install lxde lxterminal kali-themes -y
	mv /usr/bin/lxpolkit /usr/bin/lxpolkit.bak
	apt-get --fix-broken install -y
	apt-get clean
	banner
	echo -e "${R} [${W}-${R}]${C} Setting up VNC Server..."${W}
  if [[ ! -d "$HOME/.vnc" ]]; then
        mkdir -p "$HOME/.vnc"
    fi
   if [[ -e "/usr/local/bin/vncstart" ]]; then
        rm -rf /usr/local/bin/vncstart
    fi
    echo "#!/usr/bin/env bash" >>/usr/local/bin/vncstart
  echo "dbus-launch" >>/usr/local/bin/vncstart
  echo "vncserver -geometry 1600x900 -name remote-desktop :1" >>/usr/local/bin/vncstart
  chmod +x /usr/local/bin/vncstart
  if [[ -e "/usr/local/bin/vncstop" ]]; then
        rm -rf /usr/local/bin/vncstop
    fi
  echo "#!/usr/bin/env bash" >>/usr/local/bin/vncstop
  echo "vncserver -kill :*" >>/usr/local/bin/vncstop
  echo "rm -rf /username/.vnc/localhost:*.pid" >>/usr/local/bin/vncstop
  echo "rm -rf /tmp/.X1-lock" >>/usr/local/bin/vncstop
  echo "rm -rf /tmp/.X11-unix/X1" >>/usr/local/bin/vncstop
    chmod +x /usr/local/bin/vncstop
  if [[ -e "/usr/local/bin/fixvnc" ]]; then
        rm -rf /usr/local/bin/fixvnc
    fi
  echo "pkill Xtigervnc" >>/usr/local/bin/fixvnc
  echo "LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver :1 -localhost no" >>/usr/local/bin/fixvnc
    chmod +x /usr/local/bin/fixvnc
    echo "export DISPLAY=":1"" >> /etc/profile
    echo "export PULSE_SERVER=127.0.0.1" >> /etc/profile
    source /etc/profile


}

lxqt_mode(){
	banner
	echo -e "${R} [${W}-${R}]${C} Installing LXQT DESKTOP"${W}
	apt-get update
	apt-get install udisks2 -y
	echo " " > /var/lib/dpkg/info/udisks2.postinst
	apt-mark hold udisks2
	apt-get install sudo tzdata -y
	apt-get install lxqt qterminal kali-themes -y
	apt-get install tigervnc-standalone-server dbus-x11 -y
	apt-get --fix-broken install -y
	apt-get clean
	 banner
       echo -e "${R} [${W}-${R}]${C} Setting up VNC Server..."${W}
  if [[ ! -d "$HOME/.vnc" ]]; then
        mkdir -p "$HOME/.vnc"
    fi
   if [[ -e "/usr/local/bin/vncstart" ]]; then
        rm -rf /usr/local/bin/vncstart
    fi
    echo "#!/usr/bin/env bash" >>/usr/local/bin/vncstart
  echo "dbus-launch" >>/usr/local/bin/vncstart
  echo "vncserver -geometry 1600x900 -xstartup /bin/startlxqt" >>/usr/local/bin/vncstart
  chmod +x /usr/local/bin/vncstart
  if [[ -e "/usr/local/bin/vncstop" ]]; then
        rm -rf /usr/local/bin/vncstop
    fi
  echo "#!/usr/bin/env bash" >>/usr/local/bin/vncstop
  echo "vncserver -kill :*" >>/usr/local/bin/vncstop
  echo "rm -rf /username/.vnc/localhost:*.pid" >>/usr/local/bin/vncstop
  echo "rm -rf /tmp/.X1-lock" >>/usr/local/bin/vncstop
  echo "rm -rf /tmp/.X11-unix/X1" >>/usr/local/bin/vncstop
    chmod +x /usr/local/bin/vncstop
  if [[ -e "/usr/local/bin/fixvnc" ]]; then
        rm -rf /usr/local/bin/fixvnc
    fi
  echo "pkill Xtigervnc" >>/usr/local/bin/fixvnc
  echo "LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver :1 -localhost no" >>/usr/local/bin/fixvnc
    chmod +x /usr/local/bin/fixvnc

    echo "export DISPLAY=":1"" >> /etc/profile
    echo "export PULSE_SERVER=127.0.0.1" >> /etc/profile
    source /etc/profile


}

kde_mode() {
	banner
	echo -e "${R} [${W}-${R}]${C} Installing KDE DESKTOP"${W}
	apt update 
	apt-get install udisks2 -y
	echo " " > /var/lib/dpkg/info/udisks2.postinst
	apt-mark hold udisks2
	apt-get install sudo tzdata -y
	apt-get install kde-plasma-desktop konsole -y
	apt-get install tigervnc-standalone-server dbus-x11 -y
	apt-get --fix-broken install -y
	apt-get clean
	 banner
       echo -e "${R} [${W}-${R}]${C} Setting up VNC Server..."${W}
  if [[ ! -d "$HOME/.vnc" ]]; then
        mkdir -p "$HOME/.vnc"
    fi
   if [[ -e "/usr/local/bin/vncstart" ]]; then
        rm -rf /usr/local/bin/vncstart
    fi
    echo "#!/usr/bin/env bash" >>/usr/local/bin/vncstart
  echo "dbus-launch" >>/usr/local/bin/vncstart
  echo "vncserver -geometry 1600x900 -xstartup /bin/startplasma-x11" >>/usr/local/bin/vncstart
  chmod +x /usr/local/bin/vncstart
  if [[ -e "/usr/local/bin/vncstop" ]]; then
        rm -rf /usr/local/bin/vncstop
    fi
  echo "#!/usr/bin/env bash" >>/usr/local/bin/vncstop
  echo "vncserver -kill :*" >>/usr/local/bin/vncstop
  echo "rm -rf /username/.vnc/localhost:*.pid" >>/usr/local/bin/vncstop
  echo "rm -rf /tmp/.X1-lock" >>/usr/local/bin/vncstop
  echo "rm -rf /tmp/.X11-unix/X1" >>/usr/local/bin/vncstop
    chmod +x /usr/local/bin/vncstop
  if [[ -e "/usr/local/bin/fixvnc" ]]; then
        rm -rf /usr/local/bin/fixvnc
    fi
  echo "pkill Xtigervnc" >>/usr/local/bin/fixvnc
  echo "LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 vncserver :1 -localhost no" >>/usr/local/bin/fixvnc
    chmod +x /usr/local/bin/fixvnc

    echo "export DISPLAY=":1"" >> /etc/profile
    echo "export PULSE_SERVER=127.0.0.1" >> /etc/profile
    source /etc/profile

}

		
package() {
	banner
    echo -e "${R} [${W}-${R}]${C} Checking required packages..."${W}
    apt update -y
    apt install sudo -y
    apt --fix-broken install udisks2 -y
    rm /var/lib/dpkg/info/udisks2.postinst
    echo "" > /var/lib/dpkg/info/udisks2.postinst
    sudo dpkg --configure -a
    sudo apt-mark hold udisks2
    sudo apt-mark unhold gvfs-daemons
    sudo dpkg --configure -a
    packs=(sudo wget curl nano kali-menu kali-linux-core git qterminal mousepad librsvg2-common menu inetutils-tools dialog tightvncserver tigervnc-standalone-server tigervnc-tools dbus-x11 )
    sudo dpkg --configure -a
    for hulu in "${packs[@]}"; do
        type -p "$hulu" &>/dev/null || {
            echo -e "\n${R} [${W}-${R}]${G} Installing package : ${Y}$hulu${C}"${W}
            sudo apt-get install "$hulu" -y --no-install-recommends
        }
    done
    sudo apt update -y
}

fix_broken() {
    banner
    echo -e "${Y}Checking error and fix it..."${W}
    sudo dpkg --configure -a
     
    sudo apt-get install --fix-broken keyboard-configuration -y
}


note() {
banner
    echo -e " ${G} Successfully Installed !"${W}
    sleep 1
    echo
    echo -e " ${G}Type ${C}vncstart${G} to run Vncserver."${W}
    echo
    echo -e " ${G}Type ${C}vncstop${G} to stop Vncserver."${W}
    echo
    echo -e " ${C}Install VNC VIEWER OR Nethunter Kex on your Device."${W}
    echo
    echo -e " ${C}Open VNC VIEWER & Click on + Button."${W}
    echo
    echo -e " ${C}Enter the Address localhost:1 & Name anything you like."${W}
    echo
    echo -e " ${C}Set the Picture Quality to High for better Quality."${W}
    echo 

    echo -e " ${C}Click on Connect & Input the Password."${W}
    echo 
    echo -e " ${C}If you install the GNOME DESKKTOP os don't use Nethunter Kex"${W}
    echo
    echo -e " ${C}Enjoy :D"${W}
    echo
    echo

}

add_sound() {
	echo "$(echo "bash ~/.sound" | cat - /data/data/com.termux/files/usr/bin/kali)" > /data/data/com.termux/files/usr/bin/kali

}

add_user() {
	apt autoremove sudo -y
    banner
    read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Input Username [Lowercase] : \e[0m\e[1;96m\en' user
    echo -e "${W}"
    read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Input Password : \e[0m\e[1;96m\en' pass
    echo -e "${W}"
    deluser kali
    useradd -m -s $(which bash) ${user}
    echo "${user}:${pass}" | chpasswd
    apt update -y
    apt install sudo -y
    echo "$user ALL=(ALL:ALL) ALL" >> /etc/sudoers
    echo "proot-distro login --user $user kali" > /data/data/com.termux/files/usr/bin/kali
    #chmod +x /data/data/com.termux/files/usr/bin/kali
    clear

}

customize() {
          sudo apt update
	if [[ $(command -v plank) ]]; then
	echo "${G}Plank is already installed .."${W}
        sleep .5 
        clear
   else
	   clear
	   sleep 1 
	   echo "${G}Plank not found.Installing now.."${W}
	   echo 
	   sudo apt install plank -y
	fi
mkdir /home/${user}/.config/autostart/
        touch /home/${user}/.config/autostart/plank.desktop
        echo "[Desktop Entry]" >>/home/${user}/.config/autostart/plank.desktop
        echo "Type=Application" >>/home/${user}/.config/autostart/plank.desktop
        echo "Name=Plank" >>/home/${user}/.config/autostart/plank.desktop
        echo "Exec=plank" >>/home/${user}/.config/autostart/plank.desktop
        chmod +x /home/${user}/.config/autostart/plank.desktop
	sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting -y
    cp /etc/skel/.zshrc ~/
    sudo chsh -s $(which zsh) $(whoami)
}
clenup() {
	clear
    banner
	echo
	echo "Cleaning up system.."
	echo
    sleep 2
    cd ~
	sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
	sleep 2
	sudo dpkg --configure -a
	apt autoremove -y
	sudo apt autoremove xfce4-terminal -y
        sleep 2
    sudo apt clean && sudo apt autoclean
    rm /root/gui.sh
	
}

#full_update
add_user
package
select_desktop_type
fix_broken
firefox_install
vlc_installer
add_sound
customize
clenup
clean_up
note
