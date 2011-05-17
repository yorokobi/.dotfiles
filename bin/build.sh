#!/bin/bash - 
#===============================================================================
#
#          FILE:  build.sh
# 
#         USAGE:  ./build.sh 
# 
#   DESCRIPTION:  Script to aid in building modules in the cvs/git repositories
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Colby Williams (Yorokobi), colbyw at gmail dot com
#       COMPANY: 
#       CREATED: 2011-05-15 07:03:59 -0700
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

HOME=/home/cwilliams
WEECHATDIR=${HOME}/git/weechat
URXVTDIR=${HOME}/cvs/rxvt-unicode
TMUXDIR=${HOME}/cvs/tmux
GITBUILDDIR=${HOME}/git/build
CVSBUILDDIR=${HOME}/cvs/build

function print_help () {
    echo
    echo "You must specify a target."
    echo
    echo "build.sh {weechat,urxvt,tmux,all}"
    echo
    exit 2
}

function failed_cmake () {
    echo
    echo "Failed to cmake ${1}"
    echo
    exit 1
}

function failed_make () {
    echo
    echo "Failed to make ${1}"
    echo
    exit 1
}

function failed_install () {
    echo
    echo "Failed to install ${1}"
    echo
    exit 1
}

function failed_gitpull () {
    echo
    echo "Failed to pull git repository for ${1}"
    echo
    exit 3
}

function failed_makepkg () {
    echo
    echo "Failed to make package ${1}"
    echo
    exit 1
}

function build_weechat () {
    cd $WEECHATDIR
    git pull || failed_gitpull
    rm -rf ${GITBUILDDIR}/*
    cp -r $WEECHATDIR/* $GITBUILDDIR
    cd $GITBUILDDIR
    cmake -DPREFIX=/usr/local/weechat-dev -DPYTHON_EXECUTABLE=/usr/bin/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so || failed_cmake
    make || failed_make
    sudo make install || failed_install
}

function build_urxvt () {
    cd $URXVTDIR
    cvs update || failed_cvsupdate
    rm -rf ${CVSBUILDDIR}/*
    cp -r $URXVTDIR/* $CVSBUILDDIR
    cd $CVSBUILDDIR
    patch -p0 <../popup-menu-hang.diff
    patch -p0 <../font-width-fix.patch
    patch -p0 <../rxvt-hints.patch
    ./configure --with-terminfo=/usr/share/terminfo --enable-smart-resize --enable-xim --with-term=rxvt-unicode-256color --enable-256-color --enable-pixbuf --enable-iso14755 --prefix=/usr
    make || failed_make
    sudo make install || failed_install
}

function build_tmux () {
    rm -rf ${CVSBUILDDIR}/*
    cd $CVSBUILDDIR
    cp ../PKGBUILD .
    cp $HOME/abs/tmux/LICENSE .
    makepkg || failed_makepkg
    BUILDDATE=`date +%Y%m%d`
    sudo pacman -U tmux-cvs-${BUILDDATE}-1-x86_64.pkg.tar.xz || failed_install
}

function finish_it () {
    cd $HOME
    exit 0
}

if [ $# == 0 ] ; then
    print_help
fi

case "$1" in
    "weechat" )
        build_weechat
        finish_it
        ;;
    "urxvt" )
        build_urxvt
        finish_it
        ;;
    "tmux" )
        build_tmux
        finish_it
        ;;
    "all" )
        build_weechat
        build_urxvt
        build_tmux
        finish_it
        ;;
    * )
        print_help
        ;;
esac
exit 0
