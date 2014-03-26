#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
PRODUCT_PACKAGE_OVERLAYS += device/htc/msm7x30-common/overlay

COMMON_PATH := device/htc/msm7x30-common

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_COPY_FILES += \
	device/htc/msm7x30-common/init.htc7x30.usb.rc:root/init.htc7x30.usb.rc

# Common 7x30 firmware
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
	$(COMMON_PATH)/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
	$(COMMON_PATH)/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
	$(COMMON_PATH)/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
	$(COMMON_PATH)/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
	$(COMMON_PATH)/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
	$(COMMON_PATH)/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw

# media configs
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
	$(COMMON_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
	$(COMMON_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf

# Camera
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/prebuilt/libsurfaceflinger_client.so:system/lib/libsurfaceflinger_client.so

PRODUCT_PACKAGES += \
    camera.msm7x30

# adb hack
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/system/etc/init.d/20fixup:system/etc/init.d/20fixup

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.primary.msm7x30 \
	audio_policy.msm7x30 \
	libaudio-resampler \
	libaudioparameter

# Video
PRODUCT_PACKAGES += \
	copybit.msm7x30 \
	gralloc.msm7x30 \
	hwcomposer.msm7x30

# Wifi
PRODUCT_PACKAGES += \
	libnetcmdiface

# HAL
PRODUCT_PACKAGES += \
	power.msm7x30 \
	lights.msm7x30 \
	sensors.msm7x30

# Media
PRODUCT_PACKAGES += \
	libOmxCore \
	libOmxVdec \
	libOmxVenc \
	libmm-omxcore \
	libc2dcolorconvert \
	libstagefrighthw

# Misc
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory \
	setup_fs

# Torch
PRODUCT_PACKAGES += \
	Torch

# DeviceSettings
PRODUCT_PACKAGES += \
	DeviceSettings

# Proximity Recalibrator
PRODUCT_PACKAGES += \
	ProximityRecalibrator

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.supplicant_scan_interval=15 \
	ro.com.google.locationfeatures=1 \
	ro.product.locale.language=en \
	ro.product.locale.region=US \
	ro.use_data_netmgrd=true \
	ro.tethering.kb_disconnect=1

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
	com.qc.hardware=true \
	debug.composition.type=gpu \
	debug.sf.hw=1 \
	debug.egl.hw=1 \
	debug.egl.recordable.rgba8888=1

# Low Power Audio
PRODUCT_PROPERTY_OVERRIDES += \
	lpa.decode=false \
	lpa.use-stagefright=false

# Resampler quality
PRODUCT_PROPERTY_OVERRIDES += \
	af.resampler.quality=255

# Set default USB interface
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage,adb

# Extra debugging props
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1
