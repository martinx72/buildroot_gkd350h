################################################################################
#
# dialog
#
################################################################################

DIALOG_VERSION = 1.2-20140219
DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
DIALOG_SITE = http://sources.buildroot.net/
DIALOG_CONF_OPT = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
	--disable-rpath-hack
DIALOG_DEPENDENCIES = host-pkgconf ncurses
DIALOG_LICENSE = LGPLv2.1
DIALOG_LICENSE_FILES = COPYING

ifneq ($(BR2_ENABLE_LOCALE),y)
DIALOG_DEPENDENCIES += libiconv
endif

DIALOG_CONF_OPT += NCURSES_CONFIG=$(STAGING_DIR)/usr/bin/ncurses5-config

$(eval $(autotools-package))
