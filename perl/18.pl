#!/usr/bin/perl
# Problem:
# By starting at the top of the triangle below and moving to adjacent numbers on
# the row below, the maximum total from top to bottom is 23.
#
# 3
# 7 5
# 2 4 6
# 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
# 
# Find the maximum total from top to bottom of the triangle below:
# 
# 75
# 95 64
# 17 47 82
# 18 35 87 10
# 20 04 82 47 65
# 19 01 23 75 03 34
# 88 02 77 73 07 63 67
# 99 65 04 28 06 16 70 92
# 41 41 26 56 83 40 80 70 33
# 41 48 72 33 47 32 37 16 94 29
# 53 71 44 65 25 43 91 52 97 51 14
# 70 11 33 28 77 73 17 78 39 68 17 57
# 91 71 52 38 17 14 91 43 58 50 27 29 48
# 63 66 04 68 89 53 67 30 73 16 69 87 40 31
# 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
#
# NOTE: As there are only 16384 routes, it is possible to solve this problem by 
# trying every route. However, Problem 67, is the same challenge with a triangle
# containing one-hundred rows; it cannot be solved by brute force, and requires a 
# clever method! ;o) 

use strict;
use warnings;

my @rows    = ();
my @max_sum = (
    [ 75 ],
);

my $triangle = do{ local $/; <DATA> };

my @split_tri = split /\n/, $triangle;

for( my $i = 0; $i < scalar @split_tri; $i++ )
{
    my @new_row = split /\s+/, $split_tri[$i];

    $rows[$i] = [@new_row];
}

print $max_sum[0][0] . "\n";

for( my $i = 1; $i < scalar @rows; $i++ )
{
    for( my $e = 0; $e < scalar @{ $rows[$i] }; $e++ )
    {
        if ( $e == 0 )
        {
            $max_sum[$i][$e] = $max_sum[$i-1][$e] + $rows[$i][$e];
            print $max_sum[$i][$e] . " ";
        }
        elsif ( $e == scalar( @{ $rows[$i] } ) - 1 )
        {
            $max_sum[$i][$e] = $max_sum[$i-1][$e-1] + $rows[$i][$e];
            print $max_sum[$i][$e] . " ";
        }
        else
        {
            $max_sum[$i][$e] = max( $max_sum[$i-1][$e] + $rows[$i][$e], $max_sum[$i-1][$e-1] + $rows[$i][$e] );
            print $max_sum[$i][$e] . " ";
        }
    }

    print "\n";
}

my $max = max( @{ $max_sum[-1] } );

print "\n$max\n";

sub max
{
    my @nums = @_;

    my ( $max ) = reverse sort {$a <=> $b} @_;

    return $max;
}


__DATA__
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
