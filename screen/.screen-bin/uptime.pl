#!/usr/bin/env perl 
#===============================================================================
#
#         FILE:  uptime.pl
#
#        USAGE:  ./uptime.pl 
#
#  DESCRIPTION:  Get uptime from /proc/uptime
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Yorokobi
#      COMPANY:  ---
#      VERSION:  1.1.2
#      CREATED:  2010-04-26 19:42:02 MST (UTC-7)
#     REVISION:  2012-03-23 10:04:00 MST (UTC-7)
#===============================================================================

use strict;
use warnings;

# Take the uptime
my $uptime = `cat /proc/uptime | awk '{ print \$1 }'`;
### For BSD (tested on OpenBSD 5.0, it also works on Linux)
#my $uptime = `uptime | awk '{ split(\$3,a,":"); print (a[1]*60+a[2])*60 }'`

# These help us calculate the minutes and hours
my $MIN = 60;
my $HOUR = $MIN*60;
my $DAY = 24;

my $minutes = 0;
my $hours = 0;
my $days = 0;

# Using eval to make sure there is no division by zero.
# This should never happen since the values of $MIN, $HOUR, and $DAY are hardcoded >0
# but it is good practice.
eval { $minutes = int($uptime / $MIN  % $MIN); }; die $@ if $@;
eval { $hours   = int($uptime / $HOUR % $DAY); }; die $@ if $@;
eval { $days    = int($uptime / $HOUR / $DAY); }; die $@ if $@;

### Do we want zero-padded numbers <10?
#if ($hours < 10) { $hours = "0$hours"; }
#if ($minutes < 10) { $minutes = "0$minutes"; }
#if ($days < 10) { $days = "0$days"; }

if ( $days == 0 ) {
    if ( $hours == 0 ) {
        print "$minutes mins";
    } else {
        print "$hours"."h "."$minutes"."m";
    }
} else {
    print "$days"."d "."$hours"."h "."$minutes"."m";
}
