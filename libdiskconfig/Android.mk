LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifneq ($(TARGET_SIMULATOR),true)

include $(CLEAR_VARS)

commonSources := \
	diskconfig.c \
	diskutils.c \
	write_lst.c \
	config_mbr.c

LOCAL_SRC_FILES := $(commonSources)
LOCAL_MODULE := libdiskconfig
LOCAL_SYSTEM_SHARED_LIBRARIES := libcutils liblog libc

include $(BUILD_SHARED_LIBRARY)

# static library for host
include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(commonSources)
LOCAL_CFLAGS := -O2 -g -W -Wall -Werror -D_LARGEFILE64_SOURCE
LOCAL_MODULE := libdiskconfig_host
LOCAL_STATIC_LIBRARIES := libcutils

include $(BUILD_HOST_STATIC_LIBRARY)

endif  # ! TARGET_SIMULATOR
