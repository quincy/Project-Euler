#!/usr/bin/perl

# Let d(n) be defined as the sum of proper divisors of n (numbers less than n 
# which divide evenly into n).
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and 
# each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
# and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
# 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.


use strict;
use warnings;

my @amicable = ();

foreach my $num ( 2..9999 )
{
    next if ( grep /^$num$/, @amicable );

    my $dsum = div_sum( $num );
    
    if ( $num == div_sum( $dsum ) && $num != $dsum )
    {
        push @amicable, $num, $dsum;
    }
}

my $sum = 0;
foreach my $n ( @amicable )
{
    $sum += $n;
}

print "$sum\n";

sub div_sum
{
    my ( $number ) = shift @_;

    my $sum      = 0 - $number;
    my $divisor  = 1;
    my @divisors = ();

    while ( $divisor < sqrt $number )
    {
        if ( $number % $divisor == 0 )
        {
            push( @divisors, $divisor, $number / $divisor )if ( !grep /^$divisor$/, @divisors );
        }
        $divisor++;
    }

    foreach my $divisor ( @divisors )
    {
        $sum += $divisor;
    }

    return $sum;
}
