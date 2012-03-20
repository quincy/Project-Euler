#!/usr/bin/perl

# Starting with the number 1 and moving to the right in a clockwise direction a 
# 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of both diagonals is 101.
#
# What is the sum of both diagonals in a 1001 by 1001 spiral formed in the same way?
# 
# ANSWER: 669171001

use strict;
use warnings;

my $sum  = 1;
my $loop = 1;

for ( my $i = 3; $i < 1002; $i += 2 )
{
    my $next_diag = $i * ( $i - 3 ) + 3;
    $sum += $next_diag;
    
    for ( my $j = 1; $j < 4; $j++ )
    {
        $next_diag += $i - 1;
        $sum += $next_diag;
    }
    
    $loop++;
}

print "$sum\n";

__END__

Explanation

If you consider each of the four diagonals radiating from the center separately
then you can determine that for each new layer (n) of the spiral the lower right
corner is equal to [[ n * ( n - 3 ) + 3 ]].  Moving clockwise the remaining
corners can be found by adding [[ n - 1 ]] to the previous corner.
