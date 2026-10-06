extern char data_020ffaac[];

void func_0205340c(unsigned long long v, int bits, char *out) {
    int n = (bits + 4) / 5;
    int i;
    char *tbl = data_020ffaac;

    for (i = 0; i < n; i++) {
        *(out + n - 1 - i) = tbl[v & 0x1f];
        v >>= 5;
    }
    out[n] = 0;
}
