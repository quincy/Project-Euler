#!/usr/bin/perl

# The number, 197, is called a circular prime because all rotations of the 
# digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?

use strict;
use warnings;

my @primes = ( 2 );

my @candidates = ();
for ( my $num = 3; $num < 1000000; $num+=2 )
{
    push @candidates, $num;
}

my @sieve = @candidates;


SEARCH:
#for ( my $num = 3; $num <= 1000000; $num+=2 )
while ( @candidates )
{
    my $num = shift @candidates;
    print "isPrime( $num )\n";

    foreach my $prime ( @primes )
    {
        if ( $num % $prime == 0 )
        {
            @sieve = remove( @sieve, $num );
            print "length of sieve = $#sieve\n";
            
            next SEARCH;
        }
        
        if ( $prime > sqrt( $num ) )
        {
            push @primes, $num;
            next SEARCH;
        }
    }
}

my $sum = 0;

PRIME:
foreach my $prime ( @primes )
{
    if ( $prime =~ /2/ )
    {
        next PRIME;
    }

    my $chars = length $prime;

    for ( my $i = 0; $i < $chars; $i++ )
    {
        rotate( $prime );

        unless ( grep /$prime/, @primes )
        {
            next PRIME;
        }
    }

    print "$prime\n";
    $sum++;
}

print "$sum\n";

sub rotate
{
    my $num = shift @_;

    my @chars = split //, $num;

    my $rotated = join '', @chars[1..-1], $chars[0];

    return $rotated;
}

sub remove
{
    my $num   = pop @_;
    my @list  = @_;
    my @sieve = ();

    foreach my $l ( @list )
    {
        unless ( $num % $l == 0 )
        {
            push @sieve, $l;
        }
    }

    return @sieve;
}
