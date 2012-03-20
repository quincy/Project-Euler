#!/usr/bin/perl

# Problem:
# n! means n * (n - 1) * ... * 3 * 2 * 1
#
# Find the sum of the digits in the number 100!

use strict;
use warnings;
use bignum;

my $sum    = 0;
my $number = factorial( 100 );

print "100! = $number\n";

foreach my $digit ( split //, $number )
{
    $sum += $digit;
}

print "Answer = $sum\n";

sub factorial
{
    my $number = shift @_;

    print "$number!\n";

    if ( $number > 1 )
    {
        return $number * factorial( $number - 1 );
    }
    else
    {
        return $number;
    }
}

__END__
