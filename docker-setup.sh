#!/bin/bash

docker build . -t ptouch-print
docker run -t -i --device=/dev/bus/usb/003 ptouch-print ptouch-print  --version

export usb_id=`lsusb | grep Brother | cut -d ' '  -f 2` && alias ptouch-print="docker run --rm -t -i --device=/dev/bus/usb/$usb_id ptouch-print ptouch-print"
