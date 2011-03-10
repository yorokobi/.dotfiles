#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  problem3.pl
#
#        USAGE:  ./problem3.pl  
#
#  DESCRIPTION:  
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  R. Colby Williams (Yorokobi), colbyw@gmail.com
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  11/10/2010 03:35:27 PM
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;

my $magic = 600851475143;

sub largestprimef($);
sub max($$);

print largestprimef($magic);
sub largestprimef($)
{
    my $n = shift;

    my $i;
    if ($n % 2 == 0) { return largestprimef(max(2, $n/2)); }
    my $sn = int(sqrt($n));

    for ($i = 3; $i <= $sn; $i += 2) {
        if($n % $i == 0) {
            last;
        }
    }
    if($i > $sn) 
    {
        return $n;
    }
    else
    {
        return max($i, largestprimef($n/$i));
    }
}

sub max($$)
{
    return (sort { $a <=> $b }(@_))[1];
}
