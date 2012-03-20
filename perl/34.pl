#!/usr/bin/perl

# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

use strict;
use warnings;

my $answer = 0;
my %fact   = ();

for my $num ( 3..2540160 )
{
    my $sum = 0;
    foreach my $digit ( split //, $num )
    {
        unless ( exists $fact{$digit} )
        {
            $fact{$digit} = factorial( $digit );
        }

        $sum += $fact{$digit};
    }

    if ( $num == $sum )
    {
        print "$num <-> $sum\n";
        $answer += $num;
    }
}

print "answer = $answer\n";

sub factorial
{
    my $number = shift @_;

    return 1 if ( $number == 0 );

    if ( $number > 1 )
    {
        return $number * factorial( $number - 1 );
    }
    
    return $number;
}
