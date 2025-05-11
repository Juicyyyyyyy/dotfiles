#!/usr/bin/env bash

xinput set-prop $(xinput --list | grep Touchpad | awk '{print $6}' | awk -F'=' '{print $2}') "libinput Tapping Enabled" 1
