# Arch, Hyprland and Waybar
I made this for personal use but feel free to use it, it's basically the default configuration files and some sane configurations without going crazy.
Pipewire just works and you can use the mouse wheel to turn the volume up/down, it also opens pwvucontrol and blueman onclick as a applet instead of a big tiled window.
![alt text](https://github.com/geovanmafra/literate-octo-pancake/blob/main/preview_lain.png?raw=true)
![alt text](https://github.com/geovanmafra/literate-octo-pancake/blob/main/preview.png?raw=true)


## Commands
  <details>
    <summary>1. Pacman cheatsheet</summary>

> Pacman
```
-Syu (update everything)
-Qdt (list all packages no longer required as dependencies "orphans")
-Rs package_name (remove a package and its dependencies which are not required by any other installed package)
-Rsc package_name (remove a package, its dependencies and all the packages that depend on the target package)
```
> yay
```
-Qm (list all packages installed locally)
-Sc (clear cache)
```
> Trash and space management
```
trash-list
trash-empty
df -h
du -hs ~/file
```
</details>





## Packages
  <details>
    <summary>1. Enviroment</summary>

> Hyprland
```
hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent hyprcursor hyprlock hypridle hyprpaper hyprpicker hyprland-qt-support uwsm
```
>Dialog, theme editors, bar with functions, application launcher, notifications and screenshots
```
zenity qt5ct qt6ct dconf-editor waybar brightnessctl playerctl wofi mako jq wl-clipboard grim slurp
```
>Audio
```
pipewire lib32-pipewire lib32-pipewire-jack lib32-pipewire-v4l2 pipewire v4l2 pipewire-alsa pipewire-pulse pipewire-jack pipewire-ffado pipewire-audio rtkit wireplumber gst-plugin-pipewire noise-suppression-for-voice lib32-libpulse lib32-alsa-lib lib32-alsa-plugins
```
>Applets
```
udiskie libappindicator-gtk3 network-manager-applet blueman [AUR: pwvucontrol]
```
> System utilities
```
git wget ca-certificates ghostty yazi 7zip unrar chafa fd ffmpeg fzf imagemagick poppler trash-cli btop rocm-smi-lib fastfetch mpv fuse2 net-tools isoimagewriter openssh [AUR: qview]
```
>Services
```
systemctl --user enable --now waybar.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now hyprpaper.service
systemctl --user enable --now hypridle.service
systemctl enable --now blueetoth.service
```
>Theming
```
To apply the themes just open dconf-editor and go to /org/gnome/desktop/interface/ and change the accent-color, color-scheme, gtk-theme and icon-theme (for QT use qt5ct and qt6ct)
Fonts: noto-fonts noto-fonts-cjk noto-fonts-emoji
Xcursor: https://github.com/rose-pine/cursor
Hyprcursor: https://github.com/ndom91/rose-pine-hyprcursor
Theme: https://www.pling.com/p/1661959  Colloid-Gruvbox.tar.xz
Icons: https://www.pling.com/p/1961046/  gruvbox-plus-icon-pack.6.2.0.tar.gz
Firefox: https://addons.mozilla.org/en-GB/firefox/addon/gruvbox-d-h/
```
</details>

<details>
  <summary>2. Programs I use daily</summary>
  
> :p
```
keepassxc firefox krita libmypaint libjxl libheif poppler-qt5 python-pyqt5 krita-plugin-gmic kimageformats5 kseexpr qbittorrent python obs-studio libfdk-aac sndio discord xdg-utils [AUR: anki-bin neothesia]
```
</details>

<details>
  <summary>3. Drivers, Gaming and Windows compatibility layer</summary>

> Gaming
```
[Emulators: dolphin-emu ppsspp [AUR: ares-emu cemu-bin pcsx2-latest-bin]
[Lutris: lutris fluidsynth gamescope gamemode lib32-gamemode lib32-vk3d umu-launcher]
[AUR-Bottles: yay -S bottles gamemode gvfs lib32-gamemode lib32-gnutls lib32-vkd3d lib32-vulkan-icd-loader vkd3d vulkan-icd-loader wine-tkg-staging-ntsync-bin]
```
> Wine
```
wine wine-gecko wine-mono winetricks lib32-gnutls
```
> Drivers
```
mesa lib32-mesa lib32-vulkan-mesa-layers vulkan-radeon lib32-vulkan-radeon mesa-utils
```
> Vulkan utilities
```
vulkan-icd-loader lib32-vulkan-icd-loader vulkan-tools
```
</details>
</details>





## Configurations
  <details>
    <summary>1. XDG user directories</summary>

> Create HOME folders
```
sudo pacman -S xdg-user-dirs

xdg-user-dirs-update
```
</details>

<details>
  <summary>2. Autologin</summary>
  
> Log into bash automatically
```
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo micro /etc/systemd/system/getty@tty1.service.d/autologin.conf

[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin kuriboh %I $TERM
```
> Start Hyprland session
```
UWSM session:
micro ~/.bash_profile

if uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi
```
</details>

<details>
  <summary>3. Pacman</summary>

> Nostalgic downloading emoji + MULTILIB support
```
sudo micro /etc/pacman.conf

Color
ILoveCandy
[multilib]
Include = /etc/pacman.d/mirrorlist
```
</details>

<details>
  <summary>4. DNS</summary>

> Cloudflare
```
IPV4: 1.1.1.1, 1.0.0.1
IPV6: 2606:4700:4700::1111, 2606:4700:4700::1001
```
</details>

<details>
  <summary>5. Micro</summary>

> Text editor
```
set colorscheme twilight
```
</details>

<details>
  <summary>6. Firefox</summary>

> Extensions
```
uBlock Origin
Unhook - Remove YouTube
KeePassXC-Browser
Dark Reader
Canvas Blocker
Search by Image

about:config
browser.tabs.groups.enabled
```
</details>

<details>
  <summary>7. yay</summary>

> AUR helper
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```
> First use
```
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save
```
</details>
</details>





## System Installation
  <details>
    <summary>1. Pre-installation</summary>

### Set the console keyboard layout
```
loadkeys br-abnt2
```
### Verify the boot mode
```
cat /sys/firmware/efi/fw_platform_size
```
### Verify the internet connection
```
ping archlinux.org
```
### Update the system clock
```
timedatectl set-timezone America/Sao_Paulo
```
### Format the partitions
```
# cfdisk -z /dev/nvme0n1
GPT LAYOUT
PARTITION | SIZE | TYPE
nvme0n1p1   512M   EFI SYSTEM PARTITION
nvme0n1p2   MAXX   LINUX x86_64 ROOT
```
```
# mkfs.xfs -f -L ARCH /dev/nvme0n1p2
# mkfs.fat -F 32 /dev/nvme0n1p1
# fatlabel /dev/nvme0n1p1 EFI
```
### Mount the file systems
```
# mount /dev/disk/by-label/ARCH /mnt
# mount --mkdir /dev/disk/by-label/EFI /mnt/efi
# mkswap -U clear --size 16G --file /mnt/swapfile
# swapon /mnt/swapfile
```
</details>


<details>
  <summary>2. Installation</summary>
  
### Install essential packages
```
# pacstrap -K /mnt base base-devel linux-zen linux-firmware sof-firmware amd-ucode xfsprogs networkmanager micro git
```
</details>


<details>
  <summary>3. Configure the system</summary>
  
### Fstab
```
# genfstab -L /mnt >> /mnt/etc/fstab
# micro /mnt/etc/fstab <- Add the swap entry
  /swapfile none swap defaults 0 0
```
### Chroot
```
arch-chroot /mnt
```
### Time
```
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
```
> This command assumes the hardware clock is set to UTC.
### Localization
> Edit /etc/locale.gen and uncomment en_GB.UTF-8 pt_BR.UTF-8 ja-JP.UTF-8:
```
micro /etc/locale.gen
locale-gen
```
> Create the locale.conf file, and set the LANG variable accordingly:
```
micro /etc/locale.conf
LANG=en_GB.UTF-8
LANGUAGE=en_GB:en:C:pt_BR
```
> If you set the console keyboard layout, make the changes persistent in vconsole.conf:
```
micro /etc/vconsole.conf
KEYMAP=br-abnt2
```
### Network configuration
> Create the hostname file:
```
micro /etc/hostname = yourhostname (ex thinkpad-e14)
```
> Enable system services
```
systemctl enable NetworkManager
```
### Root password
> Set the root password:
```
passwd
```
>Create your user (-m=home -G=groups -s=shell)
```
useradd -m -G wheel -s /bin/bash kuriboh
```
> Set the new user password:
```
passwd kuriboh
```
### Enable Sudo
> To allow members of group wheel to run commands as other users, create a configuration file with the following content:
```
EDITOR=micro visudo
```
>Add this line (it's on the end of the file)
```
%wheel      ALL=(ALL:ALL) ALL
```
### Test escalated permissions
```
su kuriboh
sudo pacman -Syu
exit
```
</details>


<details>
  <summary>4. Configure the boot loader </summary>
  
### systemd-boot installation using XBOOTLDR
> Mount the ESP to /mnt/efi and the XBOOTLDR partition to /mnt/boot.
```
bootctl --esp-path=/efi --boot-path=/boot install
```
> Loader configuration
```
micro efi/loader/loader.conf
```
```
default  arch.conf
timeout  0
console-mode max
editor   no
```
> Adding default loader
```
micro boot/loader/entries/arch.conf
```
```
title   Arch Linux (Zen Kernel)
linux   /vmlinuz-linux-zen
initrd  /amd-ucode.img
initrd  /initramfs-linux-zen.img
options root=/dev/nvme0n1p4 rw
```
> Adding fallback loader
```
micro boot/loader/entries/arch-fallback.conf
```
```
title   Arch Linux (Zen Kernel - Fallback)
linux   /vmlinuz-linux-zen
initrd  /amd-ucode.img
initrd  /initramfs-linux-zen-fallback.img
options root=/dev/nvme0n1p4 rw
```
</details>


<details>
  <summary>4. Reboot </summary>
  
> Exit the chroot environment by typing exit or pressing Ctrl+d.
```
exit
```
> Optionally manually unmount all the partitions with umount -R /mnt: this allows noticing any "busy" partitions, and finding the cause with fuser.
```
umount -R /mnt
```
> Finally, restart the machine by typing reboot: any partitions still mounted will be automatically unmounted by systemd. Remember to remove the installation medium and then login into the new system with the root account.
```
reboot
```
:)
</details>
</details>
