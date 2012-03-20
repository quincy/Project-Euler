#!/usr/bin/perl

# Problem:
# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385
#
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 - 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.


use strict;
use warnings;

my $sum_of_squares = 0;
my $square_of_sums = 0;
my $sum            = 0;

for my $number ( 1..100 )
{
    $sum            += $number;
    $sum_of_squares += $number**2;
}

$square_of_sums = $sum**2;

my $difference = $square_of_sums - $sum_of_squares;

print "SUM OF SQUARES: $sum_of_squares\n";
print "SQUARE OF SUMS: $square_of_sums\n";

print "ANSWER: $difference\n";

