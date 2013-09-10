#!/bin/sh
echo BEAGLEBOY > /sys/devices/bone_capemgr.8/slots
echo 61 > /sys/class/gpio/export
echo 49 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio49/direction
echo in > /sys/class/gpio/gpio61/direction
