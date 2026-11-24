# Arch Linux Dot Files Setup 
## สำหหรับผมนะครับ
### BTW T_T

# 1 Install Packages ติดตั้งแพคเกจพื้นฐานสำหรับระบบ สำหรับกู
```bash
 sudo pacman -S adobe-source-code-pro-fonts alacritty arduino-cli base base-devel bluez bluez-utils brightnessctl bun cmake cups cups-pk-helper discord dunst efibootmgr fd ffmpegthumbnailer flatpak fzf git grub gst-plugin-pipewire gvfs htop intel-ucode iwd lazygit libpulse linux-firmware linux-zen mpv neovim nodejs noto-fonts noto-fonts-cjk noto-fonts-emoji npm otf-font-awesome pipewire pipewire-alsa pipewire-jack pipewire-pulse rust sudo system-config-printer thunar thunar-archive-plugin thunar-volman tmux tree-sitter-cli ttf-dejavu ttf-droid ttf-fantasque-nerd ttf-fira-code ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-liberation tumbler ufw unzip usbutils vifm vim wireplumber xarchiver xdg-desktop-portal-gtk yazi yt-dlp zram-generator zsh
```

# Example เพื่มเติมสำหรับ Display Server
### Install Wayland Packages
```bash
 sudo pacman -S grim slurp swaybg wf-recorder wmenu xdg-desktop-portal-wlr xorg-xwayland
```
### Install X11 Packages
```bash
 sudo pacman -S dmenu i3-wm i3lock i3status xorg-server xorg-xinit
```

# ติดตั้ง yay Install yay
```bash
 git clone https://aur.archlinux.org/yay.git
 cd yay
 makepkg -si
```
## ติดตั้งแพคเกจ ที่ต้องติดตั้งผ่าน yay
```bash
 yay -S swayfx vesktop-bin brave-bin 
```

## เพิ่มเติมติดตั้งเกม minecraft bedrock
```bash
 flatpak install flathub 
 io.mrarm.mcpelauncher
```

# คำสั่งในการเปิดใช้งานระบบ
## เสียง
