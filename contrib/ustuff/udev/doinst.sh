config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

# This should catch *all* files in /etc/modprobe.d/ and move them over to
# have .conf extensions
for modfile in $(ls etc/modprobe.d/ | grep -v "\.\(conf\|bak\|orig\|new\)"); do
  if [ -e etc/modprobe.d/$modfile -a ! -e etc/modprobe.d/$modfile.conf ]; then
    mv etc/modprobe.d/$modfile etc/modprobe.d/$modfile.conf
  elif [ -e etc/modprobe.d/$modfile -a -e etc/modprobe.d/$modfile.conf ]; then
    mv etc/modprobe.d/$modfile etc/modprobe.d/$modfile.bak
  fi
done

config etc/modprobe.d/blacklist.conf.new
config etc/modprobe.d/isapnp.conf.new
config etc/modprobe.d/psmouse.conf.new
config etc/modprobe.d/usb-controller.conf.new
config etc/conf.d/udev.new
