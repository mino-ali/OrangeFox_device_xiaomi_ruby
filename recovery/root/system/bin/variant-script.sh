#!/system/bin/sh
#
# set some props, depending on device
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

setdevicename() {
    resetprop "ro.product.device" "$1"
    resetprop "ro.product.vendor.device" "$1"
    resetprop "ro.product.odm.device" "$1"
    resetprop "ro.build.product" "$1"
    resetprop "ro.product.system.device" "$1"
    resetprop "ro.product.system_ext.device" "$1"
}


setdevicemodel() {
    resetprop "ro.product.model" "$1"
    resetprop "ro.product.odm.model" "$1"
    resetprop "ro.product.system.model" "$1"
    resetprop "ro.product.vendor.model" "$1"
    resetprop "ro.product.system_ext.model" "$1"
    resetprop "ro.product.product.model" "$1"
    
    resetprop "ro.product.marketname" "$1"
    resetprop "ro.product.odm.marketname" "$1"
    resetprop "ro.product.vendor.marketname" "$1"
    resetprop "bluetooth.device.default_name" "$1"
    resetprop "vendor.usb.product_string" "$1"
}

# -------------------------------------------->

do_rubyplus() {
    setdevicename "rubyplus"
    setdevicemodel "Redmi Note 12 Pro+ 5G"
}

do_rubypro() {
    setdevicename "rubypro"
    setdevicemodel "Redmi Note 12 Discovery"
}

do_ruby() {
    setdevicename "ruby"
    setdevicemodel "Redmi Note 12 Pro 5G"
}

# -------------------------------------------->

  sku=$(resetprop "ro.boot.product.hardware.sku")

  case "$sku" in

   "rubyplus")
	do_rubyplus
	;;
   "rubypro")
	do_rubypro
	;;
    *)
	do_ruby
	;;

  esac

# -------------------------------------------->
exit 0

#
