#!/bin/bash
# Devuelve solo la temperatura de la CPU real
/usr/bin/sensors | /usr/bin/grep 'Package id 0:' | /usr/bin/awk '{print $4}' | tr -d '+'

