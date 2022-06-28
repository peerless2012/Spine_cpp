LOCAL_PATH := $(call my-dir)

###########################
#
# SDL shared library
#
###########################
#
#include $(CLEAR_VARS)
#
#LOCAL_MODULE := SDL2_spine
#
#SPINE_PATH := spine-cpp
#
#LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(SPINE_PATH)/include \
#		 $(LOCAL_PATH)/../spine_sdl/include/spine
#
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)
#
#LOCAL_SRC_FILES := \
#		$(subst subst $(LOCAL_PATH)/,, \
#		$(wildcard $(LOCAL_PATH)/$(SPINE_PATH)/src/spine/*.cpp) \
#		$(wildcard $(LOCAL_PATH)/../spine_sdl/src/spine/*.cpp) \
#		)
#
#LOCAL_CFLAGS += -DGL_GLEXT_PROTOTYPES -Wall -Wextra -pedantic -std=c89
#
#LOCAL_CFLAGS += -Wall -Wextra -Wnon-virtual-dtor -pedantic -std=c++11 -fno-exceptions -fno-rtti
#
## Warnings we haven't fixed (yet)
#LOCAL_CFLAGS += -Wno-unused-parameter -Wno-sign-compare
#
#LOCAL_LDLIBS := -ldl -lGLESv1_CM -lGLESv2 -lOpenSLES -llog -landroid
#
#ifeq ($(NDK_DEBUG),1)
#    cmd-strip :=
#endif
#
#LOCAL_SHARED_LIBRARIES := SDL2 SDL2_image
#
#include $(BUILD_SHARED_LIBRARY)

##########################
#
# SDL static library
#
##########################

include $(CLEAR_VARS)

LOCAL_MODULE := Spine_static

LOCAL_MODULE_FILENAME := libSpine

SPINE_PATH := spine-cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(SPINE_PATH)/include

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)

LOCAL_SRC_FILES := \
		$(subst subst $(LOCAL_PATH)/,, \
		$(wildcard $(LOCAL_PATH)/$(SPINE_PATH)/src/spine/*.cpp) \
		)

LOCAL_CFLAGS += -DGL_GLEXT_PROTOTYPES -Wall -Wextra -pedantic -std=c89

LOCAL_CFLAGS += -Wall -Wextra -Wnon-virtual-dtor -pedantic -std=c++11 -fno-exceptions -fno-rtti

# Warnings we haven't fixed (yet)
LOCAL_CFLAGS += -Wno-unused-parameter -Wno-sign-compare

ifeq ($(NDK_DEBUG),1)
    cmd-strip :=
endif

include $(BUILD_STATIC_LIBRARY)