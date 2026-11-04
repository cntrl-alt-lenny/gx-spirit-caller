void func_02078e3c(unsigned char *ctx, unsigned char *key, int length)
{
    unsigned char *table;
    int i;
    unsigned char j, k;
    ctx[0] = 0;
    ctx[1] = 0;
    table = ctx + 2;
    for (i = 0; i < 0x100; i++) {
        table[i] = i;
    }
    k = 0;
    j = 0;
    for (i = 0; i < 0x100; i++) {
        int a;
        a = table[i];
        j += a + key[k];
        k++;
        table[i] = table[j];
        table[j] = a;
        if (k >= length) k = 0;
    }
}





