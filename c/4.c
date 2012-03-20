/*
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */

#include <stdio.h>

#define MIN 100
#define MAX 999

int is_palindrome(int num);

int main()
{
    int a, b, p;
    int largest = 0;

    for ( a=MAX; a>MIN; a-- )
    {
        for ( b=MAX; b>MIN; b-- )
        {
            p = a * b;

            if ( is_palindrome(p) && p > largest )
            {
                printf("%d\n", p);
                largest = p;
            }
        }
    }

    printf("Largest palindrome = %d\n", largest);

    return 0;
}

int is_palindrome(int num)
{
	int new = 0;;
	int i = 0;
	int t;

	printf("num = %i\n", num);
	printf("new = %i\n", new);

	while ( i < sizeof(int))
	{
		t = num & 0xF;
		num >>= sizeof(char);
		new <<= sizeof(char);
		new = new | t;
		i++;
	}

    return 0;
}

