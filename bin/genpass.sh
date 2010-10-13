#!/bin/bash
#===============================================================================
#
#          FILE:  genpass.sh
# 
#         USAGE:  ./genpass.sh 
# 
#   DESCRIPTION:  Generate passwords using pwgen
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  pwgen, apg, makepasswd
#          BUGS:  ---
#         NOTES:  Creates psuedo-random and HEX-only passwords up to $CHARS long
#                 for a total of $TTL passwords for each pass. A lot of entropy
#                 is a good thing.
#        AUTHOR:  Colby Williams (Yorokobi), colbyw - at - gmail - dot - com
#     COPYRIGHT:  Copyright (c) 2010, Colby Williams
#       LICENSE:  This software is released under the MIT License
#              :  http://www.opensource.org/licenses/mit-license.html
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  2008-08-20 01:36:53 -0700
#      REVISION:  2010-06-15 10:02:43 -0700
#                   Added author info, license, and copyright
#===============================================================================

set -o nounset                              # Treat unset variables as an error

CHARS=30
TTL=10

if [ -e /usr/bin/pwgen ] ; then
    echo PWGen ${CHARS} chars
    /usr/bin/pwgen -c -n -s -y -1 ${CHARS} ${TTL}
    echo
fi
if [ -e /usr/bin/apg ] ; then
    echo APG ${CHARS} chars
    /usr/bin/apg -m ${CHARS} -x ${CHARS} -M SNLC -n ${TTL}
    echo
    echo APG HEX ${CHARS} chars
    /usr/bin/apg -m ${CHARS} -x ${CHARS} -E GHIJKLMNOPQRSTUVWXYZ -a 1 -M nc -n ${TTL}
    echo
fi
if [ -e /usr/bin/makepasswd ] ; then
    echo MakePasswd ${CHARS} chars
    /usr/bin/makepasswd --chars ${CHARS} --count ${TTL}
    /usr/bin/makepasswd --string '1234567890[]!@#$%^&*(){},.pyfgcrl/=\<>PYFGCRL?+|aoeuidhtns-AOEUIDHTNS_;qjkxbmwvz:QJKXBMWVZ' --chars ${CHARS} --count ${TTL}
fi

# vim: noai:ts=4:sw=4:
