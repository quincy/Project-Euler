#!/usr/bin/perl

# Problem:
# The series, 1^(1) + 2^(2) + 3^(3) + ... + 10^(10) = 10405071317.
#
# Find the last ten digits of the series, 1^(1) + 2^(2) + 3^(3) + ... + 1000^(1000).

use strict;
use warnings;
use bignum;

my $limit = 1000;
my $sum   = 0;

for ( my $i = 1; $i < $limit + 1; $i++ )
{
    $sum += $i**$i;
}

print "$sum\n";
