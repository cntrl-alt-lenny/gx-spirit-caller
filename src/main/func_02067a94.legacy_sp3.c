/* The runtime returns quotient in the low word and remainder in the high word. */
extern unsigned long long func_020b3a7c(unsigned int dividend, unsigned int divisor);
unsigned char func_02067a94(unsigned char *table, unsigned char limit,
                          unsigned char *key, unsigned int length,
                          unsigned char *state, unsigned int *index)
{
    unsigned int count;
    unsigned int mask;
    unsigned int value;
    if (limit == 0) return 0;
    count = 0;
    mask = 1;
    while (mask < limit) mask = (mask << 1) + 1;
    do {
        count++;
        *state = table[*state] + key[(*index)++];
        if (*index >= length) {
            *index = 0;
            *state += length;
        }
        value = mask & *state;
        if (count > 11) value = func_020b3a7c(value, limit) >> 32;
    } while (value > limit);
    return value;
}

