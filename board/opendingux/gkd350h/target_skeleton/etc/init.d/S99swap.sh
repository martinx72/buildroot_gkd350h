#!/bin/sh

SWAP_PARTITION=/dev/mmcblk0p3

if [ -z "$1" ] || [ "x$1" = "xstart" ]; then

    # Swap to SD card.
        /sbin/mkswap $SWAP_PARTITION
        /sbin/swapon $SWAP_PARTITION
	sysctl -w vm.swappiness=10
fi

