LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm

LOCAL_MODULE:= boost

$(info Building Boost...)
COMMAND := $(shell \
           export PATH=$(TOOLCHAIN_INSTALL_DIR)/bin:$$PATH; \
           cd $(LOCAL_PATH); \
           ./bootstrap.sh; \
           mv project-config.jam.1 project-config.jam; \
           ./bjam link=static threading=multi --layout=system install)
$(info Boost built.)

include $(BUILD_STATIC_LIBRARY)
