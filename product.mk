# Inherit ih8sn Makefile
$(call inherit-product, external/ih8sn/product.mk)

# Recovery
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.vendor.recovery_update=true
