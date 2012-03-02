#!/bin/sh
var() {
    cat Makefile.am | grep "^$1 = " | sed "s/$1 = //g"
}

edit_abuild() {
    sed "s#@@$1@@#$(var $2)#g" -i ABUILD
}

cp TEMPLATE ABUILD
wget http://icedtea.classpath.org/hg/icedtea7/raw-file/tip/Makefile.am
edit_abuild UPDATE JDK_UPDATE_VERSION
for item in CORBA HOTSPOT JAXP JAXWS JDK LANGTOOLS OPENJDK; do
    edit_abuild $item ${item}_CHANGESET
done
mkpkg $@
rm Makefile.am
rm ABUILD
