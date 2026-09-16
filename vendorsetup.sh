#!/usr/bin/env bash
#
# OrangeFox build variables for Xiaomi Redmi Note 12 Pro / Pro+ / Discovery (ruby/rubyx)
#

export FOX_BUILD_DEVICE="ruby"
export FOX_TARGET_DEVICES="ruby,rubyx,rubypro,rubyplus,ruby_pro,ruby_plus"
export PRODUCT_DEVICE="ruby"

# Recovery-as-Boot (MediaTek MT6877 uses boot partition for recovery)
export FOX_VIRTUAL_AB_DEVICE=1
export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"
export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/by-name/boot"
export FOX_REPLACE_BOOTIMAGE_RAMDISK=1

# Display geometry (1080x2400 with center punch hole camera)
export OF_SCREEN_H=2400
export OF_STATUS_H=100
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_CLOCK_POS=0
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_USE_GREEN_LED=0
export OF_FL_PATH1="/sys/class/leds/torch-light0"

# Magisk & AVB
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_PATCH_AVB20=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1

# Maintainer & Versioning
[ -n "$OF_MAINTAINER" ] || export OF_MAINTAINER="${USER^}"
export FOX_BUILD_TYPE="Unofficial"

# Android 16 target & Keymaster
export PLATFORM_VERSION="16"
export PLATFORM_VERSION_LAST_STABLE="16"
export PLATFORM_SECURITY_PATCH="2099-12-31"
export OF_DEFAULT_KEYMASTER_VERSION="4.1"

# Utilities & Compression
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_GREP_BINARY=1
export FOX_USE_XZ_UTILS=1
export OF_USE_LZMA_COMPRESSION=1

# Dynamic partitions & Quick backup
export OF_ENABLE_LPTOOLS=1
export OF_QUICK_BACKUP_LIST="/boot;/data;"

# Metadata & Encryption
export OF_WIPE_METADATA_AFTER_DATAFORMAT=1
export OF_REFRESH_ENCRYPTION_PROPS_BEFORE_FORMAT=1

# Battery HAL (MediaTek health HAL hangs without legacy sysfs reading)
export OF_USE_LEGACY_BATTERY_SERVICES=1

# Apply device-specific source patches
_FOX_DIR="$(dirname "${BASH_SOURCE[0]}")"
_TOP_DIR="$(gettop 2>/dev/null || pwd)"

if [ -d "$_FOX_DIR/patches" ]; then
    if [ -f "$_FOX_DIR/patches/bootable_recovery.patch" ] && [ -d "$_TOP_DIR/bootable/recovery" ]; then
        if (cd "$_TOP_DIR/bootable/recovery" && git apply --check "$_FOX_DIR/patches/bootable_recovery.patch" >/dev/null 2>&1); then
            echo "-- [ruby] Applying patch to bootable/recovery..."
            (cd "$_TOP_DIR/bootable/recovery" && git apply "$_FOX_DIR/patches/bootable_recovery.patch")
        fi
    fi
    if [ -f "$_FOX_DIR/patches/system_update_engine.patch" ] && [ -d "$_TOP_DIR/system/update_engine" ]; then
        if (cd "$_TOP_DIR/system/update_engine" && git apply --check "$_FOX_DIR/patches/system_update_engine.patch" >/dev/null 2>&1); then
            echo "-- [ruby] Applying patch to system/update_engine..."
            (cd "$_TOP_DIR/system/update_engine" && git apply "$_FOX_DIR/patches/system_update_engine.patch")
        fi
    fi
fi
unset _FOX_DIR _TOP_DIR
