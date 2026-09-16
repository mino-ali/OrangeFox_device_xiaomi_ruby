/* ruby-detect-variant | load-variant.cpp */

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

#define __VARIANT_LOADER_INCLUDED__
#define __IS_USES_LOGGING_FEATURES__

#include <iostream>
#include <sys/stat.h>
#include <resetprop.hpp>
#include <ruby-detect-variant.hpp>
#include <logging-ruby.hpp>
#include <variants-ruby.hpp>

void cmdline_logging();

using namespace std;

void load_variant(const char* target_variant, const char* target_model)
{
    static bool static_prop_svc = true;

    /* detect target variant */
    if (strcmp(target_variant, TARGET_1ND_DEVICE_NAME) == 0)
    {
        LOGINF("loading ruby variant...");
        write_recovery_log("loading ruby variant...", DETINF_INFO_TAG);
    }
    else if (strcmp(target_variant, TARGET_2ND_DEVICE_NAME) == 0)
    {
        LOGINF("loading rubypro variant...");
        write_recovery_log("loading rubypro variant...", DETINF_INFO_TAG);
    }

    umask(0);
    cmdline_logging();

    /* apply properties */
    setprop("ro.product.name", target_variant, static_prop_svc);
    setprop("ro.build.product", target_variant, static_prop_svc);
    setprop("ro.vendor.product.device", target_variant, static_prop_svc);
    setprop("ro.vendor.product.device", target_variant, static_prop_svc);
    setprop("ro.system.product.device", target_variant, static_prop_svc);
    setprop("ro.system_ext.product.device", target_variant, static_prop_svc);
    setprop("ro.product.device", target_variant, static_prop_svc);
    setprop("ro.product.product.device", target_variant, static_prop_svc);
    setprop("ro.product.bootimage.device", target_variant, static_prop_svc);
    setprop("ro.product.odm.device", target_variant, static_prop_svc);
    setprop("ro.product.system.device", target_variant, static_prop_svc);
    setprop("ro.product.system_ext.device", target_variant, static_prop_svc);
    setprop("ro.product.vendor.device", target_variant, static_prop_svc);
    setprop("ro.product.board", target_variant, static_prop_svc);

    setprop("ro.product.model", target_model, static_prop_svc);
    setprop("ro.product.vendor.model", target_model, static_prop_svc);
    setprop("ro.product.odm.model", target_model, static_prop_svc);
    setprop("ro.product.system.model", target_model, static_prop_svc);
    setprop("ro.product.system_ext.model", target_model, static_prop_svc);
    setprop("ro.product.product.model", target_model, static_prop_svc);
}

/* end */
