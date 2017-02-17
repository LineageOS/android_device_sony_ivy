#
# Copyright (C) 2016 The CyanogenMod Project
#               2017-2018 The LineageOS Project
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

include device/sony/kitakami-common/BoardConfigCommon.mk

DEVICE_PATH := device/sony/ivy

# Use Snapdragon LLVM, if available
TARGET_USE_SDCLANG := true

# Assert
TARGET_OTA_ASSERT_DEVICE := E6533,E6553,ivy,ivy_dsds

# Boot image/kernel
TARGET_KERNEL_CONFIG := kitakami_ivy_defconfig

# CM hardware
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/cmhw
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/input/clearpad/wakeup_gesture"

# Init
TARGET_INIT_VENDOR_LIB := libinit_ivy

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5513412608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 24763154432 # 24763170816-16384

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Radio
BOARD_HAVE_RADIO := true

# Wifi
WIFI_BUS := PCIE

# Inherit from the proprietary version
-include vendor/sony/ivy/BoardConfigVendor.mk

# TWRP
VENDOR_PATH := vendor/sony/ivy
VENDOR_COMMON_PATH := vendor/sony/kitakami-common
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone12/temp
PRODUCT_COPY_FILES += bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_MAX_BRIGHTNESS := 1000
TW_DEFAULT_BRIGHTNESS := 800
TW_INCLUDE_FUSE_EXFAT := true
TW_EXCLUDE_SUPERSU := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_NEW_ION_HEAP := true
TW_TARGET_USES_QCOM_BSP := true
TW_INCLUDE_CRYPTO := true
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p42"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"

# TWRP Qualcomm crypto blobs
TW_RECOVERY_ADDITIONAL_RELINK_FILES += ${VENDOR_PATH}/proprietary/bin/qseecomd
PRODUCT_COPY_FILES += \
   ${VENDOR_PATH}/proprietary/vendor/lib64/libQSEEComAPI.so:recovery/root/vendor/lib64/libQSEEComAPI.so \
   ${VENDOR_PATH}/proprietary/vendor/lib64/libdrmfs.so:recovery/root/vendor/lib64/libdrmfs.so \
   ${VENDOR_COMMON_PATH}/proprietary/vendor/lib64/libdiag.so:recovery/root/vendor/lib64/libdiag.so \
   ${VENDOR_PATH}/proprietary/vendor/lib64/librpmb.so:recovery/root/vendor/lib64/librpmb.so \
   ${VENDOR_PATH}/proprietary/vendor/lib64/libssd.so:recovery/root/vendor/lib64/libssd.so \
   ${VENDOR_PATH}/proprietary/vendor/lib64/libsecureui.so:recovery/root/vendor/lib64/libsecureui.so \
   ${VENDOR_PATH}/proprietary/vendor/lib64/lib-sec-disp.so:recovery/root/vendor/lib64/lib-sec-disp.so \
   ${VENDOR_PATH}/proprietary/vendor/lib64/libStDrvInt.so:recovery/root/vendor/lib64/libStDrvInt.so \
   ${VENDOR_PATH}/proprietary/vendor/lib64/libsecureui_svcsock.so:recovery/root/vendor/lib64/libsecureui_svcsock.so \
   ${VENDOR_PATH}/proprietary/vendor/lib64/libdrmtime.so:recovery/root/vendor/lib64/libdrmtime.so \
   ${VENDOR_COMMON_PATH}/proprietary/vendor/lib64/libtime_genoff.so:recovery/root/vendor/lib64/libtime_genoff.so \
   ${VENDOR_COMMON_PATH}/proprietary/vendor/lib64/hw/keystore.msm8994.so:recovery/root/vendor/lib64/hw/keystore.msm8994.so \
   ${VENDOR_COMMON_PATH}/proprietary/etc/firmware/cmnlib.mdt:recovery/root/lib/firmware/cmnlib.mdt \
   ${VENDOR_COMMON_PATH}/proprietary/etc/firmware/cmnlib.b00:recovery/root/lib/firmware/cmnlib.b00 \
   ${VENDOR_COMMON_PATH}/proprietary/etc/firmware/cmnlib.b01:recovery/root/lib/firmware/cmnlib.b01 \
   ${VENDOR_COMMON_PATH}/proprietary/etc/firmware/cmnlib.b02:recovery/root/lib/firmware/cmnlib.b02 \
   ${VENDOR_COMMON_PATH}/proprietary/etc/firmware/cmnlib.b03:recovery/root/lib/firmware/cmnlib.b03
