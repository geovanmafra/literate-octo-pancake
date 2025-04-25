# Arch, Hyprland and Waybar
I made this for personal use but feel free to use it, it's basically the default file and some sane configurations.
Pipewire just works and you can use the mouse wheel to turn the volume up/down, it also opens pwvucontrol and blueman onclick as a applet instead of a big tiled window.
>👻
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
hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent hyprcursor hyprlock hypridle hyprpaper hyprpicker hyprland-qt-support uwsm
```
>Other
```
zenity dconf-editor waybar brightnessctl playerctl mako jq wl-clipboard grim slurp wofi [AUR: qview]
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
git wget ca-certificates ghostty yazi 7zip unrar chafa fd ffmpeg fzf imagemagick poppler trash-cli btop rocm-smi-lib fastfetch mpv fuse2
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
Fonts: noto-fonts noto-fonts-cjk noto-fonts-emoji
Xcursor: https://github.com/rose-pine/cursor
Hyprcursor: https://github.com/ndom91/rose-pine-hyprcursor
Theme: https://www.pling.com/p/1661959  //  https://www.pling.com/p/1681313/
Icons: https://www.pling.com/p/1661983  //  https://www.pling.com/p/1681460
```
</details>

<details>
  <summary>2. Essential</summary>
  
> Programs
```
keepassxc chromium gtk4 krita libmypaint libjxl libheif poppler-qt5 python-pyqt5 krita-plugin-gmic kimageformats5 kseexpr qbittorrent python obs-studio libfdk-aac sndio discord xdg-utils
```
</details>

<details>
  <summary>3. Drivers and Windows compatibility layer</summary>

> Gaming
```
dolphin-emu [AUR: ares-emu cemu pcsx2]
for some reason bottles only work without errors if you build it with these packages: yay -S bottles gamemode gvfs lib32-gamemode lib32-gnutls lib32-vkd3d lib32-vulkan-icd-loader vkd3d vulkan-icd-loader wine-tkg-staging-ntsync-bin
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
>Lutris
```
lutris fluidsynth gamescope gamemode lib32-gamemode lib32-vk3d umu-launcher
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
  <summary>6. Chromium</summary>

> Extensions
```
Tab Grouper - https://chromewebstore.google.com/detail/tab-grouper/cejjplkmdfnnlmphbhpbnfmkhkknnokg
! Group YouTube tabs
||youtube.com YouTube red

! Group all the weeb shit
||hianimez.to A green
||mangadex.org M green
||toonclash.com M green
||mangabuddy.com M green
||manhuatop.org M green


uBlock Origin Lite - https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh
Unhook - https://chromewebstore.google.com/detail/unhook-remove-youtube-rec/khncfooichmfjbepaaaebmommgaepoid
KeePassXC-Browser - https://chromewebstore.google.com/detail/keepassxc-browser/oboonakemofpalcgghocfoadofidjkkk
Dark Reader - https://chromewebstore.google.com/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh
Canvas Blocker - https://chromewebstore.google.com/detail/canvas-blocker-fingerprin/nomnklagbgmgghhjidfhnoelnjfndfpd
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
cfdisk -z /dev/nvme0n1
GPT
128M EFI SYSTEM PARTITION p1
512M LINUX EXTENDED BOOT p2
4G LINUX SWAP p3
MAX LINUX x86_64 ROOT p4
```
```
mkfs.xfs -f /dev/nvme0n1p4
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
