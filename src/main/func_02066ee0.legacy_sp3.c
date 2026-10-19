extern void func_02067140(unsigned char *a, unsigned char *b);
extern long long func_020b3870(int numerator, int denominator);

void func_02066ee0(unsigned char *key, int keylen, unsigned char *data, int len) {
    unsigned char s[256];
    short n;
    unsigned char k, j, i;
    for (n = 0; n < 256; n++) s[n] = n;
    k = 0;
    j = 0;
    for (n = 0; n < 256; n++) {
        j = (j + (s[n] + key[k])) % 256;
        k = (int)(func_020b3870(k + 1, keylen) >> 32);
        func_02067140(&s[n], &s[j]);
    }
    k = 0;
    j = 0;
    for (n = 0; n < len; n++) {
        k = (k + data[n] + 1) % 256;
        j = (s[k] + j) % 256;
        func_02067140(&s[k], &s[j]);
        data[n] ^= s[(unsigned char)((s[k] + s[j]) % 256)];
    }
}

