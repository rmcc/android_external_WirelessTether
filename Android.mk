LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

## 'tests' to work around the lack of localization
LOCAL_MODULE_TAGS := optional tests

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := Tether

## Force it to install on /system
LOCAL_MODULE_PATH := $(TARGET_OUT)/system/app

#LOCAL_PROGUARD_FLAGS := -include $(LOCAL_PATH)/proguard.flags

include $(BUILD_PACKAGE)


LOCAL_PATH := $(LOCAL_PATH)/native/libnativetask

include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE:=false

LOCAL_SRC_FILES := android_tether_system_NativeTask.c 

LOCAL_SHARED_LIBRARIES := libcutils

LOCAL_C_INCLUDES += $(JNI_H_INCLUDE)

LOCAL_MODULE := libnativetask

include $(BUILD_SHARED_LIBRARY)
