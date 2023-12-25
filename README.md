
<center><img src="./image/demo-xfce.png"></center>
<p align="center"><b>Easily Install Full Kali Linux Verious Type Of Desktop in Termux</b></p>

<div align="center">

![GitHub Repo stars](https://img.shields.io/github/stars/sabamdarif/modded-kali)
![GitHub issues](https://img.shields.io/github/issues/sabamdarif/modded-kali)
![GitHub License](https://img.shields.io/github/license/sabamdarif/modded-kali)
</div>

### Features:

- :speaker: Fixed Audio Output
- :globe_with_meridians: 2 Browsers (Chromium & Mozilla Firefox)
- :tv: VLC Media Player and MPV media player (VLC Fully work)
- :books: Easy for Beginners
- :computer: Add new Application Menu
- :hammer: Install XFCE, LXDE, LXQT, KDE, or GNOME Desktop
- :art: More customization (new styles added and new fonts etc...)

### Installation:

1. Firstly install [Termux](https://termux.com) apk from [HERE](https://f-droid.org/repo/com.termux_118.apk)
2. Secondly Clone the Repository & Run the setup File

   - `pkg update -y && pkg upgrade -y`
   - `pkg install git wget -y`
   - `git clone https://github.com/sabamdarif/modded-kali`
   - `cd modded-kali`
   - `bash setup.sh`
   - `kali`
   - `bash gui.sh`
   - Now select **KFCE**, **KDE**, **LXDE**, **LXQT** OR **GNOME** Desktop (any one)

<details>
<summary><b><code>DEMO IMAGES: </code></b></summary>

|GNOME|LXDE|LXQT|KDE|
|--|--|--|--|
|![img](image/demo-gnome.png)|![img](image/demo-lxde.png)|![img](image/demo-lxqt.png)|![img](/image/demo-kde.png)|

</details>

3. **You have to note your VNC password !!**
4. **If you select xfce4 / default desktop environment then you need to run `./customize-my-desktop`**
5. KALI image is now successfully installed.

   - Type `vncstart` to run Vncserver
   - Type `vncstop` to stop Vncserver

6. Install VNC VIEWER Apk on your Device. [Google Play Store](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android&hl=en)
7. Or, Install NetHunter KeX from [Nethunter Store](https://store.nethunter.com/en/packages/com.offsec.nethunter.kex/)

8. Open VNC VIEWER & Click on + Button & Enter the Address `localhost:1` & Name anything you like
9. Set the Picture Quality to High for better Quality
10. Click on Connect & Input the Password
11. Enjoy :smile:

### NOTE:

- **Type `kali` to run KALI CLI as noraml user**
- **Type `kali -r` to run KALI CLI as root user**
- **Type `vncstart` to run Vncserver**
- **Type `vncstop` to stop Vncserver**
- **Type `vncstop -f` to stop Vncserver forcefully**
- **Type `bash remove.sh` to remove KALI**

### ISSUES:
- **Issue:-** Vnc server related issue like *vnc autostop* , *Apps not showing*
- **Solution:-** Login into root user using `kali -r` then launch vncserver

### If you like our work then dont forget to give a Star :)

