#!/bin/bash
#===============================================================================
#
#          FILE:  clearFlashCookies.sh
# 
#         USAGE:  ./clearFlashCookies.sh 
# 
#   DESCRIPTION:  Delete cookies left by Adobe Flash (trademarks, copyright, et
#                 cetera acknowledged)
# 
#       OPTIONS:
#  REQUIREMENTS:  wipe
#          BUGS:  Report bugs to the author
#         NOTES:  A handy item for user's crontab
#        AUTHOR:  Colby Williams (Yorokobi), colbyw - at - gmail - dot - com
#     COPYRIGHT:  Copyright (c) 2010, Colby Williams
#       LICENSE:  This software is released under the MIT License
#              :  http://www.opensource.org/licenses/mit-license.html
#       COMPANY:
#       VERSION:  1.0
#       CREATED:  2009-09-14 21:01:32 -0700
#      REVISION:  2010-06-15 09:22:43 -0700
#                   Added copyright, license, and author email address
#                   Added test for wipe binary and exit condition
#===============================================================================

set -o nounset                              # Treat unset variables as an error

WIPE=$(which wipe)

if [ -x ${WIPE} ] ; then
    if [ -e $HOME/.macromedia/Flash_Player ] ; then
        ${WIPE} -rzfs $HOME/.macromedia/Flash_Player/
    fi

    if [ -e $HOME/.adobe/Flash_Player ] ; then
        ${WIPE} -rzfs $HOME/.adobe/Flash_Player/
    fi
else
    echo "wipe not found"
    exit 1
fi

# vim: noai:ts=4:sw=4:
