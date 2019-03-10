#!/bin/sh

sh macvtap.sh eno1 macvtap0 52:54:BE:0F:13:63
sh netns.sh macvtap0 netns0 "ping $1"
