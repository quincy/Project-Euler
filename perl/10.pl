#!/usr/bin/perl

# Problem:
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

use strict;
use warnings;

my $UPPER = 2000000;
my $sieve = "";
my $sum   = 0;

GUESS:
for ( my $guess = 2; $guess <= $UPPER; $guess++ )
{
    next GUESS if vec( $sieve, $guess, 1 );
    # print "$guess\n" if $count++ % 10000 == 0;
    $sum += $guess;

    for ( my $mults = $guess * $guess; $mults <= $UPPER; $mults += $guess ) 
    {
        vec( $sieve, $mults, 1 ) = 1;
    }
}

print "$sum\n"; 

#my $bits = unpack("b*", $sieve);
#print "$bits\n";

__END__
