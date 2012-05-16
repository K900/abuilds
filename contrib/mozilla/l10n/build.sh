#!/bin/sh
locale=$1
shift
cat TEMPLATE | sed s/@LOCALE@/$locale/g > ABUILD
mkpkg $@
rm ABUILD
