#!/bin/bash
#===============================================================================
#
#          FILE:  iat.sh
# 
#         USAGE:  ./iat.sh 
# 
#   DESCRIPTION:  Wrapper script for the Firefox plugin Its All Text
# 
#       OPTIONS:  
#  REQUIREMENTS:  gvim
#          BUGS:  
#         NOTES:  
#        AUTHOR:  Colby Williams (Yorokobi), colbyw - at - gmail - dot - com
#     COPYRIGHT:
#       LICENSE:
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  07/25/2008 08:53:49 AM MDT
#      REVISION:  2010-10-13 06:17:44 -0700
#                   Corrected path to gvim for Archlinux
#===============================================================================

exec /usr/bin/gvim "$@"

# vim: ts=4:sw=4:
