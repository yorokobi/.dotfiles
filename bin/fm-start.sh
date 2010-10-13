#!/bin/bash
#===============================================================================
#
#          FILE:  fm-start.sh
# 
#         USAGE:  ./fm-start.sh for crontab's @reboot
# 
#   DESCRIPTION:  Start fetchmail, presumes all settings in ~/.fetchmailrc
# 
#       OPTIONS:
#  REQUIREMENTS:  fetchmail
#          BUGS:  Report bugs to the author
#         NOTES:  User script to start fetchmail
#        AUTHOR:  Colby Williams (Yorokobi), colbyw - at - gmail - dot - com
#     COPYRIGHT:  Copyright (c) 2010, Colby Williams
#       LICENSE:  This software is released under the MIT License
#              :  http://www.opensource.org/licenses/mit-license.html
#       COMPANY:
#       VERSION:  1.0
#       CREATED:  2009-10-29 18:22:44 -0700
#      REVISION:  2010-06-15 09:31:25 -0700
#                   Added test for fetchmail binary
#===============================================================================

set -o nounset                              # Treat unset variables as an error

FMBINARY=$(which fetchmail)

if [ -f $HOME/.fetchmail.pid ] ; then
    exit 1
else
    if [ -x ${FMBINARY} ] ; then
        ${FMBINARY}
        exit $#
    fi
fi

# vim: noai:ts=4:sw=4:
