#!/bin/bash
#===============================================================================
#
#          FILE:  xsetstart.sh
# 
#         USAGE:  ./xsetstart.sh 
# 
#   DESCRIPTION:  Enable repeat for caps-as-backspace
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  Start with X (ie, via GNOME's Startup Applications)
#        AUTHOR:  Colby Williams (Yorokobi), colbyw - at - gmail - dot - com
#     COPYRIGHT:  Copyright (c) 2010, Colby Williams
#       LICENSE:  This software is released under the MIT License
#              :  http://www.opensource.org/licenses/mit-license.html
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  2009-10-29 12:06:28 -0700
#      REVISION:  2010-06-15 10:16:32 -0700
#                   Added author info, copyright, and license
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#===============================================================================
# Use the following 4 lines for ~/.Xmodmap
# Be sure to remove the # preceding each line
#! Make the caps lock button a backspace button
#!
#remove Lock = Caps_Lock
#keycode 66 = BackSpace
#===============================================================================

# Sleep long enough for X to start up
sleep 10s
/usr/bin/xset r 66

# vim: noai:ts=4:sw=4:
