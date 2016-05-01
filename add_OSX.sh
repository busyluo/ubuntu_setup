#add menuentry

sudo echo "menuentry \"OS X\" {
  set root=(hd0,1)
  linux16 /memdisk iso raw
  initrd16 /clover.iso
}" >> /etc/grub.d/40_custom
sudo update-grub
