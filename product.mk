# Apps
PRODUCT_PACKAGES += \
    GlimpsePrebuilt

# GMS
ifeq ($(PRODUCT_IS_ATV),true)
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
$(call inherit-product-if-exists, vendor/gapps_tv/arm64/arm64-vendor.mk)
else
$(call inherit-product-if-exists, vendor/gapps_tv/arm/arm-vendor.mk)
endif # TARGET_SUPPORTS_64_BIT_APPS
else
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)
else
$(call inherit-product-if-exists, vendor/gapps/arm/arm-vendor.mk)
endif # TARGET_SUPPORTS_64_BIT_APPS
endif # PRODUCT_IS_ATV

# ih8sn
$(call inherit-product, external/ih8sn/product.mk)

# Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.recovery_update=true

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Updater
PRODUCT_PACKAGES += \
    NXLineageUpdaterCommonOverlay
ifeq ($(WITH_GMS),true)
PRODUCT_PACKAGES += \
    NXLineageUpdaterGMSOverlay
else
PRODUCT_PACKAGES += \
    NXLineageUpdaterNoGMSOverlay
endif
