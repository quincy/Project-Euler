#!/usr/bin/perl

# Problem:
# A palindromic number reads the same both ways. The largest palindrome made 
# from the product of two 2-digit numbers is 9009 = 91  99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

use strict;
use warnings;

my $equation = "";
my $largest  = 0;

for ( my $x = 999; $x > 99; $x-- )
{
    for ( my $y = 999; $y > 99; $y-- )
    {
        my $product = $x * $y;

        if ( $product == reverse $product )
        {
            print "$x * $y = $product\n";

            if ( $product > $largest )
            {
                $largest = $product;

                $equation = "$x * $y = $product\n";
            }
        }
    }
}

print "\n$equation\n";
