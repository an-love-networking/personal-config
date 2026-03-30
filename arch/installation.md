# Arch Linux setup
1. In USB boot
- ```bash
pacman-key --init
pacman-key --populate archlinux
# connect to wifi
pacman -S archinstall 
archinstall
```
- config:
    - bootloader: systemd
    - kernel: linux-base
    - desktop environment: KDE | Hyprland
    - GPU driver: 
        - RTX: nvidia turing+
        - GTX: nvidia proprietary
        - Intel: intel open source
        - AMD: all open source
    - Greeter: sddm
    - Audio: pipewire
    - Wifi: NetworkManager
    - Additional packages:
        - firefox
        - steam
    - Optional repo: multilib

2. Post setup
- install `power-profile-daemon`
- reboot
- install `gamemode lib32-gamemode`
- give permission to gamemode
`sudo usermod -aG gamemode [user]`
- setup firewall
```
sudo pacman -S ufw
sudo ufw enable
sudo systemctl enable ufw
# check for firewall status
sudo ufw status
```

3. Setup for nvidia
- edit at */etc/boot/loader/entries/* (not the fallback file)
on the last line
``` 
options [root] [zswap] [rootfstype] quiet nvidia.NVreg_OpenRmEnable=1 nvidia_drm.modeset=1 nvidia_drm.fbdev=1 nvidia.NVreg_EnableGpuFirmware=0 nvidia.NVreg_PreserveVideoMemoryAllocations=1
```
- check for drm
```
sudo cat /sys/module/nvidia_drm/parameters/modeset
```
- create */etc/pacman.d/hooks/nvidia.hook*:
```
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia-open 
Target=linux

[Action]
Description=Updating NVIDIA module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux*) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

- edit */etc/mkinitcpio.conf*
```
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
# remove kms at HOOKS if have
```
