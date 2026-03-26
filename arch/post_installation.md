## POST INSTALLATION
- Download yay(AUR):
```
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
```

- Enable [multilib] in */etc/pacman.conf*
- Install nvidia-utils and lib32-nvidia-utils
- [Optional] Disable manually `nouveau` in /etc/mkinitcpio.conf
    - Delete `kms` in HOOKS
- Download `wine-staging, wine-mono, winetricks`

- Download `nvidia-open nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader`
