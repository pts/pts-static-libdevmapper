#! /bin/bash --
BINPREFIX='/home/pts/prg/pts-mini-gpl/uevalrun/cross-compiler/bin/i686-'
CC="${BINPREFIX}gcc -static -fno-stack-protector"
AR="${BINPREFIX}ar"
RANLIB="${BINPREFIX}ranlib"

set -ex
rm -f *.o *.a
# No -DUDEV_SYNC_SUPPORT
$CC -s -Os -W -Wall -Iioctl -Imisc -I. \
    -DDM_IOCTLS -c \
    -Wno-unused-parameter -Wno-sign-compare \
    datastruct/bitset.c datastruct/hash.c datastruct/list.c libdm-common.c \
    libdm-file.c libdm-deptree.c libdm-string.c libdm-report.c \
    mm/dbg_malloc.c mm/pool.c regex/matcher.c regex/parse_rx.c regex/ttree.c \
    ioctl/libdm-iface.c
$AR cr libdevmapper.a *.o
$RANLIB libdevmapper.a

$CC -s -Os -W -Wall -Iioctl -Imisc -I. \
    -DHAVE_SYS_STATVFS_H -DHAVE_SYS_IOCTL_H -DHAVE_TERMIOS_H -DHAVE_GETLINE \
    -DHAVE_GETOPTLONG \
    -Wno-unused-parameter \
    -o dmsetup dmsetup.c libdevmapper.a
: c.sh OK.
