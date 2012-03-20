#!/usr/bin/perl
# Problem:
# 2520 is the smallest number that can be divided by each of the numbers from 
# 1 to 10 without any remainder.
#
# What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?

while ( <DATA> )
{
    print;
}

__DATA__
Problem:
2520 is the smallest number that can be divided by each of the numbers from 
1 to 10 without any remainder.

What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?

Answer:
To solve simply find the prime factorization of each of the numbers 1-20.

20 = 2^2 * 5
19 = 19
18 = 2 * 3^2
17 = 17
16 = 2^4
15 = 3 * 5
14 = 2 * 7
13 = 13
11 = 11 

The prime factors for 1-10 are included in the numbers 1-20 so we don't need to repeat them.

Now multiply the greatest factor from each set of factors together to get the answer.

2^4 * 3^2 * 5 * 7 * 11 * 13 * 17 * 19 = 232,792,560
