LOCAL_PATH := $(call my-dir)

SS_BASE = $(LOCAL_PATH)/lib_stardict
GLIB_BASE = $(LOCAL_PATH)/thirdparty/glib

include $(CLEAR_VARS)

LOCAL_MODULE := glib
LOCAL_SRC_FILES := $(GLIB_BASE)/lib/libglib-2.0.so
#include $(PREBUILT_STATIC_LIBRARY)
include $(PREBUILT_SHARED_LIBRARY)
GLIB_INCLUDE_DIR = $(GLIB_BASE)/include

include $(CLEAR_VARS)

LOCAL_C_INCLUDES += $(SS_BASE)
LOCAL_C_INCLUDES += $(GLIB_INCLUDE_DIR)
LOCAL_C_INCLUDES += $(GLIB_INCLUDE_DIR)/glib
LOCAL_C_INCLUDES += $(SS_BASE)/Private

LOCAL_SRC_FILES := $(SS_BASE)/cls_stardict.cpp \
				   $(SS_BASE)/Private/clsStarDict_p.cpp \
				   $(SS_BASE)/Private/dictziplib.cpp \
				   $(SS_BASE)/Private/distance.cpp
LOCAL_SRC_FILES += $(LOCAL_PATH)/lib_stardict/dict_demo.cpp

LOCAL_LDLIBS := -landroid -llog -ldl -lm -lz
LOCAL_CFLAGS   := -O2 -fvisibility=hidden -fomit-frame-pointer -fstrict-aliasing -ffunction-sections -fdata-sections -ffast-math -ftree-vectorize -fPIC -Ofast -ffast-math -w -Wall
LOCAL_CPPFLAGS := -O2 -fvisibility=hidden -fvisibility-inlines-hidden -fomit-frame-pointer -fstrict-aliasing -ffunction-sections -fdata-sections -ffast-math -fPIC -Ofast -ffast-math -std=c++11 -Wall
LOCAL_LDFLAGS  += -Wl,--gc-sections

LOCAL_SHARED_LIBRARIES := glib

LOCAL_MODULE     := star_dict_demo

#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_EXECUTABLE)
