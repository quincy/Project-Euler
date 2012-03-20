#!/usr/bin/perl

# You are given the following information, but you may prefer to do some 
# research for yourself.
#
#    * 1 Jan 1900 was a Monday.
#    * Thirty days has September,
#      April, June and November.
#      All the rest have thirty-one,
#      Saving February alone,
#      Which has twenty-eight, rain or shine.
#      And on leap years, twenty-nine.
#    * A leap year occurs on any year evenly divisible by 4, but not on a century
#      unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?

use strict;
use warnings;

my @months = ( 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 );
my $year   = 1900;
my $sum    = 0;

for ( my $wday = 1; $wday < 7; )
{
    last if ( $year > 2000 );

    for ( my $month = 0; $month < scalar @months; $month++ )
    {
        for ( my $mday = 1; $mday <= $months[$month]; $mday++ )
        {
            if ( $mday == 1 && $wday == 0 )
            {
                $sum++ unless ( $year < 1901 );
            }

            $wday++;
            $wday = 0 if ( $wday == 7 );
        }
    }

    $year++;
}

print "ANSWER = $sum\n";
