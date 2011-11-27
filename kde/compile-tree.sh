#!/bin/bsh
root=$(pwd)
for dir in $(find -name ABUILD | sed s/ABUILD//); do
	cd $dir;
	mkpkg $@
	cd $root
done	
