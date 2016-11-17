# tree from @wesbos
function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.cache|__pycache__|.git|node_modules|.vagrant|.DS_Store' --dirsfirst --filelimit 30 -L ${1:-3} -aC $2
}

# mount usb
function usb() {
    U="$(sudo fdisk -l | grep FAT | awk -F' ' '{print $1}')"
    sudo mount -t vfat $U /media/usb -o uid=1000,gid=1000,utf8,dmask=027,fmask=137
}
