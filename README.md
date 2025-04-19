# literate-octo-pancake
Arch Linux installation.

## Packages
  <details>
    <summary>1. Enviroment</summary>

> Plasma
```
plasma-desktop plasma-nm plasma-pa bluedevil kscreen kwalletmanager spectacle kdialog flatpak-kcm isoimagewriter ark gwenview kimageformats qt6-imageformats
```
> Hyprland
```
xxx
```
</details>

<details>
  <summary>2. Essential</summary>
  
> System utilities
```
base-devel git ghostty yazi trashcli wl-clipboard noto-fonts-cjk unrar wget fuse2 btop fastfetch mpv phonon-qt6-mpv
```
> Programs
```
chromium krita qbittorrent obs-studio lutris
```
</details>

<details>
  <summary>4. Drivers and Windows compatibility layer</summary>
  
> Wine
```
wine wine-mono winetricks lib32-gnutls
```
> Drivers
```
mesa lib32-mesa mesa-utils vulkan-radeon lib32-vulkan-radeon
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
doas pacman -S xdg-user-dirs

xdg-user-dirs-update
```
</details>

<details>
  <summary>2. Autologin</summary>
  
> Log into bash automatically
```
doas mkdir -p /etc/systemd/system/getty@tty1.service.d
doas micro /etc/systemd/system/getty@tty1.service.d/autologin.conf

[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin kuriboh %I $TERM
```
> Start Plasma session
```
micro ~/.bash_profile

if [ -z "${WAYLAND_DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
fi
```
>Start Hyprland session
```
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
doas micro /etc/pacman.conf

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
  <summary>5. Ghostty</summary>

> Terminal emulator
```
theme = Twilight
background-opacity = 0.8
confirm-close-surace = false
#gtk-adwaita = false
#window-decoration = true
```
</details>

<details>
  <summary>6. Micro</summary>

> Text editor
```
set colorscheme twilight
```
</details>

<details>
  <summary>7. Yazi</summary>

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
	{ name = "*.txt", use = "micro" },
	{ name = ".zsh*", use = "edit" },
	{ name = "*.ini", use = "edit" },
	{ name = "*.lua", use = "edit" },
	{ name = "*.xml", use = "edit" },
	{ name = "*.log", use = "edit" },
# open with normal / gnome / kde
	{ name = "*.ods", use = "open" },
	{ name = "*.pdf", use = "open" },
# open with multimedia player
	{ name = "*.mp3", use = "play" },

]
append_rules = [
	{ name = "*", use = "edit" },
]
```
</details>

<details>
  <summary>8. Chromium</summary>

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
  <summary>9. yay</summary>

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
pacstrap -K /mnt base linux-zen linux-zen-headers linux-firmware sof-firmware amd-ucode micro opendoas networkmanager xfsprogs
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
### Enable OpenDoas
> To allow members of group wheel to run commands as other users, create a configuration file with the following content:
```
micro /etc/doas.conf
```
```
permit setenv {PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin} :wheel
```
> Allow members of the wheel group to run graphical applications and to access the user's locale using the setenv option:
```
permit setenv { XAUTHORITY LANG LC_ALL } :wheel
```
### The owner and group for /etc/doas.conf should both be 0, file permissions should be set to 0400:
```
chown -c root:root /etc/doas.conf
chmod -c 0400 /etc/doas.conf
```
> For a smooth transition from sudo to doas and to stay downward compatible, you could symlink doas to where sudo would normally be:
```
ln -s $(which doas) /usr/bin/sudo
```
### Test escalated permissions
```
su kuriboh
doas pacman -Syu
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
