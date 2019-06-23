# Installing Arch Linux

## Boot with your flash memory

## Check Internet Connection

## Create partitions : cfdisk
-[] /     (/dev/sda1)
-[] /boot (/dev/sda2)
-[] /home (/dev/sda3)

## Format your partitions
-[] mkfs.ext4 /dev/sda1
-[] mkfs.ext4 /dev/sda2
-[] mkfs.ext4 /dev/sda3

## Mount /dev/sda1
-[] mount /dev/sda1 /mnt

## Start Installing
-[] pacstrap /mnt base base-devel

## Generate file system table
-[] genfstab /mnt >> /mnt/etc/fstab

## Configuration
-[] arch-chroot /mnt /bin/bash
-[] vi /etc/locale.gen
-[] locale-gen
......

# pacman -S grub os-rober
# grub-install /dev/sda
# grub-mkconfig -o /boot/grub/grub.cfg
