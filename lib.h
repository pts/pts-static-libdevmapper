#ifndef _LVM_LIB_H
#define _LVM_LIB_H

#define _REENTRANT
#define _GNU_SOURCE
#define _FILE_OFFSET_BITS 64

#define DM_LIB_VERSION "1.02.39 (2009-10-26)"
#define PRIsize_t "zu"
#define PRIptrdiff_t "td"
#define PRIpid_t PRId32
#ifndef DM_DEVICE_UID
#define DM_DEVICE_UID 0
#endif
#ifndef DM_DEVICE_GID
#define DM_DEVICE_GID 0
#endif
#ifndef DM_DEVICE_MODE
#define DM_DEVICE_MODE 0600
#endif

#include "libdevmapper.h"
#include "dm-logging.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <inttypes.h>

#endif
