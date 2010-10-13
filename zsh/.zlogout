###
# Securely delete GNOME's Recently Used list
###

if [ -f $HOME/.recently-used ] ; then
    /bin/shred -zfu $HOME/.recently-used*
fi
if [ -f $HOME/.recently-used.xbel ] ; then
    /bin/shred -zfu $HOME/.recently-used.xbel
fi
