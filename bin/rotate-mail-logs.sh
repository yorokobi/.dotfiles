#!/bin/bash
#===============================================================================
#
#          FILE:  rotate-mail-logs.sh
# 
#         USAGE:  ./rotate-mail-logs.sh 
# 
#   DESCRIPTION:  Rotate the fetchmail and procmail logs in ~/Private/var/log/
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  tar, bzip2, fetchmail, gpg, gpg private key, procmail
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Colby Williams (Yorokobi), colbyw - at - gmail - dot - com
#     COPYRIGHT:  Copyright (c) 2010, Colby Williams
#       LICENSE:  This software is released under the MIT License
#              :  http://www.opensource.org/licenses/mit-license.html
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  2009-07-21 09:35:16 -0700
#      REVISION:  2010-06-15 10:10:23 -0700
#                   Added author info, copyright, and license
#===============================================================================

set -o nounset                              # Treat unset variables as an error

GPG_SIGNATURE='SIGNATURE'
FETCHMAIL=$(which fetchmail)
DATE=`date +%Y%m%d`
FETCHMAILLOG="fetchmail.log"
PROCMAILLOG="procmail.log"
TBZ=".tar.bz2"
TAR="/bin/tar cjf"
ENCRYPT="/usr/bin/gpg -r ${GPG_SIGNATURE} -e "
FMLTBZ="${FETCHMAILLOG}-${DATE}${TBZ}"
PMLTBZ="${PROCMAILLOG}-${DATE}${TBZ}"

pushd ~/Private/var/log
### Stop fetchmail
$FETCHMAIL -q &>/dev/null
### Just in case
/usr/bin/pkill -u USERNAME fetchmail
$TAR ${FMLTBZ} ${FETCHMAILLOG}
$TAR ${PMLTBZ} ${PROCMAILLOG}
$ENCRYPT ${FETCHMAILLOG}-${DATE}${TBZ}
$ENCRYPT ${PROCMAILLOG}-${DATE}${TBZ}
### Securely delete the logs
/usr/bin/wipe -zfs ${FMLTBZ}
/usr/bin/wipe -zfs ${PMLTBZ}
/usr/bin/wipe -zfs ${FETCHMAILLOG}
/usr/bin/wipe -zfs ${PROCMAILLOG}
### Start fetchmail back up
touch fetchmail.log
touch procmail.log
$FETCHMAIL
popd

# vim: noai:ts=4:sw=4:
