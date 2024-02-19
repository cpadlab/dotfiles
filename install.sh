#!/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

path=$(pwd)

echo "Dotfiles v3.43          Carlos Padilla (14wual)"
echo "==============================================="

packages=(
    "build-essential"
    "git"
    "vim"
    "xcb"
    "libxcb-util0-dev"
    "libxcb-ewmh-dev"
    "libxcb-randr0-dev"
    "libxcb-icccm4-dev"
    "libxcb-keysyms1-dev"
    "libxcb-xinerama0-dev"
    "libasound2-dev"
    "libxcb-xtest0-dev"
    "libxcb-shape0-dev"
    "cmake"
    "cmake-data"
    "pkg-config"
    "python3-sphinx"
    "libcairo2-dev"
    "libxcb1-dev"
    "libxcb-util0-dev"
    "libxcb-randr0-dev"
    "libxcb-composite0-dev"
    "python3-xcbgen"
    "xcb-proto"
    "libxcb-image0-dev"
    "libxcb-ewmh-dev"
    "libxcb-icccm4-dev"
    "libxcb-xkb-dev"
    "libxcb-xrm-dev"
    "libxcb-cursor-dev"
    "libasound2-dev"
    "libpulse-dev"
    "libjsoncpp-dev"
    "libmpdclient-dev"
    "libuv1-dev"
    "libnl-genl-3-dev"
    "meson"
    "libxext-dev"
    "libxcb1-dev"
    "libxcb-damage0-dev"
    "libxcb-xfixes0-dev"
    "libxcb-shape0-dev"
    "libxcb-render-util0-dev"
    "libxcb-render0-dev"
    "libxcb-composite0-dev"
    "libxcb-image0-dev"
    "libxcb-present-dev"
    "libxcb-xinerama0-dev"
    "libpixman-1-dev"
    "libdbus-1-dev"
    "libconfig-dev"
    "libgl1-mesa-dev"
    "libpcre2-dev"
    "libevdev-dev"
    "uthash-dev"
    "libev-dev"
    "libx11-xcb-dev"
    "libxcb-glx0-dev"
    "libpcre3"
    "libpcre3-dev"
    "feh"
    "scrot"
    "scrub"
    "rofi"
    "xclip"
    "bat"
    "locate"
    "ranger"
    "neofetch"
    "wmname"
    "acpi"
    "bspwm"
    "sxhkd"
    "imagemagick"
    "lsd"
)

repositories=(
    "--recursive https://github.com/polybar/polybar"
    "https://github.com/ibhagwan/picom"
)

_scripts=(
    "scripts/whichSystem.py"
    "scripts/screenshot"
)

_chmod=(
    "~/.config/bspwm/bspwmrc"
    "~/.config/bspwm/scripts/bspwm_resize"
    "~/.config/bin/ethernet_status.sh"
    "~/.config/bin/htb_status.sh"
    "~/.config/bin/htb_target.sh"
    "~/.config/polybar/launch.sh"
)

_sudo_chmod=(
    "/usr/local/bin/whichSystem.py"
    "/usr/local/bin/screenshot"
)

echo "[INFO] Installing APT Paquets"
for package in "${packages[@]}"
do
    sudo apt install -y "$package" > /dev/null 2>&1
    echo "[*] ${package} package installed correctly"
done

echo "[INFO] Utility folders created correctly"
mkdir ~/delete ~/Pictures/wallpaper ~/Pictures/screenshot && cd ~/delete

echo "[INFO] Cloning required repositories"
for repository in "${repositories[@]}"
do
    git clone "$repository" > /dev/null 2>&1
    echo "[*] Cloned Repository: ${repository}"
done

echo "[INFO] Configuring Polybar"
cd ~/delete/polybar
mkdir build
cd build
cmake .. > /dev/null 2>&1
make -j$(nproc) > /dev/null 2>&1
sudo make install 

echo "[INFO] Configuring Picom"
cd ~/delete/picom
git submodule update --init --recursive > /dev/null 2>&1
meson --buildtype=release . build > /dev/null 2>&1
ninja -C build > /dev/null 2>&1
sudo ninja -C build install

echo "[INFO] Configuring Power Level 10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k > /dev/null 2>&1
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

echo "[INFO] Configuring Rofi"
mkdir -p ~/.config/rofi/themes
cp $path/files/rofi/nord.rasi ~/.config/rofi/themes/

echo "[INFO] Copying Fonts"
sudo cp -v $path/fonts/* /usr/local/share/fonts/
sudo cp -v $path/config/polybar/fonts/* /usr/share/fonts/truetype/

echo "[INFO] Copying Wallpapers"
cp -v $path/wallpaper/* ~/Pictures/wallpaper

echo "[INFO] Updating .zshrc"
rm -rf ~/.zshrc && cp -v $path/files/.zshrc ~/.zshrc

cp -v $path/files/.p10k.zsh ~/.p10k.zsh
sudo cp -v $path/files/.p10k.zsh-root /root/.p10k.zsh

echo "[INFO] Copying Configuration Files"
rm -r ~/.config/polybar
cp -rv $path/config/* ~/.config/

for _script in "${_scripts[@]}"
do
    sudo cp -v $path/"$_script" /usr/local/bin/
done

echo "[INFO] Installing latest requirements"
sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions > /dev/null 2>&1
sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh > /dev/null 2>&1

echo "[INFO] Updating permissions"
for file in "${_chmod[@]}"
do
    chmod +x "$file"
done

for file in "${_sudo_chmod[@]}"
do
    sudo chmod +x "$file"
done

sudo ln -s -fv ~/.zshrc /root/.zshrc > /dev/null 2>&1

echo "[INFO] Eliminating waste"
rm -rf ~/github && rm -rfv $path

rofi-theme-selector

xdg-open "https://github.com/14wual/dotfiles" > /dev/null 2>&1
notify-send "14Wual Dotfiles Installed"

echo "[INFO] Finished! Thank you very much for installing"
exit