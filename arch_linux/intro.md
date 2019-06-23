# NOTE
Steps for installing Arch Linux

# STEPS
* check internet. ping baidu.com
* update the system clock: timedatectl set-ntp true
* partition the disk : cfdisk
        1. one for / (say /dev/sda1)
        2. another for efi (if uefi is enabled)
* format paritions : 
        1. makfs.ext4 /dev/sda1
        2. makfs.ext4 /dev/sda2
* mount /dev/sda1 /mnt
  mkdir /mnt/boot
  mount /dev/sda2 /mnt/boot
* pacstrap /mnt base base-devel
* genfstab -U /mnt >> /mnt/etc/fstab
* arch-chroot /mnt
* ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
* hwclock --systohc
* Uncomment en_US.UTF-8 UTF-8 and other needed locales in /etc/locale.gen, and generate them with: locale-gen
* set LANG variable in /etc/locale.conf
        ** say LANG=en_US.UTF-8
* create hostname in /etc/hostname
* bootloader
        * pacman -S grub os-rober
        * grub-install /dev/sda
        * grub-mkconfig -o /boot/grub/grub.cfg
* passwd for root


* about bootloader

# arch-chroot: failed
        arch-linux keyring
# dhcpcd enp2s0
# first mount root, and then mount /dev/sda2
