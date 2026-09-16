/* ruby-detect-variant | logging-ruby.hpp */

/*
 * Copyright (C) 2024 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#if !defined(__LOGGING_RUBY__)
#define __LOGGING_RUBY__

#if defined(__IS_USES_LOGGING_FEATURES__) || defined(__LOG_WRITER_INCLUDED__)
    /* log targets */
    #define RECOVERY_LOG_TARGET  "recovery"
    #define ANDROID_LOG_TARGET   "logcat"

    /* log tags */
    #define DETINF_INFO_TAG      "I"
    #define DETINF_ERR_TAG       "E"
    #define DETINF_WARN_TAG      "W"
    #define DETINF_LOG_TAG       "ruby-detect-variant"

    /**
     * from system/logging/liblog/include/android/log_macros.h
     * warning: edited
     */

    #include <sys/cdefs.h>
    #include <android/log.h>

    __BEGIN_DECLS

    #define LOGINF(...) __android_log_print(ANDROID_LOG_INFO, DETINF_LOG_TAG, __VA_ARGS__)
    #define LOGERR(...) __android_log_print(ANDROID_LOG_ERROR, DETINF_LOG_TAG, __VA_ARGS__)
    #define LOGWARN(...) __android_log_print(ANDROID_LOG_WARN, DETINF_LOG_TAG, __VA_ARGS__)

    __END_DECLS

#endif /* __IS_USES_LOGGING_FUNCS__ */

#endif /* __LOGGING_RUBY__ */

/* end */
