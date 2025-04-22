# literate-octo-pancake
Arch, Hyprland and waybar configuration | I made this for personal use but feel free to use it, it's basically defaults with sane configurations and intact syntax.
Pipewire just works and you can use the mouse wheel to turn the volume up/down, it also opens pwvucontrol and blueman onclick as a applet instead of a big tiled window.
![alt text](https://github.com/geovanmafra/literate-octo-pancake/blob/main/image.png?raw=true)


## Commands
  <details>
    <summary>1. Pacman</summary>

> Pacman
```
-Syu (update everything)
-Qdt (list all packages no longer required as dependencies "orphans")
-Rs package_name (remove a package and its dependencies which are not required by any other installed package)
-Rsc package_name (remove a package, its dependencies and all the packages that depend on the target package)
```
</details>





## Packages
  <details>
    <summary>1. Enviroment</summary>

> Hyprland
```
hyprland xdg-desktop-portal-hyprland hyprpolkitagent hyprcursor hyprlock hypridle hyprpaper qt5-wayland qt6-wayland uwsm
```
>Services
```
systemctl --user enable --now waybar.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now hyprpaper.service
systemctl --user enable --now hypridle.service
systemctl enable --now blueetoth.service
```
>Audio
```
pipewire lib32-pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber
```
>Other
```
waybar (brightnessctl playerctl power-profiles-daemon) mako wl-clipboard grim slurp [AUR: walker qview]
```
>Applets
```
udiskie network-manager-applet blueman [AUR: pwvucontrol]
```
>Theming
```
nwg-look (gtk-engine-murrine gnome-themes-extra or gnome-themes-standard [build dependency: sassc)
Fonts: noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
Theme: git clone https://github.com/vinceliuice/Colloid-gtk-theme ./install.sh --tweaks black rimless -n Everforest -t green -c dark -l
Icons: git clone https://github.com/vinceliuice/Colloid-icon-theme ./install.sh -s everforest -t green
Cursor: https://github.com/ndom91/rose-pine-hyprcursor
Micro: https://github.com/atomashevic/everforest-micro
```
> System utilities
```
git wget ghostty yazi trashcli unrar btop fastfetch mpv fuse2 (for appimage)
```
</details>

<details>
  <summary>2. Essential</summary>
  
> Programs
```
keepassxc chromium krita qbittorrent obs-studio
```
</details>

<details>
  <summary>3. Drivers and Windows compatibility layer</summary>

> Gaming
```
lutris dolphin-emu [AUR: ares-emu cemu-git duckstation-git pcsx2]
```
> Wine
```
wine wine-mono winetricks lib32-gnutls
```
> Drivers
```
mesa lib32-mesa mesa-utils vulkan-radeon lib32-vulkan-radeon gamescope
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
Normal session:
micro ~/.bash_profile

if [ -z "${WAYLAND_DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec hyprland
fi

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
  <summary>6. Yazi</summary>

> File manager
```
# yazi.toml
[manager]
show_hidden = true

[opener]
play = [
	{ run = 'mpv "$@"', orphan = true, for = "unix" },
]
edit = [
	{ run = 'micro "$@"', block = true, for = "unix" },
]
open = [
	{ run = 'xdg-open "$@"', desc = "Open" },
]

[open]
prepend_rules = [
	{ name = "*.json", use = "edit" },
	{ name = "*.sh", use = "edit" },
	{ name = "*.toml", use = "edit" },
	{ name = "*.y*ml", use = "edit" },
	{ name = "*config", use = "edit" },
	{ name = "*.cfg", use = "edit" },
	{ name = "*env", use = "edit" },
	{ name = "*.d", use = "edit" },
	{ name = "*.md", use = "edit" },
	{ name = "*.txt", use = "edit" },
	{ name = ".zsh*", use = "edit" },
	{ name = "*.ini", use = "edit" },
	{ name = "*.lua", use = "edit" },
	{ name = "*.xml", use = "edit" },
	{ name = "*.log", use = "edit" },
# open with normal / gnome / kde
	{ name = "*.ods", use = "open" },
	{ name = "*.pdf", use = "open" },
# open with multimedia player
	{ name = "*.mp3", use = "open" },

]
append_rules = [
	{ name = "*", use = "edit" },
]
```
</details>

<details>
  <summary>7. Chromium</summary>

> Extensions
```
Tab Grouper
UBlock Origin Lite - Canvas Blocker
Unhook - Return YouTube dislike
KeePassXC-Browser
Dark Reader
```
</details>

<details>
  <summary>8. yay</summary>

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
<details>
  <summary>9. Mime</summary>

> .config/mimeapps.list
```
[Added Associations]
application/json=micro.desktop;/home/kuriboh/.local/share/applications/Micro.desktop;
application/pdf=chromium.desktop;com.interversehq.qView.desktop;pqiv.desktop;
application/x-docbook+xml=micro.desktop;/home/kuriboh/.local/share/applications/Micro.desktop;chromium.desktop;
application/x-matroska=mpv.desktop;
application/x-yaml=micro.desktop;/home/kuriboh/.local/share/applications/Micro.desktop;
image/avif=com.interversehq.qView.desktop;pqiv-2.desktop;imv.desktop;feh.desktop;qimgv.desktop;mpv.desktop;
image/bmp=com.interversehq.qView.desktop;pqiv-2.desktop;imv.desktop;feh.desktop;qimgv.desktop;mpv.desktop;
image/gif=com.interversehq.qView.desktop;qimgv.desktop;imv.desktop;nsxiv.desktop;pqiv.desktop;feh.desktop;imv-dir.desktop;org.kde.gwenview.desktop;chromium.desktop;krita_gif.desktop;
image/heif=com.interversehq.qView.desktop;pqiv-2.desktop;imv.desktop;feh.desktop;qimgv.desktop;mpv.desktop;
image/jpeg=com.interversehq.qView.desktop;pqiv-2.desktop;imv.desktop;feh.desktop;qimgv.desktop;mpv.desktop;
image/png=com.interversehq.qView.desktop;pqiv-2.desktop;imv.desktop;feh.desktop;qimgv.desktop;mpv.desktop;
image/webp=com.interversehq.qView.desktop;pqiv-2.desktop;imv.desktop;feh.desktop;qimgv.desktop;mpv.desktop;
image/x-icns=com.interversehq.qView.desktop;pqiv-2.desktop;imv.desktop;feh.desktop;qimgv.desktop;mpv.desktop;
inode/directory=yazi.desktop;spf.desktop;
text/markdown=micro.desktop;/home/kuriboh/.local/share/applications/Micro.desktop;
text/plain=micro.desktop;/home/kuriboh/.local/share/applications/Micro.desktop;Micro.desktop;
text/x-cmake=micro.desktop;/home/kuriboh/.local/share/applications/Micro.desktop;
video/3gp=mpv.desktop;
video/3gpp=mpv.desktop;
video/3gpp2=mpv.desktop;
video/avi=mpv.desktop;
video/divx=mpv.desktop;
video/dv=mpv.desktop;
video/fli=mpv.desktop;
video/flv=mpv.desktop;
video/mp2t=mpv.desktop;
video/mp4=mpv.desktop;
video/mp4v-es=mpv.desktop;
video/mpeg=mpv.desktop;
video/msvideo=mpv.desktop;
video/ogg=mpv.desktop;
video/quicktime=mpv.desktop;
video/vnd.divx=mpv.desktop;
video/vnd.mpegurl=mpv.desktop;
video/vnd.rn-realvideo=mpv.desktop;
video/webm=mpv.desktop;
video/x-avi=mpv.desktop;
video/x-flv=mpv.desktop;
video/x-m4v=mpv.desktop;
video/x-matroska=mpv.desktop;
video/x-mpeg2=mpv.desktop;
video/x-ms-asf=mpv.desktop;
video/x-ms-wmv=mpv.desktop;
video/x-ms-wmx=mpv.desktop;
video/x-msvideo=mpv.desktop;
video/x-ogm=mpv.desktop;
video/x-ogm+ogg=mpv.desktop;
video/x-theora=mpv.desktop;
video/x-theora+ogg=mpv.desktop;

[Default Applications]
application/json=micro.desktop;
application/pdf=chromium.desktop;
application/x-docbook+xml=micro.desktop;
application/x-matroska=mpv.desktop;
application/x-yaml=micro.desktop;
image/avif=com.interversehq.qView.desktop;
image/bmp=com.interversehq.qView.desktop;
image/gif=com.interversehq.qView.desktop;
image/heif=com.interversehq.qView.desktop;
image/jpeg=com.interversehq.qView.desktop;
image/png=com.interversehq.qView.desktop;
image/webp=com.interversehq.qView.desktop;
image/x-icns=com.interversehq.qView.desktop;
inode/directory=yazi.desktop;
text/markdown=micro.desktop;
text/plain=micro.desktop;
text/x-cmake=micro.desktop;
video/3gp=mpv.desktop;
video/3gpp=mpv.desktop;
video/3gpp2=mpv.desktop;
video/avi=mpv.desktop;
video/divx=mpv.desktop;
video/dv=mpv.desktop;
video/fli=mpv.desktop;
video/flv=mpv.desktop;
video/mp2t=mpv.desktop;
video/mp4=mpv.desktop;
video/mp4v-es=mpv.desktop;
video/mpeg=mpv.desktop;
video/msvideo=mpv.desktop;
video/ogg=mpv.desktop;
video/quicktime=mpv.desktop;
video/vnd.divx=mpv.desktop;
video/vnd.mpegurl=mpv.desktop;
video/vnd.rn-realvideo=mpv.desktop;
video/webm=mpv.desktop;
video/x-avi=mpv.desktop;
video/x-flv=mpv.desktop;
video/x-m4v=mpv.desktop;
video/x-matroska=mpv.desktop;
video/x-mpeg2=mpv.desktop;
video/x-ms-asf=mpv.desktop;
video/x-ms-wmv=mpv.desktop;
video/x-ms-wmx=mpv.desktop;
video/x-msvideo=mpv.desktop;
video/x-ogm=mpv.desktop;
video/x-ogm+ogg=mpv.desktop;
video/x-theora=mpv.desktop;
video/x-theora+ogg=mpv.desktop;
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
cfdisk -z /dev/nvme0n1
GPT
128M EFI SYSTEM PARTITION p1
512M LINUX EXTENDED BOOT p2
4G LINUX SWAP p3
MAX LINUX x86_64 ROOT p4
```
```
mkfs.xfs /dev/nvme0n1p4
mkswap /dev/nvme0n1p3
mkfs.fat -F 32 /dev/nvme0n1p2
mkfs.fat -F 32 /dev/nvme0n1p1
```
### Mount the file systems
```
mount /dev/nvme0n1p4 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/efi
mount --mkdir /dev/nvme0n1p2 /mnt/boot
swapon /dev/nvme0n1p3
```
</details>


<details>
  <summary>2. Installation</summary>
  
### Install essential packages
```
pacstrap -K /mnt base linux-zen linux-zen-headers linux-firmware sof-firmware amd-ucode micro base-devel networkmanager xfsprogs
```
</details>


<details>
  <summary>3. Configure the system</summary>
  
### Fstab
> Generate an fstab file (use -U or -L to define by UUID or labels, respectively):
```
genfstab -U /mnt >> /mnt/etc/fstab
```
> Check the resulting /mnt/etc/fstab file, and edit it in case of errors.
### Chroot
> Change root into the new system:
```
arch-chroot /mnt
```
### Time
> Set the time zone:
```
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
```
> Run hwclock to generate /etc/adjtime:
```
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
