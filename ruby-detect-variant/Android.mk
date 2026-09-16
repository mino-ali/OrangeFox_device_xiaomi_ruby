# By YZBruh

# Copyright (C) 2024 The Android Open Source Project
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
LIBRESETPROP_RUBY := libresetprop_ruby

include $(CLEAR_VARS)

# general libresetprop_ruby variables
LOCAL_MODULE := $(LIBRESETPROP_RUBY)
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MULTILIB := first
LOCAL_STATIC_LIBRARIES := libnanopb libmagisksystemproperties libmagiskutils
LOCAL_SHARED_LIBRARIES := liblog libselinux
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/system/lib64
LOCAL_C_INCLUDES := \
    $(LIBRESETPROP_RUBY) \
    external/magisk-prebuilt/include \
    external/magisk-prebuilt/utils/include \
    external/magisk-prebuilt/external/nanopb \
    external/magisk-prebuilt/systemproperties \
    external/magisk-prebuilt/systemproperties/include \
    bionic/libc \
    bionic/libc/include \
    system/core/base/include \
    system/core/init \
    system/logging/liblog/include

LOCAL_SRC_FILES := \
    $(LIBRESETPROP_RUBY)/persist.cpp \
    $(LIBRESETPROP_RUBY)/resetprop.cpp

LOCAL_CFLAGS = \
    -D__MVSTR="TWRP-dynamic" \
    -D__MCODE="ed58cf9" \
    -Wno-implicit-fallthrough \
    -std=c++17 \
    -Wno-unused-parameter

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

# general ruby-detect-variant variables
LOCAL_MODULE := ruby-detect-variant
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/system/bin
LOCAL_SRC_FILES := \
    ruby-detect-variant.cpp \
    write-recovery-log.cpp \
    load-variant.cpp

LOCAL_CFLAGS := \
    -std=c++17 \
    -O3 \
    -Wall \
    -g

LOCAL_C_INCLUDES := \
    external/magisk-prebuilt/include \
    $(LOCAL_PATH)/include \
    system/core/base/include \
    system/core/init \
    system/logging/liblog/include

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libresetprop_ruby \
    libselinux

LOCAL_STATIC_LIBRARIES := \
    libnanopb \
    libmagisksystemproperties \
    libmagiskutils

include $(BUILD_EXECUTABLE)
