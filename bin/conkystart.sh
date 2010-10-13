#!/bin/bash
#===============================================================================
#
#          FILE:  conkystart.sh
# 
#         USAGE:  ./conkystart.sh 
# 
#   DESCRIPTION:  Start conky after a pause, useful for GNOME's start-up
#                   applications
# 
#       OPTIONS:
#  REQUIREMENTS:  conky
#          BUGS:
#         NOTES:
#        AUTHOR:  Colby Williams (Yorokobi), colbyw - at - gmail - dot - com
#     COPYRIGHT:  Copyright (c) 2010, Colby Williams
#       LICENSE:  This software is released under the MIT License
#              :  http://www.opensource.org/licenses/mit-license.html
#       COMPANY:
#       VERSION:  1.0
#       CREATED:  2009-02-04 15:15:25 -0700
#      REVISION:  2010-06-15 09:26:20 -0700
#                   Added copyright, license, and author's email address
#                   Changed test for conky binary to -x
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ -z ${HOME} ] ; then # check to see if $DISPLAY is not set
# uncomment the line below and change 'username' to a valid user account
#    export HOME=/home/username
fi

if [ ${DISPLAY} ] ; then # Is X running?
    if [ -x /usr/bin/conky ] ; then
        if [ -f ${HOME}/.conkyrc ] ; then
            /bin/sleep 20s # Wait for X to start
            /usr/bin/conky -c ${HOME}/.conkyrc &>/dev/null
        fi
        if [ -f ${HOME}/.conkyrc-netconns ] ; then
            sleep 5s
            /usr/bin/conky -c ${HOME}/.conkyrc-netconns &>/dev/null
        fi
    fi
fi

# vim: noai:ts=4:sw=4:
