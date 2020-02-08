################################################################################
#
# gmenunx
#
################################################################################
GMENUNX_VERSION = 97d0cbe
GMENUNX_SITE = $(call github,podulator,esoteric,$(GMENUNX_VERSION))
GMENUNX_DEPENDENCIES = dejavu libpng sdl sdl_ttf sdl_gfx
GMENUNX_INSTALL_TARGET = YES

GMENUNX_MAKE_OPTS = \
    MD="mkdir -p" \
    CROSS_COMPILE="$(TARGET_CROSS)"
    
ifeq ($(BR2_PACKAGE_LIBOPK),y)
GMENUNX_DEPENDENCIES += libopk
endif

ifeq ($(BR2_PACKAGE_LIBXDGMIME),y)
GMENUNX_DEPENDENCIES += libxdgmime
endif

define GMENUNX_CONFIGURE_CMDS
    cp $(@D)/Makefile.rg-350 $(@D)/Makefile.gkd350h
    cp $(@D)/assets/rg-350/. $(@D)/assets/gkd350h/ -R
    rm -f $(@D)/assets/gkd350h/icons/rg350.png
    rm -fR $(@D)/assets/rg-350/
    cp $(BR2_ROOTFS_SKELETON_CUSTOM_PATH)/../gkd350h_32x32.png $(@D)/assets/gkd350h/icons/gkd350h.png
endef


define GMENUNX_BUILD_CMDS
    $(MAKE) $(GMENUNX_MAKE_OPTS) -C $(@D) all dist \
        -f Makefile.gkd350h
endef

define GMENUNX_INSTALL_GMENUNX
endef
GMENUNX_POST_INSTALL_TARGET_HOOKS += GMENUNX_INSTALL_GMENUNX


$(eval $(generic-package))
