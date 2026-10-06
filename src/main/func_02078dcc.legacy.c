void func_02078dcc(unsigned char *ctx, unsigned char *data, int length)
{
    int offset;
    unsigned char i = ctx[0], j = ctx[1];
    unsigned char *table = ctx+2;
    for (offset = 0; offset < length; offset++) {
        unsigned char a, b;
        i++;
        a = table[i];
        j += a;
        b = table[j];
        table[i] = b;
        table[j] = a;
        data[offset] ^= table[(unsigned char)(a+b)];
    }
    ctx[0] = i; ctx[1] = j;
}
