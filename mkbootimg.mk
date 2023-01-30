LOCAL_PATH := $(call my-dir)

#DTS_FOLDER := $(TOP)/kernel/samsung/gtexslte/arch/arm/boot/dts

DTBTOOL := 	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/scripts/dtbtool
DTC_FOLDER := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/scripts/dtc
DTB_FOLDER := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/arch/$(TARGET_ARCH)/boot/dts

INSTALLED_SEANDROID_IMAGE := $(TOP)/device/samsung/gtexsltedd/seandroid.img

#TARGET_DTBS := $(shell find "$(DTB_FOLDER)" -maxdepth 1 -name '*.dtb')


$(INSTALLED_DTIMAGE_TARGET): TARGET_KERNEL_BINARIES
	$(call pretty,"Target dt image: $@")
	$(hide) $(DTBTOOL) -o $@ -s $(BOARD_KERNEL_PAGESIZE) -v -p $(DTC_FOLDER) $(DTB_FOLDER)
	@echo -e ${CL_CYN}"Made DT image: $@"${CL_RST}

##the dependency of $(TARGET_KERNEL_MODULES) on TARGET_KERNEL_BINARIES will be added in vendor/cm/build/tasks/kernel.mk
#$(TARGET_KERNEL_MODULES): INSTALLED_KERNEL_MODULES
#ifneq ($(INSTALLED_KERNEL_TARGET),)
##forcing the update of $(INSTALLED_KERNEL_TARGET) by removing it so that it is always copyed from the kernel binary residing in the kernel folder
#	$(hide) rm -f $(INSTALLED_KERNEL_TARGET)
#endif


$(INSTALLED_RAMDISK_TARGET): $(INSTALLED_KERNEL_TARGET)


# both BOOTIMAGE_EXTRA_DEPS and RECOVERYIMAGE_EXTRA_DEPS have been given the dependency on INSTALLED_DTIMAGE_TARGET in build/core/Makefile
# due to the setting of BOARD_KERNEL_SEPARATED_DT := true in BoardConfig.mk, 

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS) $(INSTALLED_SEANDROID_IMAGE)
	$(call pretty,"Target boot image: $@  ${MKBOOTIMG} ${INTERNAL_BOOTIMAGE_ARGS} ${BOARD_MKBOOTIMG_ARGS}")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --signature $(INSTALLED_SEANDROID_IMAGE) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

# Just giving RECOVERYIMAGE_ID_FILE a path to an empty file to prevent the build error for now
RECOVERYIMAGE_ID_FILE := /dev/null  
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel) \
		$(RECOVERYIMAGE_EXTRA_DEPS)
	#$(call build-recoveryimage-target, $@)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}


.PHONY: imageonly
imageonly: $(INSTALLED_BOOTIMAGE_TARGET) $(INSTALLED_RECOVERYIMAGE_TARGET) systemimage


.PHONY: bootimage
bootimage: $(INSTALLED_BOOTIMAGE_TARGET)



