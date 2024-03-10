#
# Copyright (C) 2020-2022 The LineageOS Project
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

COMMON_PATH := device/samsung/a21s-common

## Include path
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

## Inherit proprietary vendor configuartion
include vendor/samsung/a21s-common/BoardConfigVendor.mk

## Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55
TARGET_CPU_SMP := true

## Architecture (Secondary)
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15

## Bluetooth
BOARD_HAVE_BLUETOOTH_SLSI := true

## Boot Image
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_CUSTOM_BOOTIMG := true
BOARD_DTB_OFFSET := 0x00000000
BOARD_BOOT_HEADER_NAME       := SRPTB19D011
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_SECOND_OFFSET := 0xf0000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100

## Boot Image Arguements
BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --board $(BOARD_BOOT_HEADER_NAME)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_KERNEL_CMDLINE += androidboot.hardware=exynos850 androidboot.selinux=enforce loop.max_part=7

# Broken build rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

## DTB
BOARD_DTB_CFG := $(COMMON_PATH)/configs/kernel/exynos3830.cfg

## DTBO
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_DTBO_CFG := $(COMMON_PATH)/configs/kernel/$(TARGET_DEVICE).cfg

# Fingerprint
TARGET_SEC_FP_REQUEST_FORCE_CALIBRATE := true

## Kernel
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_SOURCE := kernel/samsung/universal3830
TARGET_KERNEL_ADDITIONAL_FLAGS := HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_PATH := /home/risky/LineageOS/device/samsung/proton-clang

## Keymaster
TARGET_KEYMASTER_VARIANT := samsung

## Manifest
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml
ODM_MANIFEST_SKUS := hce hceese hcesim hcesimese disabled
ODM_MANIFEST_NFC_FILE := $(COMMON_PATH)/configs/nfc/odm_nfc_manifest.xml
ODM_MANIFEST_HCE_FILES := $(ODM_MANIFEST_NFC_FILE)
ODM_MANIFEST_HCEESE_FILES := $(ODM_MANIFEST_NFC_FILE)
ODM_MANIFEST_HCESIM_FILES := $(ODM_MANIFEST_NFC_FILE)
ODM_MANIFEST_HCESIMESE_FILES := $(ODM_MANIFEST_NFC_FILE)
ODM_MANIFEST_DISABLED_FILES := $(COMMON_PATH)/configs/nfc/odm_nfc_manifest_disabled.xml

## Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS := efs logs

# system/core and build/make
AB_OTA_UPDATER := false

## Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := universal3830
TARGET_BOOTLOADER_BOARD_NAME := exynos850
TARGET_SOC := exynos850

## Properties
TARGET_PRODUCT_PROP += $(COMMON_PATH)/product.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

## Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/configs/init/fstab.exynos850
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_exynos850

## Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

## RIL
ENABLE_VENDOR_RIL_SERVICE := true

## Security
VENDOR_SECURITY_PATCH := 2023-03

## SELinux
BOARD_SEPOLICY_TEE_FLAVOR := teegris
include device/samsung_slsi/sepolicy/sepolicy.mk

## Vendor SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor

## Wi-Fi
BOARD_WLAN_DEVICE                := slsi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_slsi
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_slsi
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
