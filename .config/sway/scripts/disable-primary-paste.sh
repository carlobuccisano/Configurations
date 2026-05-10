#!/bin/bash
wl-paste -p --watch sh -c 'if [ -n "$(wl-paste -p -n 2>/dev/null)" ]; then wl-copy -pc; fi'
