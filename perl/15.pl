#!/usr/bin/perl

# Problem:
# Starting in the top left corner of a 2x2 grid, there are 6 routes (without 
# backtracking) to the bottom right corner. 
#
# How many routes are there through a 20x20 grid? 
# http://en.wikipedia.org/wiki/Catalan_number 

use strict;
use warnings;
use bignum;

my $rows = 20;

my $a = factorial( 2 * $rows );
my $b = factorial( $rows );
my $paths = ( $a / ( $b * $b ) );

print "$paths\n";

sub factorial
{
    my $number = shift @_;

    if ( $number < 2 ) 
    {
        return $number;
    }
    else 
    {
        return $number * factorial( $number - 1 );
    }
}

__END__
