if ! rc-update | grep -q udev-postmount; then
    rc-update add udev-postmount sysinit
fi
