#! /bin/sh
#
# tic.sh
# Copyright (C) 2021 Adrian Perez de Castro <aperez@igalia.com>
#
# Distributed under terms of the MIT license.
#

set -e

TIC=$1
DIR=$2
I=$3
O=$4

if [ -z "$TIC" ] || [ -z "$DIR" ] || [ -z "$I" ] || [ -z "$O" ] ; then
	echo "Usage: $0 <tic path> <work dir> <input> <output>" 1>&2
	exit 1
fi

"$TIC" -x -o "$DIR" "$I"
ln -f "$DIR/x/xterm-termite" "$O"
