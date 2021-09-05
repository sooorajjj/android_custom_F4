LOCAL_PATH := device/Custom/F4

$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# define hardware platform
PRODUCT_PLATFORM := lito

#TEST
# A/B support
PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier


AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti.recovery \
    bootctrl.lito.recovery \

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# # OEM otacert
# PRODUCT_EXTRA_RECOVERY_KEYS += \
#     $(LOCAL_PATH)/security/testkey1

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

# qcom decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe
