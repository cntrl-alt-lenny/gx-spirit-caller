/* func_02067984: RC4-style key schedule. keylen==0 defers to
 * func_02067a4c(). Otherwise inits sbox[0..255]=i, then for j=255..0 calls
 * func_02067a94 (an externalized j-accumulator step) to get a swap index
 * and swaps sbox[j]/sbox[idx]. Finally derives 5 extra bytes at
 * sbox[0x100..0x104] from early sbox entries. */
extern void func_02067a4c(void);
extern int func_02067a94(unsigned char *sbox, int j, unsigned char *key,
                          unsigned int keylen, unsigned char *out8, int *outc);

void func_02067984(unsigned char *sbox, unsigned char *key, unsigned int keylen) {
    int i;
    int j;
    int local_c;
    unsigned char local_8;

    if (keylen < 1) {
        func_02067a4c();
        return;
    }

    for (i = 0; i < 0x100; i++) {
        sbox[i] = (unsigned char)i;
    }

    local_c = 0;
    local_8 = 0;

    for (j = 0xff; j >= 0; j--) {
        int idx = func_02067a94(sbox, j, key, keylen, &local_8, &local_c);
        unsigned char sj = sbox[j];
        unsigned char sidx = sbox[idx];
        sbox[j] = sidx;
        sbox[idx] = sj;
    }

    sbox[0x100] = sbox[1];
    sbox[0x101] = sbox[3];
    sbox[0x102] = sbox[5];
    sbox[0x103] = sbox[7];
    sbox[0x104] = sbox[local_8];
    local_8 = 0;
    local_c = 0;
}
