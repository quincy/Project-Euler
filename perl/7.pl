#!/usr/bin/perl

# Problem:
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
#
# What is the 10001st prime number?

use strict;
use warnings;

my @primes = ( 2, 3 );
my $number = 3;

WHILE:
while ( scalar @primes < 10001 )
{
    $number += 2;

    foreach my $prime ( @primes )
    {
        if ( $number % $prime == 0 )
        {
            next WHILE;
        }
    }

    push @primes, $number;
    
#    print scalar @primes . ": $number\n";
}

print "ANSWER: $primes[-1]\n";
