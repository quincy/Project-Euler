#!/usr/bin/perl

# A permutation is an ordered arrangement of objects. For example, 3124 is one
# possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
# are listed numerically or alphabetically, we call it lexicographic order. The
# lexicographic permutations of 0, 1 and 2 are:
#
# 012   021   102   120   201   210
#
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 
# 5, 6, 7, 8 and 9?
#
# ANSWER 
#
# Had to determine the Lehmer code for the 1000000 permutation by trial and error.
# Must be a good way to calculate it.  http://en.wikipedia.org/wiki/Factoradic#Permutations
# has a good description of Lehmer codes.  This script requires the user to input
# a factoradic, with each place value separated by a space.  The answer to the problem is
# the factoradic 2 6 6 2 5 1 2 1 1 0.
#
#   place value   : 9!       8!       7!      6!     5!    4!   3!   2!  1!  0!
#   factoradic    : 2        6        6       2      5     1    2    1   1   0
#   decimal value : 725760 + 241920 + 30240 + 1440 + 600 + 24 + 12 + 2 + 1 + 0  = 999,999
#
# which is the one millionth permutation when indexing from 0.
#
# The Lehmer code is easy to use to construct the permutation.  Just shift the first 
# digit from the Lehmer code and use it as the index to remove from the permutation pi(0).
# Keep removing elements in this manner until the new permutation is constructed.
#

use strict;
use warnings;

my @factoradic = @ARGV;
my @reversed_factoradic = reverse @ARGV;
my $perm_num   = 1;
my @perm       = ( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 );
#my @perm       = ( 0, 1, 2 );
my @new_perm   = ();

for ( my $i = 0; $i < scalar @reversed_factoradic; $i++ )
{
    $perm_num += $reversed_factoradic[$i] * factorial( $i );
}

my $fString = '[' . join( ',', @factoradic ) . ']';

print "Factoradic: $fString is the $perm_num permutation\n";

while ( scalar @factoradic )
{
    my $f = shift @factoradic;

    if ( scalar @perm >= $f )
    {
        push @new_perm, $perm[$f];

        print "$perm[$f] ";

        if ( $f == 0 )
        {
            @perm = @perm[1..$#perm];
        }
        elsif ( $f == $#perm )
        {
            @perm = @perm[0..$#perm-1];
        }
        else
        {
            @perm = @perm[0..$f-1,$f+1..$#perm];
        }
    }
}

print "\n";


sub factorial
{
    my $num = shift @_;

    if ( $num < 2 )
    {
        return $num;
    }

    return $num * factorial( $num - 1 );
}


__END__

