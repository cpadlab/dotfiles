[Leer en Español](https://GitHub.com/14wual/dotfiles/main/other/Sread/spanish.md)

# 14Wual dotfiles

## 23May Update V2 | v2.38

Repository with all **my personal BSPWM environment** scripts and configurations for kali-linux.

What will my BSPWM look like? [See Here](https://github.com/14wual/dotfiles/main/README.md#gallery)

This script has been tested on Parrot OS, Kali Linux, Ubuntu and Debian

## Install

```bash
sudo git clone https://github.com/14wual/dotfiles
cd dotfiles
sudo chmod +777 install.sh
./install.sh
```

## Containing?

<table>
	<thead>
		<tr>
			<th>Util</th>
			<th>Name</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Environment</td>
			<td>BSPWM</td>
		</tr>
		<tr>
			<td>HotKeys</td>
			<td>Sxhkd</td>
		</tr>
		<tr>
			<td>Status Bar</td>
			<td>Polybar</td>
		</tr>
		<tr>
			<td>Terminal</td>
			<td>Kitty</td>
		</tr>
		<tr>
			<td>Interpreter</td>
			<td>ZSH</td>
		</tr>
		<tr>
			<td>Pithcher</td>
			<td>xfce4-appfinder</td>
		</tr>
		<tr>
			<td>Terminal Information</td>
			<td>Neofetch</td>
		</tr>
	</tbody>
</table>

**Other Prograns**

<table>
	<tbody>
		<tr>
			<td>Spotify</td>
			<td>VSCode</td>
			<td>Brave-Browser</td>
		</tr>
	</tbody>
</table>

Note: Neofetch contains an ASCII art of 14wual [View current ASCII](https://github.com/14wual/dotfiles/blob/main/README.md#current-neofetch)

## Gallery

![1](https://user-images.githubusercontent.com/105047274/217115786-1595ffc9-2c36-48ab-bea5-f93a40eb6038.png)

![2](https://user-images.githubusercontent.com/105047274/217115805-cf7d265c-76d7-4fc9-bf92-82b52e4b545f.png)

![3](https://user-images.githubusercontent.com/105047274/217115838-f7b1c1bd-58d9-4805-a105-41b2c7a1ea0c.png)

## Tree

```
├───config
│   ├───bin
│   ├───bspwm
│   ├───kitty
│   ├───picom
│   ├───polybar
│   │   └───material
│   ├───sxhkd
│   └───neofetch
├───wallpaper
├───fonts
│   └───HNF
├───other
│   ├───login.conf
│   ├───xfce4-panel
├───deb
├───images
└───scripts
```

## Others

### Current Neofetch

```bash
❯ neofetch
                                      ⠀ ⬤ ››⬤ ››⬤ ››⬤ ››14Wual‹‹⬤ ‹‹⬤ ‹‹⬤ ‹‹⬤ 
██╗    ██╗██╗   ██╗ █████╗ ██╗        《·───────────────·》◈《·──────────────·》 
██║    ██║██║   ██║██╔══██╗██║          OS᛬ Kali 
██║ █╗ ██║██║   ██║███████║██║          DE᛬ bspwm 
██║███╗██║██║   ██║██╔══██║██║          Shell᛬ zsh 
╚███╔███╔╝╚██████╔╝██║  ██║███████╗     Memory᛬ 1.13GiB / 15.37GiB 
 ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝     CPU᛬ 11th Gen Intel i7-1165G7 
                                        GPU᛬ Intel TigerLake-LP GT2 [Iris Xe Graphics]
         (code by wual)                 Know 14Wual.github.io/dotfiles.php 
                                      《·───────────────·》◈《·───────────────·》 

```

### Change Neofetch ASCII Arte

```bash
sudo nano ~/.config/bin/14wual.txt
# Paste your ASCII Art 
```

### Alias For ".zshrc"

**Personal Alias. the .zshrc file has different personal aliases for 14wual and s4vitar. Aliases Wual:**

```bash
alias neofetch='neofetch --source /home/wual/.config/bin/14wual.txt'
alias mcc='/home/wual/.config/bin/mcc.sh'
alias clip='xfce4-clipman && xfce4-clipman-history'
```

### XFCE4

**Custom Login Page**

Copy the file: `dotfiles/Wallpaper/wallpaper.jpg` in `/usr/share/backgrounds`. <br>
Modify the following file: `/etc/lightdm/lightdm-gtk-greeter.conf`

```bash
background=/usr/share/backgrounds/wallpaper.jpg
theme-name = Kali-Dark
```

**Custom XFCE4 Panel**

Move the content of this folder: `~/.config/xfce4/panel` to `~/.config/xfce4/panel.bak` <br>
Copy the content of this folder: `dotfiles/other/xfce4-panel/` in `~/.config/xfce4/panel`. 

```bash
sudo mkdir ~/.config/xfce4/panel.bak
sudo cd ~/.config/xfce4/panel && sudo cp * ../panel.bak
sudo cd $PATH/other/xfce4-panel && sudo cp * ~/.config/xfce4/panel
```

![xfce4-desktop](images/xfce4-desktop)

## Shortcuts

```bash
#----------BASIC----------
super + Return >> kitty # Terminal Emulator
super + d >> xfce4-appfinder # Program launcher

#----------APPS----------
super + shift + b >> brave-browser # Open Browser
super + shift + c >> code # Open Visual Studio Code
super + shift + s >> spotify # Open Spotify
super + shift + f >> thunar # File Explorer
super + shift + k >> secrets # Password Manager

#----------PC----------
super + alt + s >> systemctl suspend # Suspend PC
super + alt + s >> i3lock # Block PC
super + alt + ctrl + h >> systemctl hibernate # Hibernate PC

#----------SCREENSHOT----------
@Print >> screenshot select
@Print + ctrl >> screenshot
@Print + alt >> screenshot window
```

### Credits

 1. [S4vitar](https://github.com/s4vitar)
 2. [xJackSx](https://github.com/xJackSx)
 3. [adi1090x](https://github.com/adi1090x)
 4. [D3Ext](https://github.com/D3Ext/)

## Know Me

<b>Linkeding</b> - https://www.linkedin.com/in/cpadilla10/ <br>
<b>Twitter</b> - https://twitter.com/codewual <br>
<b>YouTube</b> - https://www.youtube.com/channel/UC0B3mTwPPdKPEwLerauEtdg <br>

### Credits

 1. [S4vitar](https://github.com/s4vitar)
 2. [xJackSx](https://github.com/xJackSx)
 3. [Wallpaper]()
 4. [D3Ext](https://github.com/D3Ext/)
