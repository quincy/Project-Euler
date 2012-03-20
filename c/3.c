/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * 
 * What is the largest prime factor of the number 600851475143 ?
 */

#include <stdio.h>

/*
 * This algorithm starts with 2 as a divisor and repeatedly
 * divides num by the divisor until it is no longer evenly
 * divisible.  It then increments the divisor and repeats.
 * Because of this, only divisors which are prime will ever
 * be able to evenly divide num and thus, the last divisor
 * used will be the largest prime factor of num.
 */
int main()
{
    long long num = 600851475143LL;
    int i = 2;

    for ( i=2; num>1; i++ )
    {
        while ( num % i == 0 )
        {
            num /= i;
        }
    }

    printf("Largest factor = %d\n", --i);

    return 0;
}

