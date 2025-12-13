#!/bin/bash
/usr/bin/sensors | /usr/bin/grep 'Package id 0:' | /usr/bin/awk '{print $4}' | tr -d '+'

