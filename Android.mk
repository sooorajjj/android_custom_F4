LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),F4)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
