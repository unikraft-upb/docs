#!/bin/bash
LIB_DIR="libs"
LIBS=("lib-googletest" "lib-libcxx" "lib-libcxxabi" "lib-libunwind" "lib-compiler-rt" "lib-newlib")

if test ! -d unikraft; then
    git clone "https://github.com/unikraft/unikraft"
fi

if test ! -d $LIB_DIR; then
       mkdir $LIB_DIR
fi

for AUX in "${LIBS[@]}"
do
	if test ! -d "$LIB_DIR/$AUX"; then
		git clone "https://github.com/unikraft/$AUX.git" "$LIB_DIR/$AUX"
	fi
	test -d "$LIB_DIR/$AUX/.git" && rm -fr "$LIB_DIR/$AUX/.git"
done