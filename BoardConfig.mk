#
# Copyright (C) 2019 The LineageOS Project
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

# Inherit from motorola sdm632-common
-include device/motorola/sdm632-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/channel

# Assertions
TARGET_BOARD_INFO_FILE := device/motorola/channel/board-info.txt
TARGET_OTA_ASSERT_DEVICE := channel

# Init
SOONG_CONFIG_NAMESPACES += MOTOROLA_SDM632_INIT
SOONG_CONFIG_MOTOROLA_SDM632_INIT := DEVICE_LIB
SOONG_CONFIG_MOTOROLA_SDM632_INIT_DEVICE_LIB := //$(DEVICE_PATH):libinit_channel

# Kernel
TARGET_KERNEL_CONFIG := channel_defconfig
BOARD_RAMDISK_USE_XZ := true

# Low Memory Devices
MALLOC_SVELTE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432        #    32768 * 1024 mmcblk0p41-42
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 2750795072
BOARD_SUPER_PARTITION_SIZE := 2801795072
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 2466250752    #  2408448 * 1024 mmcblk0p62-63
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 335544320     #   841316 * 1024 mmcblk0p60-61

# Reserve space for gapps install
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 96897891
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 314572800
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 35124224

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# inherit from the proprietary version
include vendor/motorola/channel/BoardConfigVendor.mk
