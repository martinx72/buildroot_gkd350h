#!/bin/sh

 start-stop-daemon -S -b -m -p /var/run/daemon.pid \
                -x /usr/sbin/daemon

 start-stop-daemon -S -b -m -p /var/run/lowbatteryled.pid \
                -x /usr/sbin/lowbatteryled

 start-stop-daemon -S -b -m -p /var/run/poweroff_detect.pid \
                -x /usr/sbin/poweroff_detect

 start-stop-daemon -S -b -m -p /var/run/joystickplay.pid \
                -x /usr/sbin/joystickplay
