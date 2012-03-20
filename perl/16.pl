#!/usr/bin/perl

# Problem:
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

use strict;
use warnings;
use bignum;

my $sum = 0;

foreach my $digit ( split //, 2**1000 )
{
    $sum += $digit;
}

print "ANSWER = $sum\n";

__END__
