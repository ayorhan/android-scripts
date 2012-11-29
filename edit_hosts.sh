#!/bin/sh

./adb -s emulator-5554 remount
./adb -s emulator-5554 pull /system/etc/hosts .
echo "10.1.1.65   apps.oyun.mynet.com" >> hosts
./adb -s emulator-5554 push hosts /system/etc
cat hosts