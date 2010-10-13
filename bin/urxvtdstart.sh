#!/bin/bash
#===============================================================================
#
#          FILE:  yorokobi-urxvt.sh
# 
#         USAGE:  ./yorokobi-urxvt.sh 
# 
#   DESCRIPTION:  Start urxvtd
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Colby Williams (Yorokobi), colbyw - at - gmail - dot - com
#     COPYRIGHT:  Copyright (c) 2010, Colby Williams
#       LICENSE:  This software is released under the MIT License
#              :  http://www.opensource.org/licenses/mit-license.html
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  2010-03-21 18:08:20 -0700
#      REVISION:  2010-06-15 10:14:32 -0700
#                   Added author info, copyright, and license
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ -x /usr/bin/urxvtd ] ; then
    sleep 20s
    /usr/bin/urxvtd -q -f -o
fi

# vim: noai:ts=4:sw=4:
