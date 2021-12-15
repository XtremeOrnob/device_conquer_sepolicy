#
# This policy configuration will be used by all qcom products
# that inherit from conquer
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/conquer/sepolicy/qcom/dynamic \
    device/conquer/sepolicy/qcom/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/conquer/sepolicy/qcom/dynamic \
    device/conquer/sepolicy/qcom/vendor
endif

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/conquer/sepolicy/qcom/private

ifneq ($(filter msm8960 msm8226 msm8610 msm8974 apq8084 msm8909 msm8916 msm8952 msm8992 msm8994,$(TARGET_BOARD_PLATFORM)),)
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/conquer/sepolicy/qcom/legacy-vendor
endif

ifeq (,$(filter msm8960 msm8226 msm8610 msm8974 apq8084 msm8909 msm8916 msm8952 msm8992 msm8994 msm8937 msm8953 msm8996 msm8998 sdm660 sdm710 sdm845, $(TARGET_BOARD_PLATFORM)))
BOARD_SEPOLICY_M4DEFS += \
    qdisplay_service=vendor_qdisplay_service \
    sysfs_graphics=vendor_sysfs_graphics \
    hal_keymaster_qti_exec=vendor_hal_keymaster_qti_exec \
    persist_block_device=vendor_persist_block_device \
    display_vendor_data_file=vendor_display_vendor_data_file \
    hal_perf_default=vendor_hal_perf_default \
    sysfs_battery_supply=vendor_sysfs_battery_supply \
    sysfs_usb_supply=vendor_sysfs_usb_supply
endif
