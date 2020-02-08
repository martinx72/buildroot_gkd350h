################################################################################
#
# retroarch
#
################################################################################
RETROARCH_VERSION = v1.8.4
RETROARCH_SITE = $(call github,libretro,RetroArch,$(RETROARCH_VERSION))
RETROARCH_DEPENDENCIES = sdl sdl_ttf sdl_gfx zlib p7zip python


RETROARCH_MAKE_OPTS = \
    MD="mkdir -p" \
    CROSS_COMPILE="$(TARGET_CROSS)"


define RETROARCH_CONFIGURE_CMDS
	wget https://raw.githubusercontent.com/martinx72/retroarch_gkd350h_makefile/master/$(RETROARCH_VERSION)/Makefile.gkd350h --output-document=$(@D)/Makefile.gkd350h
endef


define RETROARCH_BUILD_CMDS
    $(MAKE) $(GNG_MAKE_OPTS) -C $(@D) all \
        -f Makefile.gkd350h
endef

define RETROARCH_INSTALL_STAGING_CMDS
endef

define RETROARCH_INSTALL_TARGET_CMDS
endef

define RETROARCH_USERS
endef

define RETROARCH_DEVICES
endef

define RETROARCH_PERMISSIONS
endef

$(eval $(generic-package))

