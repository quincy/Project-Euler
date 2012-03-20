#!/usr/bin/perl

# Problem:
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

use strict;
use warnings;

my $number = 600851475143;
my $divisor = 2;

while ( $number > 1 )
{
    if ( $number % $divisor == 0 )
    {
        print "$divisor";
        $number /= $divisor;
        $divisor--;

        print ", " if ( $number > 1 );
    }
    $divisor++;
}

print "\n";
