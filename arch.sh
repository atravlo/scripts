iwctl
device list
station wlan0 connect ИМЯ_СЕТИ
exit

lsblk
cfdisk 

mkfs.fat -F32 /dev/sda1 if efi exist
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

timedatectl set-ntp true
pacman -Sy archlinux-keyring

pacman-key --init
pacman-key --populate archlinux

pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Kyiv /etc/localtime
hwclock --systohc

gedit  /etc/locale.gen
# раскомментируй en_US.UTF-8 UTF-8 173 line
locale-gen

echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf

echo mypc > /etc/hostname

passwd

pacman -S grub efibootmgr

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

exit
umount -R /mnt
reboot

systemctl enable –now NetworkManager

pacman -S узнать у ии для рабочегг стола



useradd -m -G wheel -s /bin/bash artem
passwd artem

EDITOR=vim visudo
# %wheel ALL=(ALL:ALL) ALL

pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S google-chrome visual-studio-code-bin

docker
node

