#!/usr/bin/perl

# Problem:
# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

use strict;
use warnings;

for ( my $a = 1; $a < 500; $a++ )
{
    for ( my $b = $a + 1; $b < 500; $b++ )
    {
        for ( my $c = $b + 1; $c < 500; $c++ )
        {
            my $aa = $a**2;
            my $bb = $b**2;
            my $cc = $c**2;

            if ( $aa + $bb == $cc )
            {
                my $sum = $a + $b + $c;
                print "TRIPLE: $a, $b, $c = $sum\n";
                if ( $sum == 1000 )
                {
                    print "ANSWER: $a + $b + $c = 1000\n";

                    exit 0;
                }
            }
        }
    }
}
 
