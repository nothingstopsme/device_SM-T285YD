LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libstlport_static
LOCAL_MODULE_SUFFIX := .a
LOCAL_SRC_FILES := ../../../../prebuilts/ndk/current/sources/cxx-stl/stlport/libs/armeabi-v7a/libstlport_static.a
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_PATH :=
LOCAL_ADDITIONAL_DEPENDENCIES :=
LOCAL_POST_INSTALL_CMD :=

include $(BUILD_PREBUILT)



include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
		_stdexcept_base.cpp

#LOCAL_C_INCLUDES :=
#LOCAL_SHARED_LIBRARIES :=

LOCAL_WHOLE_STATIC_LIBRARIES := libstlport_static

LOCAL_MODULE := libstlport
LOCAL_MODULE_TAGS := optional
#LOCAL_ADDITIONAL_DEPENDENCIES += INSTALLED_KERNEL_HEADERS

include $(BUILD_SHARED_LIBRARY)
