#!/env/bin/bash 

# enable multilib
sed -i 's/#\[multilib\]/[multilib]' /etc/pacman.conf
sed -i 's/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf
sudo pacman -Syu

sudo pacman -S --needed git nvidia-open nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

sudo pacman -S steam

git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
