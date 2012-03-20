#!/usr/bin/perl

# The decimal number, 585 = 1001001001_(2) (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in 
# base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include 
# leading zeros.)

use strict;
use warnings;

my $sum = 0;

for ( my $i = 1; $i < 1000000000; $i += 2 )
{
    if ( $i eq reverse $i )
    {
        my $b = unpack "B32", pack( "N", $i );
        $b =~ s/^0+(?=\d)//;   # otherwise you'll get leading zeros

        if ( $b eq reverse $b )
        {
            print "$i <-> $b\n";
            $sum += $i;
        }
    }
}

print "$sum\n";
