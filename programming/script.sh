#!/env/bin/bash
sudo pacman -S --needed git neovim zip
sudo pacman -S clangd python
yay -S jdk-openjdk gradle cmake
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
sdk install java 
sdk install kotlin
