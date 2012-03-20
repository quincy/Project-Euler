#!/usr/bin/perl

# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
# words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and 
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
# letters. The use of "and" when writing out numbers is in compliance with British usage.

use strict;
use warnings;

my %words = (
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
   10 => 'ten',
   11 => 'eleven',
   12 => 'twelve',
   13 => 'thirteen',
   14 => 'fourteen',
   15 => 'fifteen',
   16 => 'sixteen',
   17 => 'seventeen',
   18 => 'eighteen',
   19 => 'nineteen',
   20 => 'twenty',
   30 => 'thirty',
   40 => 'forty',
   50 => 'fifty',
   60 => 'sixty',
   70 => 'seventy',
   80 => 'eighty',
   90 => 'ninety',
  100 => 'onehundred',
  200 => 'twohundred',
  300 => 'threehundred',
  400 => 'fourhundred',
  500 => 'fivehundred',
  600 => 'sixhundred',
  700 => 'sevenhundred',
  800 => 'eighthundred',
  900 => 'ninehundred',
 1000 => 'onethousand',
);

my $string = q{};

foreach my $num ( 1..1000 )
{
    if ( exists $words{$num} )
    {
        print "$words{$num}\n";
        $string .= $words{$num};
    }
    else
    {
        my $newstring = '';
        my @places = split //, $num;

        if ( scalar @places < 3 )
        {
            unshift @places, 0;
        }

        my $hundreds = $places[0] * 100;
        my $tens;

        if ( $places[1] != 1 )
        {
            $tens = $places[1] * 10;
        }
        else
        {
            $tens = $places[1] . $places[2];
            pop @places;
        }

        if ( $hundreds )
        {
            $newstring .= $words{$hundreds} . "and";
        }

        if ( $tens )
        {
            $newstring .= $words{$tens};
        }

        if ( $places[2] )
        {
            $newstring .= $words{$places[2]};
        }
        
        print "$newstring\n";

        $string .= $newstring;
    }

}

print "$string = " . length( $string ) . " characters.\n";
