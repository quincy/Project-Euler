#!/usr/bin/perl
# The following iterative sequence is defined for the set of positive integers:
#
# n n/2 (n is even)
# n 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
# 13 40 20 10 5 16 8 4 2 1
#
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it
# has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

use strict;
use warnings;

my %chain_length_for = ();
my %start_val_for = ();
my $longest = 0;

NUMBER:
for ( my $i = 1; $i < 999999; $i++ )
{
    my $num   = $i;
    my $chain = 1;

    while ( $num != 1 )
    {
        $chain++;
        
        if ( exists $chain_length_for{$num} )
        {
            $chain += $chain_length_for{$num};

            $chain_length_for{$i}  = $chain;
            $start_val_for{$chain} = $i;

            if ( $chain > $longest )
            {
                $longest = $chain;
            }
            next NUMBER;
        }

        if ( $num % 2 == 0 )
        {
            $num = $num / 2;
        }
        else
        {
            $num = 3 * $num + 1;
        }
    }

    $chain_length_for{$i} = $chain;
    $start_val_for{$chain} = $i;

    if ( $chain > $longest )
    {
        $longest = $chain;
    }
}

print "$longest $start_val_for{$longest}\n";

__END__
