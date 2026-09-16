/* ruby-detect-variant | variants.hpp */

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

#if !defined(__VARIANTS__)
#define __VARIANTS__

/* variants */
#if defined(__VARIANT_LOADER_INCLUDED__) || defined(__RUBY_VARIANT_SET_INCLUDED__)
    #define TARGET_1ND_DEVICE_NAME    "ruby"
    #define TARGET_2ND_DEVICE_NAME    "rubypro"
    #define TARGET_1ND_DEVICE_MODEL   "22101316G"
    #define TARGET_2ND_DEVICE_MODEL   "22101316UCP"
#endif /* __VARIANT_LOADER_INCLUDED__ or __RUBY_VARIANT_SET_INCLUDED__ */

/* device information to be installed by default. you can change it. just rubypro or ruby */
#if defined(__RUBY_VARIANT_SET_INCLUDED__)
    #define DEFAULT_DEVICE   "ruby"
#endif /* __RUBY_VARIANT_SET_INCLUDED__ */

#endif /* __VARIANTS__ */

/* end */
