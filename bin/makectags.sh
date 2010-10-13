#!/bin/sh
#===============================================================================
#
#          FILE:  makectags.sh
#
#         USAGE:  ./makectags.sh
#
#   DESCRIPTION:  (Re)create ~/.vim/tags/{perl5,python26}.ctags
#
#       OPTIONS:  ---
#  REQUIREMENTS:  exuberant ctags
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Colby Williams (Yorokobi), colbyw - at - gmail - dot - com
#     COPYRIGHT:  Copyright (c) 2010, Colby Williams
#       LICENSE:  This software is released under the MIT License
#              :  http://www.opensource.org/licenses/mit-license.html
#       COMPANY:  
#       CREATED:  2010-05-14 05:39:09 -0700
#      REVISION:  2010-06-15 10:07:13 -0700
#                   Added author info, copyright, and license
#===============================================================================

set -o nounset  # Treat unset variables as an error

if [ -e /usr/bin/ctags ] ; then
    if [ -d /usr/lib/perl5 ] ; then
        /usr/bin/ctags -R -f $HOME/.vim/tags/perl5.ctags /usr/lib/perl5 2> /dev/null
    fi
    if [ -d "/usr/lib/python2.6" ] ; then
        /usr/bin/ctags -R -f $HOME/.vim/tags/python26.ctags /usr/lib/python2.6 2> /dev/null
    fi
    if [ -d /usr/lib/php ] ; then
        /usr/bin/ctags -R -f $HOME/.vim/tags/php.ctags /usr/lib/php 2> /dev/null
    fi
fi

# vim: noai:ts=4:sw=4:
