#!/bin/sh
build_dep() {
	pushd dependencies/$1
	mkpkg -pod ~/openjdk7-packages/ -si
	popd
}

echo "=== Starting compilation..."
echo "=== You need sudo access!"

rm -rf openjdk7-packages/
mkdir -p openjdk7-packages/

build_dep ca-certificates
build_dep ca-certificates-java
build_dep eclipse-ecj
build_dep giflib
build_dep lcms2
build_dep rhino
build_dep run-parts
build_dep xalan-java
build_dep xerces2-java
build_dep zlib

mkpkg -pod openjdk7-packages/
echo "=== Your packages are in openjdk7-packages/"
echo "=== Enjoy!"
