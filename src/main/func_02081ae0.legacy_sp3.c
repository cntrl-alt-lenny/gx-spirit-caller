typedef struct {
    unsigned char *p;
    signed char bits;
    unsigned char cur;
} BitReader;

int func_02081ae0(BitReader *s, int n)
{
    int bits = s->bits;
    unsigned int cur = s->cur;
    unsigned int r;
    int k;
    if (bits < n) {
        unsigned char *p = s->p;
        k = n - bits;
        s->p = p + 1;
        r = cur << k;
        s->cur = *p;
        s->bits = 8;
        r |= func_02081ae0(s, k);
    } else {
        k = bits - n;
        r = cur >> k;
        s->bits = k;
    }
    return r & (0xff >> (8 - n));
}
